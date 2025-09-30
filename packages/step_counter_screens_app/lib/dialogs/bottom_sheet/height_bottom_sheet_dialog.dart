import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class HeightBottomSheetDialog extends StatefulWidget {
  final bool isSelectedFeet;
  const HeightBottomSheetDialog({super.key, required this.onSave, this.isSelectedFeet = false});

  final Function() onSave;

  @override
  State<HeightBottomSheetDialog> createState() => _HeightBottomSheetDialogState();
}

class _HeightBottomSheetDialogState extends State<HeightBottomSheetDialog> {
  final ValueNotifier<int> selectedHeightInFeet = ValueNotifier(5);
  final ValueNotifier<int> selectedHeightInInches = ValueNotifier(11);
  final ValueNotifier<int> selectedHeightInCentimeters = ValueNotifier(150);

  final FixedExtentScrollController _ftController = FixedExtentScrollController(initialItem: 4);
  final FixedExtentScrollController _inController = FixedExtentScrollController(initialItem: 10);
  final FixedExtentScrollController _cmController = FixedExtentScrollController(initialItem: 149);

  final List<int> heightsInFeet = List.generate(50, (index) => index + 1);
  final List<int> heightsInInches = List.generate(11, (index) => index + 1);
  final List<int> heightsInCentimeters = List.generate(250, (index) => index + 1);

  ValueNotifier<bool> isHeightInFeet = ValueNotifier(true);

  resetValue() {
    if (isHeightInFeet.value) {
      selectedHeightInFeet.value = 5;
      selectedHeightInInches.value = 11;
      _ftController.jumpToItem(4);
      _inController.jumpToItem(10);
    } else {
      selectedHeightInCentimeters.value = 150;
      _cmController.jumpToItem(149);
    }
  }

  @override
  void dispose() {
    _ftController.dispose();
    _inController.dispose();
    _cmController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHeightInFeet.value = widget.isSelectedFeet;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      child: Column(
        children: [
          SizedBox(height: 15.setHeight),
          ValueListenableBuilder(
            valueListenable: isHeightInFeet,
            builder: (context, value, child) {
              return Container(
                height: 50.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgContainerLightAndDark,
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(color: CustomAppColor.of(context).borderColor),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: IgnorePointer(
                  ignoring: true,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            isHeightInFeet.value = true;
                            resetValue();
                          },
                          child: Container(
                            height: 50.setHeight,
                            decoration: BoxDecoration(
                              color: value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(color: value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent),
                            ),
                            alignment: Alignment.center,
                            child: CommonText(
                              text: Languages.of(context).txtFeetAndInches,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: value ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            isHeightInFeet.value = false;
                            resetValue();
                          },
                          child: Container(
                            height: 50.setHeight,
                            decoration: BoxDecoration(
                              color: !value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(1000),
                              border: Border.all(color: !value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent),
                            ),
                            alignment: Alignment.center,
                            child: CommonText(
                              text: Languages.of(context).txtCentimeters,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: !value ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 15.setHeight),
          ValueListenableBuilder(
            valueListenable: isHeightInFeet,
            builder: (context, value, child) {
              return Stack(
                children: [
                  Container(
                    height: 0.screenHeight / 5,
                    width: 0.screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / (value ? 4 : 2.8)),
                    child: Row(
                      children: [
                        if (isHeightInFeet.value) ...[
                          Expanded(
                            flex: 1,
                            child: CupertinoPicker(
                              scrollController: _ftController,
                              itemExtent: 50.setHeight,
                              onSelectedItemChanged: (index) {
                                selectedHeightInFeet.value = heightsInFeet[index];
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).transparent,
                                  border: Border.symmetric(
                                    horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                                  ),
                                ),
                              ),
                              children: heightsInFeet.map((height) {
                                return Center(
                                  child: ValueListenableBuilder(
                                    valueListenable: selectedHeightInFeet,
                                    builder: (context, selectedValue, child) {
                                      final isSelected = height == selectedValue;
                                      return CommonText(
                                        text: "$height Ft",
                                        fontSize: isSelected ? 25.setFontSize : 20.setFontSize,
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                        textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                                        textAlign: TextAlign.center,
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(width: 20.setWidth),
                          Expanded(
                            flex: 1,
                            child: CupertinoPicker(
                              scrollController: _inController,
                              itemExtent: 50.setHeight,
                              onSelectedItemChanged: (index) {
                                selectedHeightInInches.value = heightsInInches[index];
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).transparent,
                                  border: Border.symmetric(
                                    horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                                  ),
                                ),
                              ),
                              children: heightsInInches.map((height) {
                                return Center(
                                  child: ValueListenableBuilder(
                                    valueListenable: selectedHeightInInches,
                                    builder: (context, selectedValue, child) {
                                      final isSelected = height == selectedValue;
                                      return CommonText(
                                        text: "$height In",
                                        fontSize: isSelected ? 25.setFontSize : 20.setFontSize,
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                        textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                                        textAlign: TextAlign.center,
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ] else ...[
                          Expanded(
                            flex: 1,
                            child: CupertinoPicker(
                              scrollController: _cmController,
                              itemExtent: 50.setHeight,
                              onSelectedItemChanged: (index) {
                                selectedHeightInCentimeters.value = heightsInCentimeters[index];
                              },
                              selectionOverlay: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).transparent,
                                  border: Border.symmetric(
                                    horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                                  ),
                                ),
                              ),
                              children: heightsInCentimeters.map((height) {
                                return Center(
                                  child: ValueListenableBuilder(
                                    valueListenable: selectedHeightInCentimeters,
                                    builder: (context, selectedValue, child) {
                                      final isSelected = height == selectedValue;
                                      return CommonText(
                                        text: "$height cm",
                                        fontSize: isSelected ? 25.setFontSize : 20.setFontSize,
                                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                        textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                                        textAlign: TextAlign.center,
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0.screenWidth / (value ? 5.5 : 3.8),
                    bottom: 0,
                    top: 0,
                    child: Image.asset(
                      AppAssets.icTriangleRight,
                      height: 20.setHeight,
                      width: 20.setHeight,
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 15.setHeight),
          IgnorePointer(
            ignoring: true,
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtCancel,
                    mLeft: 15.setWidth,
                    mRight: 8.setWidth,
                    buttonColor: CustomAppColor.of(context).transparent,
                    buttonTextColor: CustomAppColor.of(context).txtPrimary,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: CommonButton(
                    mLeft: 8.setWidth,
                    mRight: 15.setWidth,
                    text: Languages.of(context).txtSave,
                    onTap: () {
                      Navigator.pop(context);
                      widget.onSave();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
