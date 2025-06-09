import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../app/my_app.dart';
import '../../privacy_and_policy/view/privacy_and_policy_screen.dart';
import '../../terms_and_conditions/view/terms_and_conditions_screen.dart';
import '../../update_password/view/update_password_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const SettingsScreen());
  }

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> implements TopBarClickListener {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();

    isDarkMode.value = isDarkModePref;
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          TopBar(
            this,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            title: Languages.of(context).txtSettings,
            isShowTitle: true,
            isShowBack: true,
            iconColor: CustomAppColor.of(context).bgDetailsCard,
          ),
          SizedBox(height: 20.setHeight),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileUpdateCardView(switchValue: isDarkMode),
                  SizedBox(height: 10.setHeight),
                  const AppContentCardView(),
                  SizedBox(height: 10.setHeight),
                  const DeleteAndLogoutCardView()
                ],
              ),
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

class ProfileUpdateCardView extends StatefulWidget {
  final ValueNotifier<bool> switchValue;

  const ProfileUpdateCardView({
    super.key,
    required this.switchValue,
  });

  @override
  State<ProfileUpdateCardView> createState() => ProfileUpdateCardViewState();
}

class ProfileUpdateCardViewState extends State<ProfileUpdateCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 8.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomAppColor.of(context).bgWhiteSecondary,
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 15,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _showConfirmationBottomSheet(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow.withOpacityPercent(0.2),
                          ),
                          child: Image.asset(
                            AppAssets.icStatus,
                            width: 21.setWidth,
                            height: 21.setHeight,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtJobSeekingStatus,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            ),
            SizedBox(height: 20.setHeight),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                          ),
                          child: Image.asset(
                            AppAssets.icProfile,
                            width: 21.setWidth,
                            height: 21.setHeight,
                            color: CustomAppColor.of(context).icPrimary,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtProfile,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 42.setWidth,
                        height: 42.setHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                        ),
                        child: Image.asset(
                          AppAssets.icFilledNotification,
                          width: 14.setWidth,
                          height: 17.setHeight,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtNotifications,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtGreyWhite,
                      ),
                    ],
                  ),
                ),
                FlutterSwitch(
                  value: true,
                  onToggle: (bool value) {
                    setState(() {});
                  },
                  activeColor: CustomAppColor.of(context).primary,
                  inactiveColor: CustomAppColor.of(context).grey,
                  activeToggleColor: CustomAppColor.of(context).white,
                  inactiveToggleColor: CustomAppColor.of(context).white,
                  width: 38.setWidth,
                  height: 20.setHeight,
                  toggleSize: 16.0,
                  borderRadius: 16.0,
                  padding: 2.5,
                ),
              ],
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 42.setWidth,
                        height: 42.setHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                        ),
                        child: Image.asset(
                          AppAssets.icMode,
                          width: 17.setWidth,
                          height: 17.setHeight,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtDarkMode,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtGreyWhite,
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: widget.switchValue,
                  builder: (context, value, child) {
                    return FlutterSwitch(
                      value: value,
                      onToggle: (bool newValue) {
                        widget.switchValue.value = newValue;
                        getIt.get<LocalStorageService>().setBool(
                              LocalStorageService.isLightTheme,
                              !newValue,
                            );
                        final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                        JobFinderAppForMain.changeTheme(context, newTheme);
                      },
                      activeColor: CustomAppColor.of(context).icPrimary,
                      inactiveColor: CustomAppColor.of(context).grey.withOpacityPercent(0.5),
                      activeToggleColor: CustomAppColor.of(context).white,
                      inactiveToggleColor: CustomAppColor.of(context).icPrimary,
                      width: 38.setWidth,
                      height: 22.setHeight,
                      toggleSize: 16.0,
                      borderRadius: 16.0,
                      padding: 2.5,
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20.setHeight),
            GestureDetector(
              onTap: () => Navigator.push(context, UpdatePasswordScreen.route()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                          ),
                          child: Image.asset(
                            AppAssets.icFilledPassword,
                            width: 17.setWidth,
                            height: 17.setHeight,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtUpdatePassword,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppContentCardView extends StatelessWidget {
  const AppContentCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 8.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomAppColor.of(context).bgWhiteSecondary,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, PrivacyAndPolicyScreen.route()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                          ),
                          child: Image.asset(
                            AppAssets.icPrivacyPolicy,
                            width: 21.setWidth,
                            height: 21.setHeight,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtPrivacyAndPolicy,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            ),
            SizedBox(height: 20.setHeight),
            GestureDetector(
              onTap: () => Navigator.push(context, TermsAndConditionsScreen.route()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                          ),
                          child: Image.asset(
                            AppAssets.icTermsAndConditions,
                            width: 21.setWidth,
                            height: 21.setHeight,
                            color: CustomAppColor.of(context).icPrimary,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtTermsAndConditions,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 42.setWidth,
                        height: 42.setHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                        ),
                        child: Image.asset(
                          AppAssets.icEditSquare,
                          width: 21.setWidth,
                          height: 21.setHeight,
                          color: CustomAppColor.of(context).icPrimary,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtHelpAndSupport,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtGreyWhite,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppAssets.icRightArrow,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: CustomAppColor.of(context).icGrey,
                )
              ],
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 42.setWidth,
                        height: 42.setHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                        ),
                        child: Image.asset(
                          AppAssets.icAboutUs,
                          width: 17.setWidth,
                          height: 17.setHeight,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAboutUs,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtGreyWhite,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppAssets.icRightArrow,
                  width: 14.setWidth,
                  height: 14.setHeight,
                  color: CustomAppColor.of(context).icGrey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteAndLogoutCardView extends StatelessWidget {
  const DeleteAndLogoutCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 8.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CustomAppColor.of(context).bgWhiteSecondary,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _showLogoutBottomSheet(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                          ),
                          child: Image.asset(
                            AppAssets.icLogout,
                            width: 21.setWidth,
                            height: 21.setHeight,
                            color: CustomAppColor.of(context).txtRed,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtLogout,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtRed,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            ),
            SizedBox(height: 20.setHeight),
            GestureDetector(
              onTap: () => _showDeleteBottomSheet(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 42.setWidth,
                          height: 42.setHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgContainerPrimaryShadow,
                          ),
                          child: Image.asset(
                            AppAssets.icFilledDelete,
                            width: 21.setWidth,
                            height: 21.setHeight,
                            color: CustomAppColor.of(context).txtRed,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtDeleteAccount,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.setFontSize,
                          textColor: CustomAppColor.of(context).txtRed,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    AppAssets.icRightArrow,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showConfirmationBottomSheet(BuildContext context) {
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(1);

  showModalBottomSheet(
    context: context,
    scrollControlDisabledMaxHeightRatio: 0.5,
    backgroundColor: CustomAppColor.of(context).bgWhiteSecondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.setWidth),
        child: ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60.setWidth,
                    height: 4.setHeight,
                    decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                  ),
                ),
                SizedBox(height: 20.setHeight),
                GestureDetector(
                  onTap: () => selectedIndex.value = 0,
                  child: _buildSelectionContainer(
                    context,
                    isSelected: value == 0,
                    icon: value == 0 ? AppAssets.icRadioSelected : AppAssets.icRadioUnCheck,
                    title: Languages.of(context).txtActivelyLookingForJobs,
                    description: Languages.of(context).txtActivelyLookingForJobsDesc,
                  ),
                ),
                SizedBox(height: 20.setHeight),
                GestureDetector(
                  onTap: () => selectedIndex.value = 1,
                  child: _buildSelectionContainer(
                    context,
                    isSelected: value == 1,
                    icon: value == 1 ? AppAssets.icRadioSelected : AppAssets.icRadioUnCheck,
                    title: Languages.of(context).txtPassivelyLookingForJobs,
                    description: Languages.of(context).txtPassivelyLookingForJobsDesc,
                  ),
                ),
                SizedBox(height: 20.setHeight),
                GestureDetector(
                  onTap: () => selectedIndex.value = 2,
                  child: _buildSelectionContainer(
                    context,
                    isSelected: value == 2,
                    icon: value == 2 ? AppAssets.icRadioSelected : AppAssets.icRadioUnCheck,
                    title: Languages.of(context).txtNotLookingForJobs,
                    description: Languages.of(context).txtNotLookingForJobsDesc,
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

Widget _buildSelectionContainer(BuildContext context,
    {required bool isSelected, required String icon, required String title, required String description}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 18.setHeight),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 15,
          color: CustomAppColor.of(context).black.withOpacityPercent(.08),
        ),
      ],
      color: isSelected ? CustomAppColor.of(context).bgContainerSecondary : CustomAppColor.of(context).bgScreenWhite,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        Image.asset(
          icon,
          height: 20.setHeight,
          width: 20.setWidth,
          color: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).icGrey,
        ),
        SizedBox(width: 19.setWidth),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: title,
                fontWeight: FontWeight.w700,
                fontSize: 16.setFontSize,
                textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtSecondaryWhite,
              ),
              CommonText(
                text: description,
                fontWeight: FontWeight.w400,
                fontSize: 12.setFontSize,
                maxLines: 3,
                textAlign: TextAlign.start,
                textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGrey,
              )
            ],
          ),
        )
      ],
    ),
  );
}

