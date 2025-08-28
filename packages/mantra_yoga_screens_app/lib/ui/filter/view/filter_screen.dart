import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class FilterScreen extends StatefulWidget {
  final int currentIndex;
  const FilterScreen({super.key, this.currentIndex = 0});

  static Route<dynamic> route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (context) => FilterScreen(currentIndex: currentIndex));
  }

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;

  final List<String> yogaLevels = [
    'Beginner',
    'Intermediate',
    'Expert',
  ];

  final List<String> meditationLevels = [
    'Beginner',
    'Intermediate',
    'Expert',
  ];

  final List<String> yogaDuration = [
    '0-10 min',
    '10-20 min',
    '20-30 min',
    '30-40 min',
    '40-50 min',
    '>60 min',
  ];

  final List<String> meditationDuration = [
    '0-10 min',
    '10-20 min',
    '20-30 min',
    '30-40 min',
    '40-50 min',
    '>60 min',
  ];

  final List<String> yogaFocusPart = [
    'Emotion Control',
    'Pain Relief',
    'Skills Enhance',
    'Digestion',
    'Flexibility',
    'Concentration',
    'Strength',
    'Glowing Skin',
    'Sleep Issue',
    'Weight Loss',
    'Posture Correction',
  ];

  final List<String> meditationFocusPart = [
    'Emotion Control',
    'Pain Relief',
    'Skills Enhance',
    'Digestion',
    'Flexibility',
    'Concentration',
    'Strength',
    'Glowing Skin',
    'Sleep Issue',
    'Weight Loss',
    'Posture Correction',
  ];

  final ValueNotifier<RangeValues> _selectedYogaTargetCalories = ValueNotifier(const RangeValues(50, 2500));

  final ValueNotifier<int> _selectedYogaLevel = ValueNotifier(0);
  final ValueNotifier<int> _selectedMeditationLevel = ValueNotifier(0);

  final ValueNotifier<int> _selectedYogaDuration = ValueNotifier(0);
  final ValueNotifier<int> _selectedMeditationDuration = ValueNotifier(0);

  final ValueNotifier<List<int>> _selectedYogaFocusPart = ValueNotifier([]);
  final ValueNotifier<List<int>> _selectedMeditationFocusPart = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: widget.currentIndex, length: 2, vsync: this);
    _tabController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtFilter,
          ),
          _tabBarView(),
          _tabsView(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtResetAll,
                    onTap: () {},
                    buttonColor: CustomAppColor.of(context).bgScreen,
                    borderColor: CustomAppColor.of(context).txtDarkGray.withValues(alpha: 0.2),
                    borderWidth: 2,
                    height: 45.setHeight,
                    radius: 18,
                    buttonTextColor: CustomAppColor.of(context).txtDarkGray,
                    buttonTextWeight: FontWeight.w500,
                    buttonFontFamily: Constant.fontFamilyMedium500,
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtApply,
                    onTap: () {},
                    buttonColor: CustomAppColor.of(context).primary,
                    borderColor: CustomAppColor.of(context).borderColor,
                    borderWidth: 3,
                    height: 45.setHeight,
                    radius: 18,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10.setHeight),
        ],
      ),
    );
  }

  _tabBarView() {
    return IgnorePointer(
      ignoring: true,
      child: TabBar(
        controller: _tabController,
        padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth),
        dividerHeight: 1,
        dividerColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: CustomAppColor.of(context).primary,
        indicatorWeight: 3,
        overlayColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
        tabs: [
          Tab(
            child: CommonText(
              text: Languages.of(context).txtYoga,
              fontSize: 16.setFontSize,
              fontFamily: _tabController.index == 0 ? Constant.fontFamilyBold700 : Constant.fontFamilySemiBold600,
              textColor: _tabController.index == 0 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
            ),
          ),
          Tab(
            child: CommonText(
              text: Languages.of(context).txtMeditation,
              fontSize: 16.setFontSize,
              fontFamily: _tabController.index == 1 ? Constant.fontFamilyBold700 : Constant.fontFamilySemiBold600,
              textColor: _tabController.index == 1 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
            ),
          ),
        ],
      ),
    );
  }

  _tabsView() {
    return Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: MediaQuery.of(context).padding.bottom + 10.setHeight),
            child: Column(
              children: [
                _yogaLevelView(),
                SizedBox(height: 20.setHeight),
                _yogaDurationView(),
                SizedBox(height: 20.setHeight),
                _yogaFocusPartView(),
                SizedBox(height: 20.setHeight),
                _yogaTargetCaloriesView(),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: MediaQuery.of(context).padding.bottom + 10.setHeight),
            child: Column(
              children: [
                _meditationLevelView(),
                SizedBox(height: 20.setHeight),
                _meditationDurationView(),
                SizedBox(height: 20.setHeight),
                _meditationFocusPartView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _yogaLevelView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtYourLevel,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Divider(
          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
          height: 30.setHeight,
          thickness: 1,
          indent: 15.setWidth,
          endIndent: 15.setWidth,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              yogaLevels.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedYogaLevel,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedYogaLevel.value = index;
                    },
                    child: Container(
                      height: 40.setHeight,
                      margin: EdgeInsets.only(right: 10.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: yogaLevels[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _yogaDurationView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtDuration,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Divider(
          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
          height: 30.setHeight,
          thickness: 1,
          indent: 15.setWidth,
          endIndent: 15.setWidth,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Wrap(
            spacing: 10.setWidth,
            runSpacing: 10.setHeight,
            children: List.generate(
              yogaDuration.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedYogaDuration,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedYogaDuration.value = index;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray,
                          width: value == index ? 2 : 1.5,
                        ),
                      ),
                      child: CommonText(
                        text: yogaDuration[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtLightGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _yogaFocusPartView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtFocusPart,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Divider(
          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
          height: 30.setHeight,
          thickness: 1,
          indent: 15.setWidth,
          endIndent: 15.setWidth,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Wrap(
            spacing: 10.setWidth,
            runSpacing: 10.setHeight,
            children: List.generate(
              yogaFocusPart.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedYogaFocusPart,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      if (value.contains(index)) {
                        _selectedYogaFocusPart.value = value.where((element) => element != index).toList();
                      } else {
                        _selectedYogaFocusPart.value = [...value, index];
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                      decoration: BoxDecoration(
                        color: value.contains(index) ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: value.contains(index) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray,
                          width: value.contains(index) ? 2 : 1.5,
                        ),
                      ),
                      child: CommonText(
                        text: yogaFocusPart[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value.contains(index) ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value.contains(index) ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value.contains(index) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtLightGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _yogaTargetCaloriesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtTargetCalories,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Divider(
          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
          height: 30.setHeight,
          thickness: 1,
          indent: 15.setWidth,
          endIndent: 15.setWidth,
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: _selectedYogaTargetCalories,
          builder: (context, value, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                sliderTheme: SliderThemeData(
                  valueIndicatorColor: CustomAppColor.of(context).transparent,
                  showValueIndicator: ShowValueIndicator.always,
                  valueIndicatorTextStyle: TextStyle(
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: Constant.fontFamilySemiBold600,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ),
              child: RangeSlider(
                values: _selectedYogaTargetCalories.value,
                onChanged: (value) {
                  _selectedYogaTargetCalories.value = value;
                },
                min: 50,
                max: 2500,
                divisions: 2450,
                activeColor: CustomAppColor.of(context).primary,
                inactiveColor: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                labels: RangeLabels(
                  "${value.start.toInt()} ${Languages.of(context).txtKcal}",
                  "${value.end.toInt()} ${Languages.of(context).txtKcal}",
                ),
              ),
            );
          },
        ),
        SizedBox(height: 5.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: "50 ${Languages.of(context).txtKcal}",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: Constant.fontFamilyRegular400,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: "2500 ${Languages.of(context).txtKcal}",
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _meditationLevelView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtYourLevel,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              meditationLevels.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedMeditationLevel,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedMeditationLevel.value = index;
                    },
                    child: Container(
                      height: 40.setHeight,
                      margin: EdgeInsets.only(right: 10.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: meditationLevels[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _meditationDurationView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtDuration,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Divider(
          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
          height: 30.setHeight,
          thickness: 1,
          indent: 15.setWidth,
          endIndent: 15.setWidth,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Wrap(
            spacing: 10.setWidth,
            runSpacing: 10.setHeight,
            children: List.generate(
              meditationDuration.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedMeditationDuration,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedMeditationDuration.value = index;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray,
                          width: value == index ? 2 : 1.5,
                        ),
                      ),
                      child: CommonText(
                        text: meditationDuration[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtLightGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _meditationFocusPartView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtFocusPart,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Divider(
          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
          height: 30.setHeight,
          thickness: 1,
          indent: 15.setWidth,
          endIndent: 15.setWidth,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Wrap(
            spacing: 10.setWidth,
            runSpacing: 10.setHeight,
            children: List.generate(
              meditationFocusPart.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedMeditationFocusPart,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      if (value.contains(index)) {
                        _selectedMeditationFocusPart.value = value.where((element) => element != index).toList();
                      } else {
                        _selectedMeditationFocusPart.value = [...value, index];
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                      decoration: BoxDecoration(
                        color: value.contains(index) ? CustomAppColor.of(context).containerFillSelected : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: value.contains(index) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGray,
                          width: value.contains(index) ? 2 : 1.5,
                        ),
                      ),
                      child: CommonText(
                        text: meditationFocusPart[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value.contains(index) ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value.contains(index) ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value.contains(index) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtLightGray,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
