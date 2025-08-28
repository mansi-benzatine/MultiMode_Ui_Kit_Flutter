import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/ui/loading_weekly_goal/views/loading_weekly_goal_screen.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';

import '../datamodel/fill_information_data.dart';

class FillInformationScreen extends StatefulWidget {
  final int currentIndex;
  final bool isMaleSelected;
  final bool isFemaleSelected;
  static Route<void> route({required int currentIndex, bool isFemaleSelected = false, bool isMaleSelected = false}) {
    return MaterialPageRoute(
      builder: (_) => FillInformationScreen(currentIndex: currentIndex, isFemaleSelected: isFemaleSelected, isMaleSelected: isMaleSelected),
    );
  }

  const FillInformationScreen({super.key, required this.currentIndex, this.isFemaleSelected = false, this.isMaleSelected = false});

  @override
  State<FillInformationScreen> createState() => _FillInformationScreenState();
}

class _FillInformationScreenState extends State<FillInformationScreen> {
  int currentPage = 0;
  String selectedGender = 'female';
  bool isKm = true;
  int selectedGoal = 5;
  UnitType weightUnitType = UnitType.km;
  int selectedDistance = 5;

  final List<int> goalOptions = List.generate(20, (index) => index + 1);

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
    currentPage = widget.currentIndex;
    selectedGender = widget.isFemaleSelected ? "Female" :widget.isMaleSelected ?"Male" :"";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            customPageIndicator(currentPage),

            Expanded(
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                children: [_buildGenderSelection(), _buildGoalSelection()],
              ),
            ),
            // Bottom NEXT Button
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 64.setWidth, vertical: 38.setHeight),
                child: GestureDetector(
                  onTap: () {
                    if (currentPage == 0) {
                      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                    } else {
                      Navigator.push(context, GoalLoadingScreen.route());
                    }
                  },

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 16.setHeight),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: CustomAppColor.of(context).primary),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CommonText(text: Languages.of(context).txtNext.toUpperCase(), fontSize: 18.setFontSize, fontWeight: FontWeight.w900, textColor: CustomAppColor.of(context).txtWhite),
                        ),
                        Positioned(
                          right: 0.setWidth,
                          child: Icon(Icons.navigate_next_rounded, size: 30, color: CustomAppColor.of(context).icWhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customPageIndicator(int currentPage) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.setHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 20.setWidth,
            height: 20.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).primary,
              border: Border.all(color: CustomAppColor.of(context).primary, width: 2),
              shape: BoxShape.circle,
            ),
          ),
          // Connecting line
          Container(width: 29.setWidth, height: 2.setHeight, color: CustomAppColor.of(context).primary),
          // Hollow circle
          Container(
            width: 20.setWidth,
            height: 20.setHeight,
            decoration: BoxDecoration(
              color: currentPage == 1 ? CustomAppColor.of(context).primary : Colors.transparent,
              border: Border.all(color: CustomAppColor.of(context).primary, width: 2),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      children: [
        CommonText(text: Languages.of(context).txtWhatIsYourGender.toUpperCase(), fontSize: 24.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).txtPrimary),
        SizedBox(height: 4.setHeight),
        CommonText(text: Languages.of(context).txtCaloriesAndStrideLengthCalculationNeedIt, fontSize: 16.setFontSize, textColor: CustomAppColor.of(context).txtGreyWhite),
        SizedBox(height: 75.setHeight),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [_genderOption(Languages.of(context).txtMale, AppAssets.imgMale), _genderOption(Languages.of(context).txtFemale, AppAssets.imgFemale)]),
      ],
    );
  }

  Widget _genderOption(String gender, String icon) {
    final isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: Column(
        children: [
          Image.asset(icon, height: 230.setHeight, width: 150.setWidth),
          SizedBox(height: 40.setHeight),
          CommonText(
            text: gender[0].toUpperCase() + gender.substring(1),
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: isSelected ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtLightGrey,
          ),
          SizedBox(height: 10.setHeight),
          Icon(Icons.check_circle_rounded, size: 25, color: isSelected ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtLightGrey),
        ],
      ),
    );
  }

  Widget _buildGoalSelection() {
    final List<int> distances = List.generate(96, (index) {
      int kmValue = index + 5;
      return weightUnitType == UnitType.km ? kmValue : (kmValue * 0.621371).round();
    });

    return Column(
      children: [
        CommonText(text: Languages.of(context).txtWhatIsYourDailyGoal.toUpperCase(), fontSize: 24.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).txtPrimary),
        SizedBox(height: 4.setHeight),
        CommonText(text: Languages.of(context).txtToPersonalizeYourDailyGoal, fontSize: 16.setFontSize, textColor: Colors.grey),
        SizedBox(height: 80.setHeight),
        buildUnitToggle(
          context: context,
          selectedUnit: weightUnitType,
          onChanged: (unit) {
            setState(() {
              weightUnitType = unit;
            });
          },
        ),

        SizedBox(height: 60.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.icPrimaryNavigator, height: 24.setHeight, width: 24.setWidth),
            SizedBox(width: 15.setWidth),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200.setHeight,
                  width: 100.setWidth,
                  child: CupertinoPicker(
                    useMagnifier: true,
                    magnification: 1.0,
                    looping: true,
                    selectionOverlay: Container(),
                    itemExtent: 100.0,
                    diameterRatio: 15,
                    scrollController: FixedExtentScrollController(initialItem: distances.indexOf(selectedDistance)),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedDistance = distances[index];
                      });
                    },
                    children: distances
                        .map(
                          (w) => Center(
                            child: CommonText(text: "$w", fontSize: 40.setFontSize, fontWeight: FontWeight.w700, textColor: CustomAppColor.of(context).txtPrimary),
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

  Widget _buildPickerDivider() {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          Container(width: 83.setWidth, height: 1.setHeight, color: CustomAppColor.of(context).divider),
          Spacer(flex: 1),
          Container(width: 83.setWidth, height: 1.setHeight, color: CustomAppColor.of(context).divider),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildUnitToggle({required BuildContext context, required UnitType selectedUnit, required ValueChanged<UnitType> onChanged}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Container(
        decoration: BoxDecoration(color: CustomAppColor.of(context).toggleBg, borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: [
            _buildToggleItem(context: context, label: 'KM', isSelected: selectedUnit == UnitType.km, onTap: () => onChanged(UnitType.km)),
            _buildToggleItem(context: context, label: 'MILE', isSelected: selectedUnit == UnitType.mi, onTap: () => onChanged(UnitType.mi)),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem({required BuildContext context, required String label, required bool isSelected, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50.setHeight,
          decoration: BoxDecoration(color: isSelected ? CustomAppColor.of(context).lime : Colors.transparent, borderRadius: BorderRadius.circular(40)),
          alignment: Alignment.center,
          child: CommonText(text: label, fontWeight: FontWeight.bold, textColor: isSelected ? Colors.black : CustomAppColor.of(context).txtLightGrey),
        ),
      ),
    );
  }
}
