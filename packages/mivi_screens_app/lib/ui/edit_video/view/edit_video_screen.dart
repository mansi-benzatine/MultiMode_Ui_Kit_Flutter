import 'package:flutter/material.dart';
import 'package:mivi_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_screens_app/ui/add_music/view/add_music_screen.dart';
import 'package:mivi_screens_app/ui/choose_media/datamodel/choose_media_data.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/adjust_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/background_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/canvas_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/clip_track_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/effect_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/filter_selector_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/music_waves_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/speed_roller_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/stickers_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/text_edit_tool_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/tools_bottom_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/transition_view.dart';
import 'package:mivi_screens_app/ui/edit_video/pages/volume_view.dart';
import 'package:mivi_screens_app/ui/edit_video/widget/rotation_line_view.dart';
import 'package:mivi_screens_app/ui/edit_video/widget/timeline_view.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

import '../../../widgets/bottom_sheet/export_video_bottom_sheet.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../pages/split_view.dart';
import '../pages/text_track_view.dart';
import '../widget/font_picker_view.dart';

class EditVideoScreen extends StatefulWidget {
  final int currentIndex;
  final List<MediaModel> imageList;
  final bool isShowExportVideoBs;
  final bool isShowLoader;

  static Route<void> route({
    required List<MediaModel> imageList,
    int currentIndex = -1,
    bool isShowExportVideoBs = false,
    bool isShowLoader = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => EditVideoScreen(
        imageList: imageList,
        currentIndex: currentIndex,
        isShowExportVideoBs: isShowExportVideoBs,
        isShowLoader: isShowLoader,
      ),
    );
  }

  const EditVideoScreen({
    super.key,
    required this.imageList,
    this.currentIndex = -1,
    this.isShowExportVideoBs = false,
    this.isShowLoader = false,
  });

  @override
  State<EditVideoScreen> createState() => _EditVideoScreenState();
}

class _EditVideoScreenState extends State<EditVideoScreen> implements TopBarClickListener {
  bool isSelected = false;
  bool showCanvasView = false;
  bool showBgView = false;
  bool showTextView = false;
  bool showStickerView = false;
  bool showTrimView = false;
  bool showSplitView = false;
  bool showCropView = false;
  bool showSpeedView = false;
  bool showFilterView = false;
  bool showTransitionView = false;
  bool showVolumeView = false;
  bool showAdjustView = false;
  double brightnessValue = 0.5;

  bool showTextEditor = false;
  String enteredText = "My Day";
  TextStyle currentTextStyle = const TextStyle(color: Colors.white, fontSize: 36);
  TextEditingController textController = TextEditingController();
  FocusNode textFocusNode = FocusNode();

  String selectedFont = 'Poppins';

  Color selectedColor = Colors.white;
  TextAlign selectedAlign = TextAlign.center;
  double fontSize = 32;
  double letterSpacing = 0;
  double lineHeight = 1.2;
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    if (widget.currentIndex == -1) {
    } else if (widget.currentIndex == 0) {
      showCanvasView = true;
    } else if (widget.currentIndex == 1) {
      showBgView = true;
    } else if (widget.currentIndex == 2) {
      showTextView = true;
    } else if (widget.currentIndex == 3) {
      showStickerView = true;
    } else if (widget.currentIndex == 4) {
      showTrimView = true;
    } else if (widget.currentIndex == 5) {
      showTrimView = true;
    } else if (widget.currentIndex == 6) {
      showSplitView = true;
    } else if (widget.currentIndex == 7) {
      showCropView = true;
    } else if (widget.currentIndex == 8) {
      showSpeedView = true;
    } else if (widget.currentIndex == 9) {
      showFilterView = true;
    } else if (widget.currentIndex == 10) {
      showTransitionView = true;
    } else if (widget.currentIndex == 11) {
      showVolumeView = true;
    } else if (widget.currentIndex == 12) {
      showAdjustView = true;
    } else if (widget.currentIndex == 13) {
      showTextEditor = true;
    }

