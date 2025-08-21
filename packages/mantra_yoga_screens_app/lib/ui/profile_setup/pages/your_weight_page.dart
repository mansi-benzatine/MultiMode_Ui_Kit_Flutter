import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class YourWeightPage extends StatefulWidget {
  const YourWeightPage({super.key});

  @override
  State<YourWeightPage> createState() => _YourWeightPageState();
}

class _YourWeightPageState extends State<YourWeightPage> {
  ValueNotifier<int> selectedWeight = ValueNotifier(75);
  late ScrollController _scrollController;
  final int minWeight = 30;
  final int maxWeight = 200;
  final double tickSpacing = 25.setWidth;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: (selectedWeight.value - minWeight) * tickSpacing,
    );
    selectedWeight.addListener(_onWeightChanged);
  }

  @override
  void dispose() {
    selectedWeight.removeListener(_onWeightChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onWeightChanged() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        (selectedWeight.value - minWeight) * tickSpacing,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSelectYourCurrentWeight,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w400,
          fontFamily: Constant.fontFamilyRegular400,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtDarkGray,
        ),
        const Spacer(),
        ValueListenableBuilder<int>(
          valueListenable: selectedWeight,
          builder: (context, weight, child) {
            return Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).primary,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: CustomAppColor.of(context).borderColor, width: 6),
              ),
              padding: EdgeInsets.only(top: 15.setHeight, bottom: 5.setHeight, left: 30.setWidth, right: 30.setWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: weight.toString(),
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
                      text: "kg",
                      fontSize: 32.setFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamilyRegular400,
                      textAlign: TextAlign.center,
                      textColor: CustomAppColor.of(context).txtBlack,
                      height: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 40.setHeight),
        SizedBox(
          height: 130.setHeight,
          child: Stack(
            children: [
              // Scrollable ruler
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollEndNotification) {
                    final offset = _scrollController.offset;
                    final weightIndex = (offset / tickSpacing).round();
                    final newWeight = minWeight + weightIndex;
                    if (newWeight >= minWeight && newWeight <= maxWeight) {
                      selectedWeight.value = newWeight;
                    }
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        maxWeight - minWeight + 1,
                        (index) {
                          final weight = minWeight + index;
                          final isMajorTick = weight % 10 == 0; // Major tick every 10
                          final isMinorTick = weight % 5 == 0; // Minor tick every 5

                          return GestureDetector(
                            onTap: () {
                              selectedWeight.value = weight;
                            },
                            child: SizedBox(
                              width: tickSpacing,
                              height: 130.setHeight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (isMajorTick || isMinorTick) SizedBox(height: 25.setHeight),
                                  Container(
                                    height: isMajorTick || isMinorTick ? 65.setHeight : 40.setHeight,
                                    width: isMajorTick || isMinorTick ? 4.setWidth : 2.setWidth,
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).borderColor,
                                      borderRadius: BorderRadius.circular(1000),
                                    ),
                                  ),
                                  if (isMajorTick || isMinorTick) ...[
                                    SizedBox(height: 10.setHeight),
                                    CommonText(
                                      text: weight.toString(),
                                      fontSize: 15.setFontSize,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Constant.fontFamilyMedium500,
                                      textAlign: TextAlign.center,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      height: 1,
                                      isAutoSize: true,
                                      maxLines: 1,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // Center indicator line
              Positioned(
                left: MediaQuery.of(context).size.width / 2 - 1.5.setWidth,
                top: 0,
                child: Container(
                  height: 130.setHeight,
                  width: 5.setWidth,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary,
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
