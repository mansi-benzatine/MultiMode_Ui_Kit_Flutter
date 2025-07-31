import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:run_tracker_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/ui/achievements/views/achievements_screen.dart';
import 'package:run_tracker_screens_app/ui/reminder/views/reminder_screen.dart';
import 'package:run_tracker_screens_app/ui/subscription/views/subscription_screen.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/constant.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../app/my_app.dart';
import '../../fill_information/datamodel/fill_information_data.dart';

class SettingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => SettingScreen());
  }

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    implements TopBarClickListener {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            isShowSimpleTitle: true,
            simpleTitle: Languages.of(context).txtSettings.toUpperCase(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.setHeight),
                    AchievementsView(),
                    SizedBox(height: 25.setHeight),
                    RunningSettingsView(),
                    SizedBox(height: 25.setHeight),
                    GeneralSettingsView(isDarkMode: isDarkMode),
                    SizedBox(height: 25.setHeight),
                    AccountSettingsView(),
                    SizedBox(height: 25.setHeight),
                    TermsAndSupportView(),
                    SizedBox(height: 50.setHeight),
                  ],
                ),
              ),
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

class AchievementsView extends StatelessWidget {
  const AchievementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtAchievements.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 12.setHeight),
          InkWell(
            onTap: () => Navigator.push(context, AchievementsScreen.route()),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.setWidth,
                vertical: 14.setHeight,
              ),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).containerBgColor,
                border: Border.all(color: CustomAppColor.of(context).border),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icAchievements,
                        height: 57.setHeight,
                        width: 30.setWidth,
                      ),
                      SizedBox(width: 16.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAchievements,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CommonText(
                        text: "2",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w900,
                        textColor: CustomAppColor.of(context).primary,
                      ),
                      SizedBox(width: 8.setWidth),
                      Image.asset(
                        AppAssets.icRightNavigator,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RunningSettingsView extends StatefulWidget {
  const RunningSettingsView({super.key});

  @override
  State<RunningSettingsView> createState() => _RunningSettingsViewState();
}

class _RunningSettingsViewState extends State<RunningSettingsView> {
  bool isKm = true;
  int selectedGoal = 50;
  UnitType weightUnitType = UnitType.km;
  int selectedDistance = 50;

  final List<int> goalOptions = List.generate(20, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtRunningSettings.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.setWidth,
            vertical: 14.setHeight,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).containerBgColor,
            border: Border.all(color: CustomAppColor.of(context).border),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icDailyGoal,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtDailyGoal,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _showSetDailyGoalBottomSheet(),
                    child: Row(
                      children: [
                        CommonText(
                          text: "${selectedDistance.toString()}KM",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 8.setWidth),
                        Icon(Icons.arrow_drop_down_outlined, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Divider(
                  color: CustomAppColor.of(
                    context,
                  ).txtBlack.withValues(alpha: 0.1),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icDailyGoal,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtUnit,
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                          CommonText(
                            text: Languages.of(
                              context,
                            ).txtMetricsAndImperialUnit,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtDarkGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _showMetricAndImperialUnitBottomSheet(),
                    child: Row(
                      children: [
                        CommonText(
                          text: "KM",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 8.setWidth),
                        Icon(Icons.arrow_drop_down_outlined, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showSetDailyGoalBottomSheet() {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      backgroundColor: CustomAppColor.of(context).bottomNavbar,
      builder: (context) {
        UnitType currentUnit = weightUnitType;
        int currentSelectedDistance = selectedDistance;

        return StatefulBuilder(
          builder: (context, setModalState) {
            final List<int> distances = List.generate(96, (index) {
              int kmValue = index + 5;
              return currentUnit == UnitType.km
                  ? kmValue
                  : (kmValue * 0.621371).round();
            });

            return SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4.setHeight,
                          width: 50.setWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFBDBDBD),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonText(
                      text: Languages.of(context).txtSetDailyGoal.toUpperCase(),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.setFontSize,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    Divider(),
                    SizedBox(height: 16.setHeight),
                    buildUnitToggle(
                      context: context,
                      selectedUnit: currentUnit,
                      onChanged: (unit) {
                        setModalState(() {
                          currentUnit = unit;
                        });
                      },
                    ),
                    SizedBox(height: 30.setHeight),
                    SizedBox(
                      height: 180.setHeight,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 150.setHeight,
                            width: 100.setWidth,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CupertinoPicker(
                                  useMagnifier: true,
                                  magnification: 1,
                                  looping: true,
                                  itemExtent: 90.0,
                                  diameterRatio: 10,
                                  scrollController: FixedExtentScrollController(
                                    initialItem: distances.indexOf(
                                      currentSelectedDistance,
                                    ),
                                  ),
                                  selectionOverlay: Container(),
                                  onSelectedItemChanged: (index) {
                                    setModalState(() {
                                      currentSelectedDistance =
                                          distances[index];
                                    });
                                  },
                                  children: distances
                                      .map(
                                        (w) => Center(
                                          child: CommonText(
                                            text: "$w",
                                            fontSize: 30.setFontSize,
                                            fontWeight: FontWeight.w700,
                                            textColor: CustomAppColor.of(
                                              context,
                                            ).txtPrimary,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                _buildPickerDivider(),
                              ],
                            ),
                          ),
                          Positioned(
                            right:
                                MediaQuery.of(context).size.width / 2 +
                                40.setWidth,
                            child: Image.asset(
                              AppAssets.icPrimaryNavigator,
                              height: 30.setHeight,
                              width: 30.setWidth,
                              color: CustomAppColor.of(context).primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.setHeight),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 30.setWidth,
                      ),
                      child: CommonButton(
                        height: 50.setHeight,
                        radius: 30,
                        text: Languages.of(
                          context,
                        ).txtSetAsMyGoal.toUpperCase(),
                        buttonTextColor: CustomAppColor.of(context).txtWhite,
                        onTap: () {
                          setState(() {
                            weightUnitType = currentUnit;
                            selectedDistance = currentSelectedDistance;
                          });
                          Navigator.pop(context);
                        },
                        buttonColor: CustomAppColor.of(context).primary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showMetricAndImperialUnitBottomSheet() {
    showModalBottomSheet(
      context: context,
      scrollControlDisabledMaxHeightRatio: 0.9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      backgroundColor: CustomAppColor.of(context).bottomNavbar,
      builder: (context) {
        UnitType currentUnit = weightUnitType;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4.setHeight,
                          width: 50.setWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFBDBDBD),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonText(
                      text: Languages.of(
                        context,
                      ).txtMetricsAndImperialUnit.toUpperCase(),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.setFontSize,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    Divider(),
                    SizedBox(height: 16.setHeight),
                    _buildUnitOption(
                      context: context,
                      label: Languages.of(context).txtKm.toUpperCase(),
                      isSelected: currentUnit == UnitType.km,
                      onTap: () {
                        setModalState(() => currentUnit = UnitType.km);
                        setState(() => weightUnitType = UnitType.km);
                      },
                    ),
                    SizedBox(height: 10.setHeight),
                    _buildUnitOption(
                      context: context,
                      label: Languages.of(context).txtMile.toUpperCase(),
                      isSelected: currentUnit == UnitType.mi,
                      onTap: () {
                        setModalState(() => currentUnit = UnitType.mi);
                        setState(() => weightUnitType = UnitType.mi);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildUnitOption({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.setHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? CustomAppColor.of(context).txtPrimary
                : CustomAppColor.of(context).border,
            width: 1.5,
          ),
          color: CustomAppColor.of(context).selectedContainer,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: label,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: isSelected
                  ? CustomAppColor.of(context).txtPrimary
                  : Colors.grey.shade600,
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: CustomAppColor.of(context).txtPrimary,
                size: 22.setWidth,
              ),
          ],
        ),
      ),
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

  Widget buildUnitToggle({
    required BuildContext context,
    required UnitType selectedUnit,
    required ValueChanged<UnitType> onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).toggleBg,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            _buildToggleItem(
              context: context,
              label: 'KM',
              isSelected: selectedUnit == UnitType.km,
              onTap: () => onChanged(UnitType.km),
            ),
            _buildToggleItem(
              context: context,
              label: 'MILE',
              isSelected: selectedUnit == UnitType.mi,
              onTap: () => onChanged(UnitType.mi),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem({
    required BuildContext context,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50.setHeight,
          decoration: BoxDecoration(
            color: isSelected
                ? CustomAppColor.of(context).lime
                : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: CommonText(
            text: label,
            fontWeight: FontWeight.bold,
            textColor: isSelected
                ? CustomAppColor.of(context).black
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class GeneralSettingsView extends StatelessWidget {
  final ValueNotifier<bool> isDarkMode;

  const GeneralSettingsView({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtGeneralSettings.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.setWidth,
            vertical: 14.setHeight,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).containerBgColor,
            border: Border.all(color: CustomAppColor.of(context).border),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, ReminderScreen.route()),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.icReminder,
                            height: 24.setHeight,
                            width: 24.setWidth,
                          ),
                          SizedBox(width: 12.setWidth),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtReminder,
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                              CommonText(
                                text: Languages.of(context).txtEverydays,
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(
                                  context,
                                ).txtDarkGrey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          CommonText(
                            text: "09:00 AM",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 8.setWidth),
                          Icon(Icons.arrow_drop_down_outlined, size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Divider(
                  color: CustomAppColor.of(
                    context,
                  ).txtBlack.withValues(alpha: 0.1),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icLanguage,
                        height: 20.setHeight,
                        width: 20.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtLanguage,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => _showLanguageBottomSheet(context),
                    child: Row(
                      children: [
                        CommonText(
                          text: "English",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 8.setWidth),
                        Icon(Icons.arrow_drop_down_outlined, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Divider(
                  color: CustomAppColor.of(
                    context,
                  ).txtBlack.withValues(alpha: 0.1),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icMoon,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtDarkMode,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  ValueListenableBuilder<bool>(
                    valueListenable: isDarkMode,
                    builder: (context, value, child) {
                      return IgnorePointer(
                        ignoring: true,
                        child: FlutterSwitch(
                          value: value,
                          onToggle: (bool newValue) {
                            isDarkMode.value = newValue;
                            getIt.get<LocalStorageService>().setBool(
                              LocalStorageService.isLightTheme,
                              !newValue,
                            );
                            final newTheme = newValue
                                ? ThemeData.dark()
                                : ThemeData.light();
                            RunTrackerScreensApp.changeTheme(context, newTheme);
                          },
                          activeColor: CustomAppColor.of(context).primary,
                          inactiveColor: CustomAppColor.of(
                            context,
                          ).grey.withValues(alpha: 0.5),
                          activeToggleColor: CustomAppColor.of(context).white,
                          inactiveToggleColor: CustomAppColor.of(context).white,
                          width: 40.setWidth,
                          height: 22.setHeight,
                          toggleSize: 16.0,
                          borderRadius: 16.0,
                          padding: 2.5,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    int selectedIndex = 1;

    final List<String> languages = [
      'Arabic',
      'English',
      'Chinese (Mandarin)',
      'Urdu',
      'French',
      'German',
      'Hindi',
      'Italian',
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bottomNavbar,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.setHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 4.setHeight,
                        width: 50.setWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFBDBDBD),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: CommonText(
                        text: Languages.of(
                          context,
                        ).txtChooseTheLanguage.toUpperCase(),
                        fontWeight: FontWeight.w800,
                        fontSize: 18.setFontSize,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(height: 5.setHeight),
                    const Divider(),
                    SizedBox(height: 5.setHeight),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: languages.length,
                      separatorBuilder: (_, __) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                        child: Divider(
                          height: 1,
                          color: CustomAppColor.of(
                            context,
                          ).black.withValues(alpha: 0.1),
                        ),
                      ),
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;
                        return InkWell(
                          onTap: () {
                            setModalState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            color: isSelected
                                ? CustomAppColor.of(
                                    context,
                                  ).primary.withValues(alpha: 0.1)
                                : Colors.transparent,
                            padding: EdgeInsets.symmetric(
                              vertical: 22.setHeight,
                              horizontal: 22.setWidth,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: isSelected
                                      ? CustomAppColor.of(context).primary
                                      : CustomAppColor.of(context).txtDarkGrey,
                                ),
                                SizedBox(width: 16.setWidth),
                                Expanded(
                                  child: CommonText(
                                    text: languages[index],
                                    fontSize: 16.setFontSize,
                                    textColor: isSelected
                                        ? CustomAppColor.of(
                                            context,
                                          ).txtBlackPrimary
                                        : CustomAppColor.of(
                                            context,
                                          ).txtDarkGrey,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                if (isSelected)
                                  Icon(
                                    Icons.check_circle,
                                    color: CustomAppColor.of(context).primary,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtAccountSettings.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 10.setHeight),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.setWidth,
              vertical: 14.setHeight,
            ),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).containerBgColor,
              border: Border.all(color: CustomAppColor.of(context).border),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icGoogle,
                          height: 23.setHeight,
                          width: 23.setWidth,
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtBackupAndRestore,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      AppAssets.icRefresh,
                      height: 18.setHeight,
                      width: 20.setWidth,
                      color: CustomAppColor.of(context).icBlack,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: Divider(
                    color: CustomAppColor.of(
                      context,
                    ).txtBlack.withValues(alpha: 0.1),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.push(context, SubscriptionScreen.route()),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icSubscription,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtSubscription,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
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

class TermsAndSupportView extends StatelessWidget {
  const TermsAndSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtTermsAndSupport.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.setWidth,
            vertical: 14.setHeight,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).containerBgColor,
            border: Border.all(color: CustomAppColor.of(context).border),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icRateUs,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtRateUs,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    AppAssets.icRightNavigator,
                    height: 22.setHeight,
                    width: 22.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Divider(
                  color: CustomAppColor.of(
                    context,
                  ).txtBlack.withValues(alpha: 0.1),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icContactUs,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtContactUs,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    AppAssets.icRightNavigator,
                    height: 22.setHeight,
                    width: 22.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Divider(
                  color: CustomAppColor.of(
                    context,
                  ).txtBlack.withValues(alpha: 0.1),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icPrivacyPolicy,
                        height: 24.setHeight,
                        width: 24.setWidth,
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtPrivacyPolicy,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    AppAssets.icRightNavigator,
                    height: 22.setHeight,
                    width: 22.setWidth,
                    color: CustomAppColor.of(context).icBlack,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
