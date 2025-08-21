import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';

class YourHeightPage extends StatefulWidget {
  const YourHeightPage({super.key});

  @override
  State<YourHeightPage> createState() => _YourHeightPageState();
}

class _YourHeightPageState extends State<YourHeightPage> {
  ValueNotifier<int> selectedHeight = ValueNotifier(170);
  late ScrollController _scrollController;
  final int minHeight = 100;
  final int maxHeight = 200;

  // Feet and inches variables
  ValueNotifier<int> selectedFeet = ValueNotifier(5);
  ValueNotifier<int> selectedInches = ValueNotifier(7);
  final int minFeet = 4;
  final int maxFeet = 7;
  final int minInches = 0;
  final int maxInches = 12;

  final double tickSpacing = 15.setHeight;

  ValueNotifier<bool> isCmSelected = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: (selectedHeight.value - minHeight) * tickSpacing,
    );
    selectedHeight.addListener(_onHeightChanged);
    selectedFeet.addListener(_onFeetInchesChanged);
    selectedInches.addListener(_onFeetInchesChanged);
    isCmSelected.addListener(_onUnitChanged);

    // Initialize feet/inches based on default cm value
    _updateFeetInchesFromCm();
  }

  @override
  void dispose() {
    selectedHeight.removeListener(_onHeightChanged);
    selectedFeet.removeListener(_onFeetInchesChanged);
    selectedInches.removeListener(_onFeetInchesChanged);
    isCmSelected.removeListener(_onUnitChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onHeightChanged() {
    if (_scrollController.hasClients && isCmSelected.value) {
      _scrollController.animateTo(
        (selectedHeight.value - minHeight) * tickSpacing,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onFeetInchesScroll() {
    if (_scrollController.hasClients && !isCmSelected.value) {
      final totalInches = (selectedFeet.value * 12) + selectedInches.value;
      final scrollOffset = (totalInches - (minFeet * 12)) * tickSpacing;
      _scrollController.animateTo(
        scrollOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Conversion methods
  void _updateFeetInchesFromCm() {
    double heightInInches = selectedHeight.value / 2.54;
    selectedFeet.value = (heightInInches / 12).floor();
    selectedInches.value = (heightInInches % 12).round();
  }

  void _updateCmFromFeetInches() {
    double totalInches = (selectedFeet.value * 12).toDouble() + selectedInches.value.toDouble();
    selectedHeight.value = (totalInches * 2.54).round();
  }

  void _onFeetInchesChanged() {
    if (!isCmSelected.value) {
      _updateCmFromFeetInches();
      _onFeetInchesScroll();
    }
  }

  void _onUnitChanged() {
    if (isCmSelected.value) {
      // Switched to cm, update cm from current feet/inches
      _updateCmFromFeetInches();
      // Scroll to correct cm position
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _onHeightChanged();
      });
    } else {
      // Switched to feet/inches, update feet/inches from current cm
      _updateFeetInchesFromCm();
      // Scroll to correct feet/inches position
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _onFeetInchesScroll();
      });
    }
  }

  List<Widget> _buildCmRuler() {
    return List.generate(
      maxHeight - minHeight + 1,
      (index) {
        final height = minHeight + index;
        final isMajorTick = height % 10 == 0;
        final isMinorTick = height % 5 == 0;

        return GestureDetector(
          onTap: () {
            selectedHeight.value = height;
          },
          child: SizedBox(
            height: tickSpacing,
            width: 130.setWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isMajorTick || isMinorTick) ...[
                  CommonText(
                    text: height.toString(),
                    fontSize: 15.setFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: Constant.fontFamilyMedium500,
                    textAlign: TextAlign.center,
                    textColor: CustomAppColor.of(context).txtBlack,
                    height: 1,
                    isAutoSize: true,
                    maxLines: 1,
                  ),
                  SizedBox(width: 10.setWidth),
                ],
                Container(
                  width: isMajorTick || isMinorTick ? 65.setWidth : 40.setWidth,
                  height: isMajorTick || isMinorTick ? 4.setHeight : 2.setHeight,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).borderColor,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildFeetInchesRuler() {
    List<Widget> rulers = [];

    for (int feet = minFeet; feet <= maxFeet; feet++) {
      for (int inches = 0; inches <= 11; inches++) {
        final isMajorTick = inches == 0; // Major tick for each foot
        final isMinorTick = inches % 6 == 0; // Minor tick every 6 inches

        rulers.add(
          GestureDetector(
            onTap: () {
              selectedFeet.value = feet;
              selectedInches.value = inches;
            },
            child: SizedBox(
              height: tickSpacing,
              width: 130.setWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isMajorTick || isMinorTick) ...[
                    CommonText(
                      text: isMajorTick ? "$feet'0\"" : "$feet'$inches\"",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constant.fontFamilyMedium500,
                      textAlign: TextAlign.center,
                      textColor: CustomAppColor.of(context).txtBlack,
                      height: 1,
                      isAutoSize: true,
                      maxLines: 1,
                    ),
                    SizedBox(width: 10.setWidth),
                  ],
                  Container(
                    width: isMajorTick || isMinorTick ? 65.setWidth : 40.setWidth,
                    height: isMajorTick || isMinorTick ? 4.setHeight : 2.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).borderColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return rulers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSelectYourHeight,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w400,
          fontFamily: Constant.fontFamilyRegular400,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtDarkGray,
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(width: 15.setWidth),
              ValueListenableBuilder<bool>(
                valueListenable: isCmSelected,
                builder: (context, isCm, child) {
                  return ValueListenableBuilder<int>(
                    valueListenable: isCm ? selectedHeight : selectedFeet,
                    builder: (context, primaryValue, child) {
                      return ValueListenableBuilder<int>(
                        valueListenable: selectedInches,
                        builder: (context, inches, child) {
                          return Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: CustomAppColor.of(context).borderColor, width: 6),
                            ),
                            padding: EdgeInsets.only(top: 15.setHeight, bottom: 5.setHeight, left: 22.setWidth, right: 22.setWidth),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (isCm) ...[
                                  CommonText(
                                    text: primaryValue.toString(),
                                    fontSize: 50.setFontSize,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Constant.fontFamilyBold700,
                                    textAlign: TextAlign.center,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    height: 1,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.setHeight),
                                    child: CommonText(
                                      text: "cm",
                                      fontSize: 32.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Constant.fontFamilyRegular400,
                                      textAlign: TextAlign.center,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      height: 1,
                                    ),
                                  ),
                                ] else ...[
                                  CommonText(
                                    text: primaryValue.toString(),
                                    fontSize: 50.setFontSize,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Constant.fontFamilyBold700,
                                    textAlign: TextAlign.center,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    height: 1,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.setHeight),
                                    child: CommonText(
                                      text: " ft",
                                      fontSize: 32.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Constant.fontFamilyRegular400,
                                      textAlign: TextAlign.center,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      height: 1,
                                    ),
                                  ),
                                  SizedBox(width: 5.setWidth),
                                  CommonText(
                                    text: inches.toString(),
                                    fontSize: 50.setFontSize,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Constant.fontFamilyBold700,
                                    textAlign: TextAlign.center,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    height: 1,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.setHeight),
                                    child: CommonText(
                                      text: " in",
                                      fontSize: 32.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Constant.fontFamilyRegular400,
                                      textAlign: TextAlign.center,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: SizedBox(
                  height: 0.screenHeight / 1.5,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: isCmSelected,
                        builder: (context, isCm, child) {
                          return NotificationListener<ScrollNotification>(
                            onNotification: (ScrollNotification notification) {
                              if (notification is ScrollEndNotification) {
                                final offset = _scrollController.offset;
                                final index = (offset / tickSpacing).round();

                                if (isCm) {
                                  final newHeight = minHeight + index;
                                  if (newHeight >= minHeight && newHeight <= maxHeight) {
                                    selectedHeight.value = newHeight;
                                  }
                                } else {
                                  // For feet/inches, we'll use a different approach
                                  // Calculate total inches from scroll position
                                  final totalInches = (minFeet * 12) + index;
                                  final feet = (totalInches / 12).floor();
                                  final inches = totalInches % 12;

                                  if (feet >= minFeet && feet <= maxFeet) {
                                    selectedFeet.value = feet;
                                    selectedInches.value = inches.toInt();
                                  }
                                }
                              }
                              return false;
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              controller: _scrollController,
                              physics: const ClampingScrollPhysics(),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 0.screenHeight / 3.6),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: isCm ? _buildCmRuler() : _buildFeetInchesRuler(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        width: 130.setWidth,
                        height: 5.setHeight,
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).primary,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15.setWidth),
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
        ValueListenableBuilder<bool>(
          valueListenable: isCmSelected,
          builder: (context, value, child) {
            return Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () {
                    isCmSelected.value = false;
                  },
                  child: Column(
                    children: [
                      CommonText(
                        text: Languages.of(context).txtFtIn.toLowerCase(),
                        fontSize: 14.setFontSize,
                        fontWeight: !value ? FontWeight.w600 : FontWeight.w400,
                        fontFamily: !value ? Constant.fontFamilySemiBold600 : Constant.fontFamilyRegular400,
                        textAlign: TextAlign.start,
                        textColor: !value ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtDarkGray,
                      ),
                      SizedBox(width: 5.setWidth),
                      Opacity(
                        opacity: !value ? 1 : 0,
                        child: Image.asset(
                          AppAssets.icPolygonUp,
                          width: 10.setWidth,
                          height: 10.setHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15.setWidth),
                InkWell(
                  onTap: () {
                    isCmSelected.value = true;
                  },
                  child: Column(
                    children: [
                      CommonText(
                        text: Languages.of(context).txtCm.toLowerCase(),
                        fontSize: 14.setFontSize,
                        fontWeight: value ? FontWeight.w600 : FontWeight.w400,
                        fontFamily: value ? Constant.fontFamilySemiBold600 : Constant.fontFamilyRegular400,
                        textAlign: TextAlign.start,
                        textColor: value ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtDarkGray,
                      ),
                      SizedBox(width: 5.setWidth),
                      Opacity(
                        opacity: value ? 1 : 0,
                        child: Image.asset(
                          AppAssets.icPolygonUp,
                          width: 10.setWidth,
                          height: 10.setHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            );
          },
        ),
        SizedBox(height: 30.setHeight),
      ],
    );
  }
}