void _showLogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: CustomAppColor.of(context).bgScreenWhite,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60.setWidth,
              height: 4.setHeight,
              decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppAssets.icCloseSquare,
                color: CustomAppColor.of(context).icPrimary,
                height: 40.setHeight,
                width: 40.setWidth,
              ),
            ),
          ),
          Image.asset(
            AppAssets.imgBgLogout,
            width: 112.setWidth,
            height: 112.setHeight,
          ),
          SizedBox(height: 28.setHeight),
          CommonText(
            text: Languages.of(context).txtLogout,
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtSecondary,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtLogoutDesc,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          SizedBox(height: 28.setHeight),
          _ContinueButtonView(
            buttonText: Languages.of(context).txtLogoutButtonDesc,
            onTap: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}

void _showDeleteBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: CustomAppColor.of(context).bgScreenWhite,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    builder: (context) {
      return Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 60.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                ),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      AppAssets.icCloseSquare,
                      color: CustomAppColor.of(context).icPrimary,
                      height: 40.setHeight,
                      width: 40.setWidth,
                    ),
                  ),
                ),
              ),
              Image.asset(
                AppAssets.imgDeleteAccount,
                width: 112.setWidth,
                height: 112.setHeight,
              ),
              SizedBox(height: 28.setHeight),
              CommonText(
                text: Languages.of(context).txtDeleteAccount,
                fontSize: 24.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtSecondary,
              ),
              SizedBox(height: 10.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: CommonText(
                  text: Languages.of(context).txtAreYouSureYouWantToDeleteAccount,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
              SizedBox(height: 28.setHeight),
              _ContinueButtonView(
                buttonText: Languages.of(context).txtYesDeleteAccount,
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      );
    },
  );
}

class _ContinueButtonView extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const _ContinueButtonView({required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgWhiteSecondary,
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
          onTap: onTap,
          text: buttonText,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          buttonTextColor: CustomAppColor.of(context).white,
        ),
      ),
    );
  }
}
