import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_scanner_app_package/interfaces/top_bar_click_listener.dart';
import 'package:qr_scanner_app_package/localization/language/languages.dart';
import 'package:qr_scanner_app_package/utils/app_color.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_app_package/utils/utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/debug.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with WidgetsBindingObserver implements TopBarClickListener {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  bool _isFlashOn = false;
  bool _hasInitialized = false;
  List<CameraDescription> _cameras = [];
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Don't initialize camera here - wait for screen to be visible
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && !_hasInitialized) {
      _initializeCamera();
    }
  }

  void _checkAndInitializeCamera() {
    if (!_hasInitialized && mounted) {
      _hasInitialized = true;
      _initializeCamera();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      Debug.printLog('ScanScreen: Starting camera initialization');
      _hasInitialized = true;

      // Check current permission status first
      final currentStatus = await Permission.camera.status;
      Debug.printLog('ScanScreen: Current camera permission status: $currentStatus');

      // Request camera permission
      final cameraPermission = await Permission.camera.request();
      Debug.printLog('ScanScreen: Camera permission request result: $cameraPermission');

      if (cameraPermission != PermissionStatus.granted) {
        Debug.printLog('ScanScreen: Camera permission denied - $cameraPermission');
        if (mounted) {
          setState(() {
            // Show permission denied state
          });
        }
        return;
      }

      Debug.printLog('ScanScreen: Getting available cameras');
      _cameras = await availableCameras();
      Debug.printLog('ScanScreen: Found ${_cameras.length} cameras');

      if (_cameras.isNotEmpty) {
        Debug.printLog('ScanScreen: Initializing camera controller');
        _cameraController = CameraController(
          _cameras.first,
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _cameraController!.initialize();
        Debug.printLog('ScanScreen: Camera controller initialized successfully');

        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
          Debug.printLog('ScanScreen: Camera state updated');
        }
      } else {
        Debug.printLog('ScanScreen: No cameras available');
      }
    } catch (e) {
      Debug.printLog('ScanScreen: Error initializing camera: $e');
      if (mounted) {
        setState(() {
          // Show error state
        });
      }
    }
  }

  Future<void> _toggleFlash() async {
    if (_cameraController == null || !_isCameraInitialized) return;

    try {
      if (_isFlashOn) {
        await _cameraController!.setFlashMode(FlashMode.off);
      } else {
        await _cameraController!.setFlashMode(FlashMode.torch);
      }
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
    } catch (e) {
      Debug.printLog('Error toggling flash: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      // Request photo library permission
      final photosPermission = await Permission.photos.request();
      if (photosPermission != PermissionStatus.granted) {
        Debug.printLog('Photos permission denied');
        return;
      }

      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        Debug.printLog('Image selected from gallery: ${image.path}');
        // Here you can process the selected image for QR code scanning
        // For now, just log the selection
      }
    } catch (e) {
      Debug.printLog('Error picking image from gallery: $e');
    }
  }

  Future<void> _flipCamera() async {
    if (_cameraController == null || !_isCameraInitialized || _cameras.length < 2) return;

    try {
      // Find the index of the current camera
      int currentIndex = _cameras.indexWhere((c) => c.lensDirection == _cameraController!.description.lensDirection);
      // Switch to the next camera (loop back to 0 if at the end)
      int nextIndex = (currentIndex + 1) % _cameras.length;

      await _cameraController!.dispose();
      _cameraController = CameraController(
        _cameras[nextIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );
      await _cameraController!.initialize();

      setState(() {
        // Update state to reflect camera change
      });
    } catch (e) {
      Debug.printLog('Error flipping camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize camera when widget is built and visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndInitializeCamera();
    });

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtScan),
            Expanded(
              child: Stack(
                children: [
                  // Camera Preview
                  if (_isCameraInitialized && _cameraController != null)
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: CameraPreview(_cameraController!),
                    )
                  else
                    Container(
                      color: CustomAppColor.of(context).primary,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: CustomAppColor.of(context).white,
                            ),
                            SizedBox(height: 16.setHeight),
                            CommonText(
                              text:
                                  _hasInitialized ? Languages.of(context).txtInitializingCamera : Languages.of(context).txtRequestingCameraPermission,
                              textColor: CustomAppColor.of(context).white,
                              fontSize: 16.setHeight,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Scanning Overlay
                  _buildScanningOverlay(),

                  // Camera Options
                  _buildCameraOptions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanningOverlay() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // Dark overlay with transparent square
          CustomPaint(
            size: Size.infinite,
            painter: ScanningOverlayPainter(context),
          ),

          // Scanning guide text
          Positioned(
            top: 100.setHeight,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CommonText(
                  text: Languages.of(context).txtPutTheQrOrBarcodeInsideRectangleBoxToScan,
                  textColor: CustomAppColor.of(context).white,
                  fontSize: 13.setHeight,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraOptions() {
    return Positioned(
      bottom: 60.setHeight,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            borderRadius: BorderRadius.circular(30.setHeight),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Flash Toggle
                _buildOptionButton(
                  icon: _isFlashOn
                      ? Icon(Icons.flash_on, color: CustomAppColor.of(context).white)
                      : Icon(Icons.flash_off, color: CustomAppColor.of(context).white),
                  isActive: _isFlashOn,
                  onTap: _toggleFlash,
                ),
                SizedBox(width: 15.setWidth),

                VerticalDivider(
                  width: 1.setWidth,
                  thickness: 1.setHeight,
                  indent: 5.setWidth,
                  endIndent: 5.setWidth,
                  color: CustomAppColor.of(context).txtWhite.withOpacityPercent(0.25),
                ),
                SizedBox(width: 20.setWidth),

                // Flip Camera
                _buildOptionButton(
                  icon: Image.asset(AppAssets.icFlipCamera),
                  isActive: false,
                  onTap: _flipCamera,
                ),
                SizedBox(width: 20.setWidth),
                VerticalDivider(
                  width: 1.setWidth,
                  thickness: 1.setHeight,
                  indent: 5.setWidth,
                  endIndent: 5.setWidth,
                  color: CustomAppColor.of(context).txtWhite.withOpacityPercent(0.25),
                ),
                SizedBox(width: 20.setWidth),
                // Gallery Picker
                _buildOptionButton(
                  icon: Image.asset(AppAssets.icGallery),
                  isActive: false,
                  onTap: _pickImageFromGallery,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton({
    required Widget icon,
    required bool isActive,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 30.setWidth,
        height: 30.setWidth,
        child: icon,
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    // Handle top bar clicks if needed
  }
}

class ScanningOverlayPainter extends CustomPainter {
  final BuildContext context;

  ScanningOverlayPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacityPercent(0.6)
      ..style = PaintingStyle.fill;

    final scanAreaSize = size.width * 0.7;
    final left = (size.width - scanAreaSize) / 2;
    final top = (size.height - scanAreaSize) / 2;
    final right = left + scanAreaSize;
    final bottom = top + scanAreaSize;

    // Draw overlay with cutout
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(left, top, right, bottom),
        const Radius.circular(12),
      ))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);

    // Draw corner borders
    final borderPaint = Paint()
      ..color = CustomAppColor.of(context).primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    const cornerLength = 20.0;

    // Top-left corner
    canvas.drawLine(Offset(left, top + cornerLength), Offset(left, top), borderPaint);
    canvas.drawLine(Offset(left, top), Offset(left + cornerLength, top), borderPaint);

    // Top-right corner
    canvas.drawLine(Offset(right - cornerLength, top), Offset(right, top), borderPaint);
    canvas.drawLine(Offset(right, top), Offset(right, top + cornerLength), borderPaint);

    // Bottom-left corner
    canvas.drawLine(Offset(left, bottom - cornerLength), Offset(left, bottom), borderPaint);
    canvas.drawLine(Offset(left, bottom), Offset(left + cornerLength, bottom), borderPaint);

    // Bottom-right corner
    canvas.drawLine(Offset(right - cornerLength, bottom), Offset(right, bottom), borderPaint);
    canvas.drawLine(Offset(right, bottom), Offset(right, bottom - cornerLength), borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