    if (widget.isShowExportVideoBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          backgroundColor: const Color(0xFF0E0F14),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) {
            return ExportVideoContent(
              parentContext: context,
              isShowLoader: widget.isShowLoader,
            );
          },
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).black,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: false,
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Image.asset(
                        widget.imageList.first.image,
                        width: double.infinity,
                        height: 480.setHeight,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: showCanvasView || showTransitionView || showVolumeView || showBgView || showTextView || showSplitView || showCropView || showSpeedView || showFilterView || showAdjustView
                              ? 0.screenHeight / 1.6
                              : 0.screenHeight / 1.8,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              showTextEditor = true;
                              textController.text = enteredText;
                              Future.delayed(const Duration(milliseconds: 200), () {
                                if (context.mounted) {
                                  FocusScope.of(context).requestFocus(textFocusNode);
                                }
                              });
                            });
                          },
                          child: Center(
                            child: Text(
                              enteredText,
                              textAlign: selectedAlign,
                              style: currentTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: TopBar(
                          this,
                          appBarColor: Colors.transparent,
                          isShowBack: true,
                          title: "",
                          isShowUpload: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    )),
                    child: child,
                  ),
                  child: Column(
                    children: [
                      if (showTextEditor)
                        TextEditToolView(
                          onDone: () {
                            setState(() => showTextEditor = false);
                          },
                          onStyleChanged: (style) {
                            setState(() => currentTextStyle = style);
                          },
                        ),
                      if (!showTextEditor)
                        (showCanvasView
                            ? _buildCanvasOptionsView()
                            : showBgView
                                ? _buildBackgroundOptionsView()
                                : showTextView
                                    ? _buildTextOptionsView()
                                    : showStickerView
                                        ? _buildStickerOptionsView()
                                        : showTrimView
                                            ? _buildTrimOptionsView()
                                            : showSplitView
                                                ? _buildSplitOptionsView()
                                                : showCropView
                                                    ? _buildCropOptionsView()
                                                    : showSpeedView
                                                        ? _buildSpeedOptionsView()
                                                        : showFilterView
                                                            ? _buildFilterOptionsView()
                                                            : showTransitionView
                                                                ? _buildTransitionOptionsView()
                                                                : showVolumeView
                                                                    ? _buildVolumeOptionsView()
                                                                    : showAdjustView
                                                                        ? _buildAdjustOptionsView()
                                                                        : initialView()),
                      (showCanvasView ||
                              showBgView ||
                              showAdjustView ||
                              showTextView ||
                              showTextEditor ||
                              showStickerView ||
                              showSpeedView ||
                              showVolumeView ||
                              showTrimView ||
                              showSplitView ||
                              showCropView ||
                              showFilterView ||
                              showTransitionView)
                          ? const SizedBox()
                          : _buildToolBarView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCanvasOptionsView() {
    return Container(
      key: const ValueKey('canvas'),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15.setHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showCanvasView = false),
                  ),
                ),
                CommonText(
                  text: "Canvas",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showCanvasView = false),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const CanvasView(),
        ],
      ),
    );
  }

  Widget _buildCropOptionsView() {
    return Container(
      key: const ValueKey('crop'),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15.setHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showCropView = false),
                  ),
                ),
                CommonText(
                  text: "Crop",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showCropView = false),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.setHeight),
          const RotationLineView(
            totalDuration: 30,
            pixelsPerSecond: 15,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: const Color(0xFF2B2C34), borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setWidth),
                child: Image.asset(
                  AppAssets.icRightRotate,
                  height: 24.setHeight,
                ),
              ),
              SizedBox(width: 12.setWidth),
              Container(
                decoration: BoxDecoration(color: const Color(0xFF2B2C34), borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setWidth),
                child: Image.asset(
                  AppAssets.icLeftRotate,
                  height: 24.setHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35.setHeight,
                  width: 1.setWidth,
                  color: const Color(0xFF2B2C34),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: const Color(0xFF2B2C34), borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setWidth),
                child: Image.asset(
                  AppAssets.icVerticalCompress,
                  height: 22.setHeight,
                ),
              ),
              SizedBox(width: 12.setWidth),
              Container(
                decoration: BoxDecoration(color: const Color(0xFF2B2C34), borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setWidth),
                child: Image.asset(
                  AppAssets.icHorizontalCompress,
                  height: 22.setHeight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSpeedOptionsView() {
    return Container(
      key: const ValueKey('Speed'),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showSpeedView = false),
                  ),
                ),
                CommonText(
                  text: "Speed",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showSpeedView = false),
                  ),
                ),
              ],
            ),
          ),
          SpeedSelectorView(imageList: widget.imageList),
        ],
      ),
    );
  }

  Widget _buildVolumeOptionsView() {
    return Container(
      key: const ValueKey('Volume'),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showVolumeView = false),
                  ),
                ),
                CommonText(
                  text: "Volume",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showVolumeView = false),
                  ),
                ),
              ],
            ),
          ),
          VolumeSelectorView(imageList: widget.imageList),
        ],
      ),
    );
  }

  Widget _buildAdjustOptionsView() {
    return Container(
      key: const ValueKey('Adjust'),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showAdjustView = false),
                  ),
                ),
                CommonText(
                  text: "Adjust",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showAdjustView = false),
                  ),
                ),
              ],
            ),
          ),
          EditorAdjustmentScreen(imageList: widget.imageList),
        ],
      ),
    );
  }

  Widget _buildTransitionOptionsView() {
    return Container(
      key: const ValueKey('Transition'),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showTransitionView = false),
                  ),
                ),
                CommonText(
                  text: "Transition",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showTransitionView = false),
                  ),
                ),
              ],
            ),
          ),
          const TransitionSelectorView(),
        ],
      ),
    );
  }

  Widget _buildFilterOptionsView() {
    return Container(
      key: const ValueKey('Filter'),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    onPressed: () => setState(() => showFilterView = false),
                  ),
                ),
                CommonText(
                  text: "Filter",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showFilterView = false),
                  ),
                ),
              ],
            ),
          ),
          FilterSelectorView(imageList: widget.imageList),
        ],
      ),
    );
  }

  Widget _buildStickerOptionsView() {
    return Container(
      key: const ValueKey('Sticker'),
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(AppAssets.icUndo, width: 20.setWidth, height: 20.setHeight),
                    onPressed: () => setState(() => showStickerView = false),
                  ),
                ),
                CommonText(
                  text: "Sticker",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: () => setState(() => showStickerView = false),
                  ),
                ),
              ],
            ),
          ),
          const StickersView(),
        ],
      ),
    );
  }

  Widget _buildTrimOptionsView() {
    final tabs = ["Trim", "Cut"];
    int selectedTab = 0;

    return Column(
      children: [
        actionRowView(),
        SizedBox(height: 10.setHeight),
        Container(
          height: 360,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).black,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: CustomAppColor.of(context).white,
                      ),
                      onPressed: () => setState(() => showTrimView = false),
                    ),
                  ),
                  CommonText(
                    text: "Trim",
                    textColor: Colors.white,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: IconButton(
                      icon: const Icon(Icons.check, color: Colors.white),
                      onPressed: () => setState(() => showTrimView = false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(tabs.length, (index) {
                    final isSelected = selectedTab == index;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = index),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white24 : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CommonText(
                            text: tabs[index],
                            textColor: Colors.white,
                            fontFamily: Constant.fontFamilyMedium500,
                            fontSize: 12.setFontSize,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20.setHeight),
              const TimeLineRuler(),
              SizedBox(height: 10.setHeight),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 60.setHeight,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.imageList.length,
                      itemBuilder: (context, index) {
                        final item = widget.imageList[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 4),
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                              image: AssetImage(item.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 30.setWidth,
                    right: 200,
                    top: 0,
                    child: Column(
                      children: [
                        Container(
                          height: 60.setHeight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: CustomAppColor.of(context).secondary,
                                width: 3,
                              ),
                              color: CustomAppColor.of(context).secondary.withValues(alpha: 0.1)),
                        ),
                        SizedBox(height: 6.setHeight),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: "00:02",
                              textColor: Colors.white,
                              fontSize: 12,
                            ),
                            CommonText(
                              text: "00:13",
                              textColor: Colors.white,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.setHeight),
              const Spacer(),
              CommonButton(
                width: 120.setWidth,
                image: AppAssets.icTrim,
                imageColor: CustomAppColor.of(context).black,
                imageSize: 14,
                height: 40.setHeight,
                text: selectedTab == 0 ? "Trim" : "Cut",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSplitOptionsView() {
    return Column(
      children: [
        actionRowView(),
        SizedBox(height: 10.setHeight),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).black,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: CustomAppColor.of(context).white,
                      ),
                      onPressed: () => setState(() => showSplitView = false),
                    ),
                  ),
                  CommonText(
                    text: "Split",
                    textColor: Colors.white,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: IconButton(
                      icon: const Icon(Icons.check, color: Colors.white),
                      onPressed: () => setState(() => showSplitView = false),
                    ),
                  ),
                ],
              ),
              SplitView(imageList: widget.imageList),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackgroundOptionsView() {
    return Container(
      key: const ValueKey('bg'),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.setHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      color: Colors.white,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    onPressed: () => setState(() => showBgView = false),
                  ),
                ),
                CommonText(
                  text: "Background",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                Row(
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: IconButton(
                        icon: const Icon(Icons.check, color: Colors.white, size: 22),
                        onPressed: () => setState(() => showBgView = false),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const BackgroundView(),
        ],
      ),
    );
  }

  Widget _buildTextOptionsView() {
    return Container(
      key: const ValueKey('text'),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.setHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: IconButton(
                    icon: Image.asset(
                      AppAssets.icUndo,
                      color: Colors.white,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    onPressed: () => setState(() => showTextView = false),
                  ),
                ),
                CommonText(
                  text: "Add Text",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                Row(
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: IconButton(
                        icon: const Icon(Icons.check, color: Colors.white, size: 22),
                        onPressed: () => setState(() {
                          showTextView = false;
                          FocusScope.of(context).unfocus();
                          setState(() {
                            showTextEditor = false;
                            TextEditToolView(
                              onDone: () {
                                setState(() => showTextEditor = false);
                              },
                            );
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          FontPickerView(
            controller: textController,
            focusNode: textFocusNode,
            onFontSelected: (selectedStyle) {
              setState(() {
                currentTextStyle = selectedStyle.copyWith(color: Colors.white, fontSize: 36);
              });
            },
            onTextChanged: (value) {
              setState(() => enteredText = value);
            },
            onDone: () {
              FocusScope.of(context).unfocus();
              setState(() => showTextEditor = false);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildToolBarView() {
    return Container(
      key: const ValueKey('toolbar'),
      alignment: Alignment.topCenter,
      color: const Color(0xFF1D1E26),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IgnorePointer(
          ignoring: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ToolButton(
                icon: AppAssets.icCanvas,
                label: "Canvas",
                onTap: () {
                  setState(() {
                    showCanvasView = true;
                  });
                },
              ),
              ToolButton(
                  icon: AppAssets.icBg,
                  label: "BG",
                  onTap: () {
                    setState(() {
                      showBgView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icFilter,
                  label: "Filter",
                  onTap: () {
                    setState(() {
                      showFilterView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icText,
                  label: "Text",
                  onTap: () {
                    setState(() {
                      showTextView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icMusic,
                  label: "Music",
                  onTap: () {
                    Navigator.push(context, AddMusicScreen.route());
                  }),
              ToolButton(
                  icon: AppAssets.icSticker,
                  label: "Sticker",
                  onTap: () {
                    setState(() {
                      showStickerView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icTrim,
                  label: "Trim",
                  onTap: () {
                    setState(() {
                      showTrimView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icSplit,
                  label: "Split",
                  onTap: () {
                    setState(() {
                      showSplitView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icCrop,
                  label: "Crop",
                  onTap: () {
                    setState(() {
                      showCropView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icSpeed,
                  label: "Speed",
                  onTap: () {
                    setState(() {
                      showSpeedView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icTransition,
                  label: "Transition",
                  onTap: () {
                    setState(() {
                      showTransitionView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icVolume,
                  label: "Volume",
                  onTap: () {
                    setState(() {
                      showVolumeView = true;
                    });
                  }),
              ToolButton(
                  icon: AppAssets.icAdjust,
                  label: "Adjust",
                  onTap: () {
                    setState(() {
                      showAdjustView = true;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget initialView() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            actionRowView(),
            SizedBox(height: 10.setHeight),
            const TimeLineRuler(totalDuration: 30, pixelsPerSecond: 15),
            const TextTrackView(labels: ["My Day", "", "Tasty Food"]),
            SizedBox(height: 10.setHeight),
            ClipTrackView(list: widget.imageList),
            SizedBox(height: 10.setHeight),
            EffectView(effects: [
              const {
                'label': '',
                'icon': Icons.people,
                'color': Color(0xFF040510),
                "width": 100.2,
              },
              {
                'label': 'Sunset',
                'icon': AppAssets.icFilter,
                'color': const Color(0xFF93D5E1),
                "width": 143.2,
              },
              {
                'label': 'Foodie',
                'icon': AppAssets.icSticker,
                'color': const Color(0xFFA7B0DA),
                "width": 153.2,
              },
              {
                'label': 'Party',
                'icon': AppAssets.icFilter,
                'color': Colors.purpleAccent.shade100,
                "width": 163.3,
              },
            ]),
            SizedBox(height: 10.setHeight),
            Padding(
              padding: EdgeInsets.only(left: 10.setWidth),
              child: MusicWavesView(
                height: 50.setHeight,
                color: const Color(0xFFF7A3A3),
              ),
            ),
            SizedBox(height: 10.setHeight),
          ],
        ),
        Positioned(
          left: 120,
          top: 70.setHeight,
          bottom: 0,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).secondary,
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).white,
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(-10, 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget actionRowView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: SizedBox(
        width: 0.screenWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: "00:25",
                  textColor: CustomAppColor.of(context).white,
                  fontSize: 10.setFontSize,
                ),
                CommonText(
                  text: " / 01:25",
                  textColor: CustomAppColor.of(context).txtLightGrey,
                  fontSize: 10.setFontSize,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(AppAssets.icUndo, width: 18.setWidth, height: 18.setHeight),
                    Image.asset(AppAssets.icRedo, width: 18.setWidth, height: 18.setHeight),
                  ],
                ),
                Image.asset(AppAssets.icPlay, width: 18.setWidth, height: 18.setHeight),
                Row(
                  children: [
                    Image.asset(AppAssets.icFullview, width: 18.setWidth, height: 18.setHeight),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strUpload) {
      showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xFF0E0F14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) {
          return ExportVideoContent(
            parentContext: context,
          );
        },
      );
    }
  }
}
