import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../datamodels/fill_information_data.dart';

class OnboardingDetailsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => OnboardingDetailsScreen());
  }

  const OnboardingDetailsScreen({super.key});

  @override
  State<OnboardingDetailsScreen> createState() =>
      _OnboardingDetailsScreenState();
}

class _OnboardingDetailsScreenState extends State<OnboardingDetailsScreen> {
  int _currentPage = 0;

  Gender? selectedGender = Gender.male;
  UnitType weightUnitType = UnitType.kg;
  UnitType heightUnitType = UnitType.cm;
  int selectedWeight = 45;
  int selectedHeight = 153;
  int selectedFeet = 5;
  int selectedInches = 5;

  final PageController _controller = PageController();

  void _nextPage() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigator.push(context, GeneratingYourWeeklyGoalScreen.route());
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      _showWelcomeBottomSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const AlwaysScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: [
                  _buildGenderPage(),
                  _buildWeightPage(),
                  _buildHeightPage(),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 62.setWidth,
                vertical: 24.setHeight,
              ),
              child: CommonButton(
                text: "Next Step".toUpperCase(),
                onTap: () => _nextPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    double progress = (_currentPage + 1) / 3;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.setWidth,
        vertical: 20.setHeight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AppAssets.icBack,
                    height: 24.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ),
              ),
              SizedBox(width: 85.setWidth),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: CustomAppColor.of(
                      context,
                    ).containerBgPurple,
                    color: CustomAppColor.of(context).primary,
                  ),
                ),
              ),
              SizedBox(width: 85.setWidth),

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${_currentPage + 1}',
                      style: TextStyle(
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w700,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    TextSpan(
                      text: "/3",
                      style: TextStyle(
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColor.of(context).txtGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderPage() {
    return Column(
      children: [
        SizedBox(height: 68.setHeight),
        CommonText(
          text: Languages.of(context).txtWhatsYourGender,
          fontSize: 26.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtPurple,
        ),
        SizedBox(height: 5.setHeight),
        CommonText(
          text: Languages.of(context).txtWhatsYourGenderDesc,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        SizedBox(height: 150.setHeight),
        _buildGenderOption(
          value: Gender.male,
          label: Languages.of(context).txtMale,
          iconPath: AppAssets.icMale,
        ),
        SizedBox(height: 16.setHeight),
        _buildGenderOption(
          value: Gender.female,
          label: Languages.of(context).txtFemale,
          iconPath: AppAssets.icFemale,
        ),
      ],
    );
  }

  Widget _buildGenderOption({
    required Gender value,
    required String label,
    required String iconPath,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 62.setWidth),
      child: InkWell(
        onTap: () => setState(() => selectedGender = value),
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12.setWidth,
            vertical: 8.setHeight,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).containerBgPurple,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(iconPath, height: 34.setHeight, width: 34.setWidth),
              CommonText(text: label, fontSize: 18.setFontSize),
              Radio<Gender>(
                value: value,
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return CustomAppColor.of(context).txtBlack;
                  }
                  return Colors.grey;
                }),
                groupValue: selectedGender,
                onChanged: (value) => setState(() => selectedGender = value),
                activeColor: CustomAppColor.of(context).black,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightPage() {
    final List<int> weights = List.generate(
      150,
      (index) => weightUnitType == UnitType.kg ? index + 30 : index + 66,
    );

    return Column(
      children: [
        SizedBox(height: 64.setHeight),
        CommonText(
          text: "How Much Do You Weigh?",
          fontSize: 26.setFontSize,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtPurple,
        ),
        SizedBox(height: 5.setHeight),
        CommonText(
          text: "To personalize your fitness goal",
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        SizedBox(height: 73.setHeight),
        _buildUnitSwitch(
          selectedUnit: weightUnitType,
          firstUnit: UnitType.kg,
          secondUnit: UnitType.lbs,
          firstLabel: "KG",
          secondLabel: "LBS",
          onUnitChanged: (unit) => setState(() => weightUnitType = unit),
        ),
        SizedBox(height: 64.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.icArrowSelect,
              height: 24.setHeight,
              width: 24.setWidth,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 180.setHeight,
                  width: 100.setWidth,
                  child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.1,
                    looping: true,
                    selectionOverlay: Container(),
                    itemExtent: 95.0,
                    scrollController: FixedExtentScrollController(
                      initialItem: weights.indexOf(selectedWeight),
                    ),
                    onSelectedItemChanged: (index) =>
                        setState(() => selectedWeight = weights[index]),
                    children: weights
                        .map(
                          (w) => Center(
                            child: CommonText(
                              text: "$w",
                              fontSize: 40.setFontSize,
                              fontWeight: FontWeight.w700,
                              textColor: CustomAppColor.of(context).txtPurple,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                _buildPickerDivider(),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeightPage() {
    final List<int> cmHeights = List.generate(120, (index) => index + 120);
    final List<int> feetList = List.generate(3, (index) => index + 4);
    final List<int> inchList = List.generate(12, (index) => index);

    return Column(
      children: [
        SizedBox(height: 64.setHeight),
        CommonText(
          text: "How Tall Are You?",
          textColor: CustomAppColor.of(context).txtPurple,
          fontSize: 26.setFontSize,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 5.setHeight),
        CommonText(
          text: "To personalize your fitness goal",
          textColor: CustomAppColor.of(context).txtGrey,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(height: 73.setHeight),
        _buildUnitSwitch(
          selectedUnit: heightUnitType,
          firstUnit: UnitType.cm,
          secondUnit: UnitType.ft,
          firstLabel: "CM",
          secondLabel: "FT",
          onUnitChanged: (unit) => setState(() => heightUnitType = unit),
        ),
        SizedBox(height: 64.setHeight),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icArrowSelect,
              height: 24.setHeight,
              width: 24.setWidth,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 0.setWidth),
                heightUnitType == UnitType.cm
                    ? Stack(
                        children: [
                          SizedBox(
                            height: 180.setHeight,
                            width: 100.setWidth,
                            child: CupertinoPicker(
                              useMagnifier: true,
                              magnification: 1,
                              looping: true,
                              selectionOverlay:
                                  CupertinoPickerDefaultSelectionOverlay(
                                    background: Colors.transparent,
                                  ),
                              itemExtent: 100.0,
                              scrollController: FixedExtentScrollController(
                                initialItem: cmHeights.indexOf(selectedHeight),
                              ),
                              onSelectedItemChanged: (index) => setState(
                                () => selectedHeight = cmHeights[index],
                              ),
                              children: cmHeights
                                  .map(
                                    (h) => Center(
                                      child: CommonText(
                                        text: "$h",
                                        fontSize: 40.setFontSize,
                                        fontWeight: FontWeight.w700,
                                        textColor: CustomAppColor.of(
                                          context,
                                        ).txtPurple,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          _buildPickerDivider(),
                        ],
                      )
                    : Row(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 180.setHeight,
                                width: 80.setWidth,
                                child: CupertinoPicker(
                                  useMagnifier: true,
                                  magnification: 1.1,
                                  looping: true,
                                  selectionOverlay: Container(),
                                  itemExtent: 95.0,

                                  scrollController: FixedExtentScrollController(
                                    initialItem: feetList.indexOf(selectedFeet),
                                  ),
                                  onSelectedItemChanged: (index) => setState(
                                    () => selectedFeet = feetList[index],
                                  ),
                                  children: feetList
                                      .map(
                                        (f) => Center(
                                          child: CommonText(
                                            text: "$f'",
                                            fontSize: 40.setFontSize,
                                            fontWeight: FontWeight.w700,
                                            textColor: CustomAppColor.of(
                                              context,
                                            ).txtPurple,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              _buildPickerDivider(),
                            ],
                          ),
                          SizedBox(width: 10.setWidth),
                          Stack(
                            children: [
                              SizedBox(
                                height: 180.setHeight,
                                width: 80.setWidth,
                                child: CupertinoPicker(
                                  useMagnifier: true,
                                  magnification: 1.1,
                                  looping: true,
                                  selectionOverlay: Container(),
                                  itemExtent: 95.0,
                                  scrollController: FixedExtentScrollController(
                                    initialItem: selectedInches,
                                  ),
                                  onSelectedItemChanged: (index) =>
                                      setState(() => selectedInches = index),
                                  children: inchList
                                      .map(
                                        (i) => Center(
                                          child: CommonText(
                                            text: "$i\"",
                                            fontSize: 40.setFontSize,
                                            fontWeight: FontWeight.w700,
                                            textColor: CustomAppColor.of(
                                              context,
                                            ).txtPurple,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              _buildPickerDivider(),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPickerDivider() {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          Container(
            width: 83.setWidth,
            height: 1.setHeight,
            color: CustomAppColor.of(context).divider,
          ),
          Spacer(flex: 1),
          Container(
            width: 83.setWidth,
            height: 1.setHeight,
            color: CustomAppColor.of(context).divider,
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildUnitSwitch({
    required UnitType selectedUnit,
    required UnitType firstUnit,
    required UnitType secondUnit,
    required String firstLabel,
    required String secondLabel,
    required ValueChanged<UnitType> onUnitChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 40.setWidth,
        vertical: 15.setHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: CustomAppColor(context).greyDivider),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => onUnitChanged(firstUnit),
            child: CommonText(
              text: firstLabel,
              fontSize: 18.setFontSize,
              textColor: selectedUnit == firstUnit
                  ? CustomAppColor.of(context).primary
                  : Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.setWidth),
            child: Container(
              width: 1,
              height: 23.setHeight,
              color: CustomAppColor.of(context).greyDivider,
            ),
          ),
          GestureDetector(
            onTap: () => onUnitChanged(secondUnit),
            child: CommonText(
              text: secondLabel,
              fontSize: 18.setFontSize,
              textColor: selectedUnit == secondUnit
                  ? CustomAppColor.of(context).primary
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _showWelcomeBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 49.setHeight),
                padding: EdgeInsets.symmetric(
                  horizontal: 24.setWidth,
                  vertical: 32.setHeight,
                ),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScaffold,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 80.setHeight),
                    CommonText(
                      text: Languages.of(context).txtWelcomeToFitMode,
                      fontSize: 24.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtPurple,
                    ),
                    SizedBox(height: 34.setHeight),
                    CommonText(
                      text: Languages.of(context).txtWelcomeToFitModeDesc1,
                      textAlign: TextAlign.center,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(height: 34.setHeight),

                    CommonText(
                      text: Languages.of(context).txtWelcomeToFitModeDesc2,
                      textAlign: TextAlign.center,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(height: 62.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                      child: CommonButton(
                        text: Languages.of(context).txtOk,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(height: 34.setHeight),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                child: Image.asset(
                  AppAssets.icShoeLogo,
                  width: 114.setWidth,
                  height: 114.setHeight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
