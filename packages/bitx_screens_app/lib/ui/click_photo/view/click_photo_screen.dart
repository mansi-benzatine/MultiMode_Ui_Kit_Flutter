import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/debug.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class ClickPhotoScreen extends StatefulWidget {
  const ClickPhotoScreen({super.key, this.isSelfie = false});

  final bool isSelfie;

  @override
  State<ClickPhotoScreen> createState() => _ClickPhotoScreenState();
}

class _ClickPhotoScreenState extends State<ClickPhotoScreen> implements TopBarClickListener {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isFlashOn = false;
  bool _hasPermission = false;
  bool _isLoading = true;
  String? _errorMessage;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    try {
      Debug.printLog("Requesting camera permission...");
      final status = await Permission.camera.request();
      Debug.printLog("Permission status: $status");

      if (status == PermissionStatus.granted) {
        Debug.printLog("Permission granted, initializing camera...");
        _hasPermission = true;
        await _initializeCamera();
      } else if (status == PermissionStatus.denied) {
        Debug.printLog("Permission denied");
        if (mounted) {
          setState(() {
            _hasPermission = false;
            _isLoading = false;
            _errorMessage = "Camera permission is required to take photos";
          });
        }
      } else if (status == PermissionStatus.permanentlyDenied) {
        Debug.printLog("Permission permanently denied");
        if (mounted) {
          setState(() {
            _hasPermission = false;
            _isLoading = false;
            _errorMessage = "Camera permission is permanently denied. Please enable it in settings.";
          });
        }
      }
    } catch (e) {
      Debug.printLog("Permission request error: $e");
      if (mounted) {
        setState(() {
          _hasPermission = false;
          _isLoading = false;
          _errorMessage = "Error requesting camera permission: $e";
        });
      }
    }
  }

  Future<void> _initializeCamera() async {
    try {
      Debug.printLog("Starting camera initialization...");
      _cameras = await availableCameras();
      Debug.printLog("Available cameras: ${_cameras?.length}");

      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.low,
          enableAudio: false,
        );
        Debug.printLog("Camera controller created, initializing...");

        // Add timeout to prevent hanging
        await _cameraController!.initialize().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw Exception("Camera initialization timed out");
          },
        );
        Debug.printLog("Camera initialized successfully");

        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        Debug.printLog("No cameras available");
        if (mounted) {
          setState(() {
            _isLoading = false;
            _errorMessage = "No cameras available on this device";
          });
        }
      }
    } catch (e) {
      Debug.printLog("Camera initialization error: $e");
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = "Error initializing camera: $e";
        });
      }
    }
  }

  void _openAppSettings() async {
    await openAppSettings();
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        Debug.printLog('Image selected from gallery: ${image.path}');
        Navigator.pop(context, image.path);
      } else {
        Debug.printLog('No image selected from gallery');
      }
    } catch (e) {
      Debug.printLog('Error picking image from gallery: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CommonText(
              text: 'Error selecting image from gallery',
              textColor: CustomAppColor.of(context).txtWhite,
              fontSize: 14.setFontSize,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildCameraPreview() {
    if (_isLoading) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: CustomAppColor.of(context).black,
        child: Center(
          child: CircularProgressIndicator(
            color: CustomAppColor.of(context).txtWhite,
          ),
        ),
      );
    }

    if (_errorMessage != null) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: CustomAppColor.of(context).black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: CustomAppColor.of(context).txtWhite.withValues(alpha: 0.5),
                size: 64,
              ),
              SizedBox(height: 16.setHeight),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CommonText(
                  text: _errorMessage!,
                  textColor: CustomAppColor.of(context).txtWhite,
                  textAlign: TextAlign.center,
                  fontSize: 14.setFontSize,
                ),
              ),
              if (!_hasPermission) ...[
                SizedBox(height: 16.setHeight),
                ElevatedButton(
                  onPressed: _openAppSettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomAppColor.of(context).primary,
                    foregroundColor: CustomAppColor.of(context).txtWhite,
                  ),
                  child: CommonText(
                    text: Languages.of(context).txtOpenSettings,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtWhite,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }

    if (_cameraController != null && _cameraController!.value.isInitialized) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return ClipRRect(
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _cameraController!.value.previewSize!.height,
                  height: _cameraController!.value.previewSize!.width,
                  child: CameraPreview(_cameraController!),
                ),
              ),
            ),
          );
        },
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: CustomAppColor.of(context).black,
      child: Center(
        child: CircularProgressIndicator(
          color: CustomAppColor.of(context).white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
              ),
              Expanded(
                child: Stack(
                  children: [
                    // Camera preview with overlay
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).black,
                      ),
                      child: ClipRRect(
                        child: _buildCameraPreview(),
                      ),
                    ),
                    // Title and subtitle
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            CommonText(
                              text: Languages.of(context).txtPhotoIdCard,
                              fontSize: 24.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).white,
                            ),
                            SizedBox(height: 8.setHeight),
                            CommonText(
                              text: Languages.of(context).txtLoremIpsumShort,
                              fontSize: 14.setFontSize,
                              textColor: CustomAppColor.of(context).white,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom action buttons
                    Positioned(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 40,
                      left: 0,
                      right: 0,
                      child: _actionButtons(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _actionButtons() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Gallery button
          GestureDetector(
            onTap: _pickImageFromGallery,
            child: Container(
              width: 60.setWidth,
              height: 60.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(15.setWidth),
              child: Image.asset(AppAssets.icGallery, width: 24.setWidth, height: 24.setHeight),
            ),
          ),

          // Capture button
          GestureDetector(
            onTap: () async {
              if (_cameraController != null && _cameraController!.value.isInitialized) {
                try {
                  final image = await _cameraController!.takePicture();
                  // Handle captured image
                  Debug.printLog('Photo captured: ${image.path}');
                  Navigator.pop(context, image.path);
                } catch (e) {
                  Debug.printLog('Error capturing photo: $e');
                }
              }
            },
            child: Container(
              width: 80.setWidth,
              height: 80.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(25.setWidth),
              child: Image.asset(AppAssets.icCamera, width: 24.setWidth, height: 24.setHeight),
            ),
          ),

          // Flash toggle button
          GestureDetector(
            onTap: () {
              setState(() {
                _isFlashOn = !_isFlashOn;
              });
              if (_cameraController != null) {
                _cameraController!.setFlashMode(
                  _isFlashOn ? FlashMode.torch : FlashMode.off,
                );
              }
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).primary,
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
              padding: EdgeInsets.all(15.setWidth),
              child: Image.asset(_isFlashOn ? AppAssets.icFlash : AppAssets.icFlashSlash, width: 24.setWidth, height: 24.setHeight),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
