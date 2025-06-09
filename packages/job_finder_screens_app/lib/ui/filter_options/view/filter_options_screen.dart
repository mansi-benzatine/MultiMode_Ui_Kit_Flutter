import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text_field/text_form_field.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class FilterOptionsScreen extends StatefulWidget {
  const FilterOptionsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FilterOptionsScreen());
  }

  @override
  State<FilterOptionsScreen> createState() => _FilterOptionsScreenState();
}

class _FilterOptionsScreenState extends State<FilterOptionsScreen> implements TopBarClickListener {
  List<String> jobTypeList = [];
  void fillData() {
    jobTypeList = [
      Languages.of(context).txtFullTime,
      Languages.of(context).txtPartTime,
      Languages.of(context).txtContract,
      Languages.of(context).txtFreelance,
      Languages.of(context).txtRemote,
      Languages.of(context).txtInternship,
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              title: Languages.of(context).txtFilters,
              isShowTitle: true,
              isShowBack: true,
              textColor: CustomAppColor.of(context).txtSecondaryWhite,
              isShowReset: true,
              iconColor: CustomAppColor.of(context).bgDetailsCard,
            ),
          ),
          Expanded(child: SingleChildScrollView(child: _InputFieldsView(jobTypeList: jobTypeList))),
          IgnorePointer(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _ContinueButtonView(onTap: () {}),
            ),
          )
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

class _InputFieldsView extends StatelessWidget {
  final List<String> jobTypeList;
  _InputFieldsView({required this.jobTypeList});

  final ValueNotifier<Set<String>> selectedJobTypes = ValueNotifier<Set<String>>({});

  @override
  Widget build(BuildContext context) {
    if (selectedJobTypes.value.isEmpty) {
      selectedJobTypes.value = {
        if (jobTypeList.contains("Full-Time")) "Full-Time",
        if (jobTypeList.contains("Remote")) "Remote",
      };
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      child: Column(
        children: [
          CommonTextFormFieldWithPrefixAndSuffix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtSelectCategory,
            prefixIcon: AppAssets.icCategory,
            suffixIcon: AppAssets.icDownArrow,
          ),
          SizedBox(height: 20.setHeight),
          CommonTextFormFieldWithPrefixAndSuffix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtSelectSubCategory,
            prefixIcon: AppAssets.icCategory,
            suffixIcon: AppAssets.icDownArrow,
          ),
          SizedBox(height: 20.setHeight),
          CommonTextFormFieldWithPrefixAndSuffix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtSelectPositionLevel,
            prefixIcon: AppAssets.icExperience,
            suffixIcon: AppAssets.icDownArrow,
          ),
          SizedBox(height: 20.setHeight),
          CommonTextFormFieldWithPrefixAndSuffix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtSelectExperienceLevel,
            prefixIcon: AppAssets.icJobTitle,
            suffixIcon: AppAssets.icDownArrow,
          ),
          SizedBox(height: 20.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtChooseYourLocation,
            prefixIcon: AppAssets.icLocation,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtMinimumSalary,
                fontWeight: FontWeight.w500,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              CommonText(
                text: Languages.of(context).txtMaximumSalary,
                fontWeight: FontWeight.w500,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          const RangeSliderWithShadow(),
          SizedBox(height: 40.setHeight),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 16.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgWhiteSecondary,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: CustomAppColor.of(context).containerGrey,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icExperience,
                      height: 20.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: Languages.of(context).txtChooseJobTypes,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.setFontSize,
                    ),
                  ],
                ),
                SizedBox(height: 16.setHeight),
                ValueListenableBuilder<Set<String>>(
                  valueListenable: selectedJobTypes,
                  builder: (context, selectedValue, _) {
                    return Wrap(
                      spacing: 4.setWidth,
                      children: jobTypeList.map((item) {
                        bool isSelected = selectedValue.contains(item);
                        return GestureDetector(
                          onTap: () {
                            final newSelection = Set<String>.from(selectedValue);
                            if (isSelected) {
                              newSelection.remove(item);
                            } else {
                              newSelection.add(item);
                            }
                            selectedJobTypes.value = newSelection;
                          },
                          child: Container(
                            height: 35.setHeight,
                            width: 91.setWidth,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 10.setHeight),
                            decoration: BoxDecoration(
                              color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).icPrimary,
                                width: 1,
                              ),
                            ),
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).icPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  final Function()? onTap;
  const _ContinueButtonView({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: CommonButton(
          onTap: () => Navigator.pop(context),
          text: Languages.of(context).txtApplyFilter,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
        ),
      ),
    );
  }
}

class RangeSliderWithShadow extends StatefulWidget {
  const RangeSliderWithShadow({super.key});

  @override
  RangeSliderWithShadowState createState() => RangeSliderWithShadowState();
}

class RangeSliderWithShadowState extends State<RangeSliderWithShadow> {
  SfRangeValues _values = const SfRangeValues(15000, 2500000);

  @override
  Widget build(BuildContext context) {
    double min = 0;
    double max = 5000000;
    double trackWidth = MediaQuery.of(context).size.width - 40;

    double left = (_values.start - min) / (max - min) * trackWidth;
    double right = (max - _values.end) / (max - min) * trackWidth;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: left + 20,
              right: right + 20,
              top: 12,
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).icPrimary.withOpacityPercent(0.4),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
            SfRangeSliderTheme(
              data: SfRangeSliderThemeData(
                activeTrackColor: CustomAppColor.of(context).icPrimary,
                inactiveTrackColor: CustomAppColor.of(context).containerGrey,
                thumbColor: CustomAppColor.of(context).bgSecondary,
                thumbStrokeColor: CustomAppColor.of(context).icPrimary,
                thumbRadius: 12,
                thumbStrokeWidth: 4,
                activeTrackHeight: 3,
                inactiveTrackHeight: 2,
                tooltipBackgroundColor: Colors.transparent,
                tooltipTextStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: CustomAppColor.of(context).txtSecondary,
                ),
              ),
              child: SfRangeSlider(
                min: 0,
                max: 5000000,
                values: _values,
                interval: 1000000,
                stepSize: 1000,
                enableTooltip: true,
                shouldAlwaysShowTooltip: true,
                tooltipShape: CustomTooltipShape(),
                tooltipTextFormatterCallback: (dynamic value, String formattedText) {
                  return "\n\$${(value ~/ 1000)}k";
                },
                onChanged: (SfRangeValues newValues) {
                  setState(() {
                    _values = newValues;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomTooltipShape extends SfTooltipShape {
  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter,
    Offset offset,
    TextPainter textPainter, {
    required Animation<double> animation,
    required Paint paint,
    required RenderBox parentBox,
    required SfSliderThemeData sliderThemeData,
    required Rect trackRect,
  }) {
    final Canvas canvas = context.canvas;

    final double tooltipOffsetY = thumbCenter.dy + 20;

    final double tooltipWidth = textPainter.width + 10;
    final double tooltipHeight = textPainter.height + 5;

    final Rect tooltipRect = Rect.fromCenter(
      center: Offset(thumbCenter.dx, tooltipOffsetY),
      width: tooltipWidth,
      height: tooltipHeight,
    );

    final RRect tooltipRRect = RRect.fromRectAndRadius(
      tooltipRect,
      const Radius.circular(6),
    );

    paint.color = sliderThemeData.tooltipBackgroundColor!;
    canvas.drawRRect(tooltipRRect, paint);

    textPainter.paint(
      canvas,
      Offset(tooltipRect.left + 5, tooltipRect.top + 2),
    );
  }
}
