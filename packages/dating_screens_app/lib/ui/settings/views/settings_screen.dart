import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/ui/app/my_app.dart';
import 'package:dating_screens_app_package/ui/community_guidelines/views/community_guidelines_screen.dart';
import 'package:dating_screens_app_package/ui/edit_profile/views/edit_profile_screen.dart';
import 'package:dating_screens_app_package/ui/edit_system/views/edit_system_screen.dart';
import 'package:dating_screens_app_package/ui/help_and_support/views/help_and_support_screen.dart';
import 'package:dating_screens_app_package/ui/privacy_policy/views/privacy_policy_screen.dart';
import 'package:dating_screens_app_package/ui/safety_tips/views/safety_tips_screen.dart';
import 'package:dating_screens_app_package/ui/subscription/views/subscription_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:dating_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../terms_and_conditions/views/terms_and_conditions_screen.dart';

class SettingsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingsScreen());
  }

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> implements TopBarClickListener {
  final ValueNotifier<bool> _isPushNotification = ValueNotifier<bool>(true);
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
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtSettings,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                  child: Column(
                    children: [
                      const IgnorePointer(ignoring: true, child: UserDetailView()),
                      SizedBox(height: 20.setHeight),
                      const IgnorePointer(ignoring: true, child: UpgradeCardView()),
                      SizedBox(height: 20.setHeight),
                      const IgnorePointer(ignoring: true, child: SystemInformationView()),
                      SizedBox(height: 20.setHeight),
                      const IgnorePointer(ignoring: true, child: CurrentLocationView()),
                      SizedBox(height: 20.setHeight),
                      const MaximumDistanceView(),
                      SizedBox(height: 20.setHeight),
                      const AgeRangesView(),
                      SizedBox(height: 20.setHeight),
                      IgnorePointer(ignoring: true, child: NotificationView(isDarkMode: isDarkMode, isPushNotification: _isPushNotification)),
                      SizedBox(height: 20.setHeight),
                      const IgnorePointer(ignoring: true, child: ContactUsView()),
                      SizedBox(height: 20.setHeight),
                      const IgnorePointer(ignoring: true, child: CommunityView()),
                      SizedBox(height: 20.setHeight),
                      const IgnorePointer(ignoring: true, child: LegalView()),
                      SizedBox(height: 20.setHeight),
                      const FooterView()
                    ],
                  ),
                ),
              ),
            )
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
  }
}

class UserDetailView extends StatelessWidget {
  const UserDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgTextFormField,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).textFormFieldBorder,
        ),
      ),
      child: InkWell(
        onTap: () => Navigator.push(context, EditProfileScreen.route()),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(AppAssets.imgProfile),
              maxRadius: 35,
            ),
            SizedBox(width: 11.setWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Devin Oliver",
                    textColor: CustomAppColor.of(context).txtVelvet,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.setFontSize,
                  ),
                  CommonText(
                    text: "Photographer",
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.setFontSize,
                  )
                ],
              ),
            ),
            Image.asset(
              AppAssets.icEdit,
              width: 24.setWidth,
              height: 24.setHeight,
            )
          ],
        ),
      ),
    );
  }
}

class UpgradeCardView extends StatelessWidget {
  const UpgradeCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, SubscriptionPlanScreen.route()),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 10.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtVelvetPink,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.imgLefBg,
                  height: 70.setHeight,
                  width: 68.setWidth,
                ),
                Image.asset(
                  AppAssets.icCoin,
                  height: 60.setHeight,
                  width: 60.setWidth,
                ),
                Image.asset(
                  AppAssets.imgRightBg,
                  height: 70.setHeight,
                  width: 68.setWidth,
                ),
              ],
            ),
            SizedBox(height: 12.setHeight),
            CommonText(
              text: Languages.of(context).txtUpgradeToMembership,
              fontWeight: FontWeight.w700,
              fontSize: 20.setFontSize,
              textColor: CustomAppColor.of(context).white,
            ),
            CommonText(
              text: Languages.of(context).txtEnjoyAllTheBenefitsAndExploreMorePossibilities,
              fontWeight: FontWeight.w300,
              fontSize: 11.setFontSize,
              textColor: const Color(0xFFD4C7D3),
            ),
          ],
        ),
      ),
    );
  }
}

class SystemInformationView extends StatelessWidget {
  const SystemInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtSystem.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditSystemScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgTextFormField,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: CustomAppColor.of(context).textFormFieldBorder)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsView(context, AppAssets.icDevice, Languages.of(context).txtPhoneNumber, "+91 12345 67890"),
              Divider(color: CustomAppColor.of(context).divider),
              detailsView(context, AppAssets.icLock, Languages.of(context).txtPassword, "**************"),
              Divider(color: CustomAppColor.of(context).divider),
              detailsView(context, AppAssets.icMail, Languages.of(context).txtEmail, "user@yourdomain.com"),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: Languages.of(context).txtVerifyEmailToHelpSecureYourAccount,
                fontWeight: FontWeight.w400,
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget detailsView(BuildContext context, String iconString, String title, String details) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
      child: Row(
        children: [
          Image.asset(
            iconString,
            height: 24.setHeight,
            width: 24.setWidth,
          ),
          SizedBox(width: 20.setWidth),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 16.setFontSize,
              ),
              CommonText(
                text: details,
                fontWeight: FontWeight.w400,
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CurrentLocationView extends StatelessWidget {
  const CurrentLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtMyCurrentLocation.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).textFormFieldBorder,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                AppAssets.icOutlinedLocation,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
              SizedBox(width: 11.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtCurrentLocation,
                      textColor: CustomAppColor.of(context).txtVelvet,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.setFontSize,
                    ),
                    CommonText(
                      text: "516, Parker Ave NYC, USA",
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.setFontSize,
                    )
                  ],
                ),
              ),
              Icon(
                Icons.navigate_next_rounded,
                color: CustomAppColor.of(context).txtGrey,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtContactUs.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        InkWell(
          onTap: () => Navigator.push(context, HelpSupportScreen.route()),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgTextFormField,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: CustomAppColor.of(context).textFormFieldBorder,
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icHeadPhone,
                  width: 24.setWidth,
                  height: 24.setHeight,
                ),
                SizedBox(width: 11.setWidth),
                Expanded(
                  child: CommonText(
                    text: Languages.of(context).txtHelpAndSupport,
                    textColor: CustomAppColor.of(context).txtVelvet,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.setFontSize,
                    textAlign: TextAlign.start,
                  ),
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: CustomAppColor.of(context).txtGrey,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtCommunity.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 22.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).textFormFieldBorder,
            ),
          ),
          child: Column(
            children: [
              detailsView(
                context: context,
                iconString: AppAssets.icCommunity,
                title: Languages.of(context).txtCommunityGuidelines,
                onTap: () => Navigator.push(context, CommunityGuidelinesScreen.route()),
              ),
              SizedBox(height: 10.setHeight),
              Divider(color: CustomAppColor.of(context).divider),
              SizedBox(height: 10.setHeight),
              detailsView(
                context: context,
                iconString: AppAssets.icSafety,
                title: Languages.of(context).txtSafetyTips,
                onTap: () => Navigator.push(context, SafetyTipsScreen.route()),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget detailsView({required BuildContext context, required String iconString, required String title, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconString,
            width: 24.setWidth,
            height: 24.setHeight,
          ),
          SizedBox(width: 11.setWidth),
          Expanded(
            child: CommonText(
              text: title,
              textColor: CustomAppColor.of(context).txtVelvet,
              fontWeight: FontWeight.w500,
              fontSize: 16.setFontSize,
              textAlign: TextAlign.start,
            ),
          ),
          Icon(
            Icons.navigate_next_rounded,
            color: CustomAppColor.of(context).txtGrey,
          )
        ],
      ),
    );
  }
}

class LegalView extends StatelessWidget {
  const LegalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtLegal.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 22.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).textFormFieldBorder,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsView(
                context: context,
                iconString: AppAssets.icFile,
                title: Languages.of(context).txtPrivacyPolicy,
                onTap: () => Navigator.push(context, PrivacyPolicyScreen.route()),
              ),
              SizedBox(height: 10.setHeight),
              Divider(color: CustomAppColor.of(context).divider),
              SizedBox(height: 10.setHeight),
              detailsView(
                context: context,
                iconString: AppAssets.icFile,
                title: Languages.of(context).txtTermsOfService,
                onTap: () => Navigator.push(context, TermsAndConditionsScreen.route()),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget detailsView({required BuildContext context, required String iconString, required String title, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconString,
            width: 24.setWidth,
            height: 24.setHeight,
          ),
          SizedBox(width: 11.setWidth),
          Expanded(
            child: CommonText(
              text: title,
              textColor: CustomAppColor.of(context).txtVelvet,
              fontWeight: FontWeight.w600,
              fontSize: 16.setFontSize,
              textAlign: TextAlign.start,
            ),
          ),
          Icon(
            Icons.navigate_next_rounded,
            color: CustomAppColor.of(context).txtGrey,
          )
        ],
      ),
    );
  }
}

class MaximumDistanceView extends StatefulWidget {
  const MaximumDistanceView({super.key});

  @override
  State<MaximumDistanceView> createState() => _MaximumDistanceViewState();
}

class _MaximumDistanceViewState extends State<MaximumDistanceView> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = CustomAppColor.of(context).txtPink;

    double sliderValue = 250;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtMaximumDistance.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 22.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: CustomAppColor.of(context).textFormFieldBorder),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "0",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                  CommonText(
                    text: "250",
                    fontWeight: FontWeight.bold,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtVelvet,
                  ),
                  CommonText(
                    text: "500",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: primaryColor,
                  inactiveTrackColor: CustomAppColor.of(context).inactiveSlider,
                  trackHeight: 0.4,
                  thumbColor: primaryColor,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                ),
                child: Slider(
                  padding: EdgeInsets.symmetric(vertical: 5.setHeight),
                  value: sliderValue,
                  min: 0,
                  max: 500,
                  divisions: 100,
                  label: sliderValue.round().toString(),
                  onChanged: (double newValue) {
                    setState(
                      () {
                        sliderValue = newValue;
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AgeRangesView extends StatefulWidget {
  const AgeRangesView({super.key});

  @override
  State<AgeRangesView> createState() => _AgeRangesViewState();
}

class _AgeRangesViewState extends State<AgeRangesView> {
  RangeValues _range = const RangeValues(25, 45);
  final double _min = 10;
  final double _max = 60;

  @override
  Widget build(BuildContext context) {
    final primaryColor = CustomAppColor.of(context).txtPink;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtAgeRanges.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        Container(
          padding: EdgeInsets.symmetric(vertical: 19.setHeight),
          decoration: BoxDecoration(
            border: Border.all(color: CustomAppColor.of(context).textFormFieldBorder),
            borderRadius: BorderRadius.circular(14),
            color: CustomAppColor.of(context).bgTextFormField,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double sliderPadding = 16.setWidth;
              final double trackWidth = constraints.maxWidth - (sliderPadding * 2);

              final double leftThumbX = ((_range.start - _min) / (_max - _min)) * trackWidth;
              final double rightThumbX = ((_range.end - _min) / (_max - _min)) * trackWidth;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: sliderPadding + leftThumbX - 12,
                    top: 0,
                    child: CommonText(
                      text: _range.start.round().toString(),
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Right thumb label
                  Positioned(
                    left: sliderPadding + rightThumbX - 12,
                    top: 0,
                    child: CommonText(
                      text: _range.end.round().toString(),
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Slider
                  Padding(
                    padding: EdgeInsets.only(
                      left: sliderPadding,
                      right: sliderPadding,
                      top: 28.setHeight,
                    ),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: primaryColor,
                        inactiveTrackColor: CustomAppColor.of(context).inactiveSlider,
                        trackHeight: 2,
                        thumbColor: primaryColor,
                        overlayShape: SliderComponentShape.noOverlay,
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                        rangeTrackShape: const RectangularRangeSliderTrackShape(),
                      ),
                      child: RangeSlider(
                        values: _range,
                        min: _min,
                        max: _max,
                        divisions: 100,
                        onChanged: (values) {
                          setState(() {
                            _range = values;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NotificationView extends StatefulWidget {
  final ValueNotifier<bool> isDarkMode;
  final ValueNotifier<bool> isPushNotification;

  const NotificationView({super.key, required this.isDarkMode, required this.isPushNotification});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtPersonalization.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 16.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 22.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).textFormFieldBorder,
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icDarkMode,
                    width: 23.setWidth,
                    height: 23.setHeight,
                    color: CustomAppColor.of(context).txtPink,
                  ),
                  SizedBox(width: 11.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtDarkMode,
                      textColor: CustomAppColor.of(context).txtVelvet,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.setFontSize,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: widget.isDarkMode,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {
                          widget.isDarkMode.value = newValue;

                          getIt.get<LocalStorageService>().setBool(
                                LocalStorageService.isLightTheme,
                                !newValue,
                              );
                          final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                          DatingScreensApp.changeTheme(context, newTheme);
                        },
                        activeColor: CustomAppColor.of(context).txtPink,
                        inactiveColor: CustomAppColor.of(context).grey.withValues(alpha: 0.5),
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 44.setWidth,
                        height: 22.setHeight,
                        toggleSize: 16.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              Divider(color: CustomAppColor.of(context).divider),
              SizedBox(height: 10.setHeight),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icBell,
                    width: 23.setWidth,
                    height: 23.setHeight,
                    color: CustomAppColor.of(context).txtPink,
                  ),
                  SizedBox(width: 11.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtPushNotification,
                      textColor: CustomAppColor.of(context).txtVelvet,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.setFontSize,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: widget.isPushNotification,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {},
                        activeColor: CustomAppColor.of(context).txtPink,
                        inactiveColor: CustomAppColor.of(context).grey.withValues(alpha: 0.5),
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 44.setWidth,
                        height: 22.setHeight,
                        toggleSize: 16.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FooterView extends StatelessWidget {
  const FooterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.setHeight),
        Image.asset(
          AppAssets.icLogo,
          height: 100.setHeight,
          width: 100.setWidth,
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: "Meet Me v1.0",
          fontWeight: FontWeight.w900,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtPink,
        ),
        SizedBox(height: 25.setHeight),
        InkWell(
          onTap: () => _showLogoutAlert(context),
          child: CommonText(
            text: Languages.of(context).txtLogOut,
            fontWeight: FontWeight.w700,
            fontSize: 16.setFontSize,
            textColor: CustomAppColor.of(context).txtVelvetPink,
          ),
        ),
        SizedBox(height: 8.setHeight),
        InkWell(
          onTap: () => _showDeleteAccountAlert(context),
          child: CommonText(
            text: Languages.of(context).txtDeleteAccount,
            fontWeight: FontWeight.w700,
            fontSize: 16.setFontSize,
            textColor: CustomAppColor.of(context).txtVelvetPink,
          ),
        ),
      ],
    );
  }

  void _showLogoutAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 18.setWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.setWidth),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSwipeCard,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 5.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScaffold,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (dialogContext.mounted) {
                          Navigator.pop(dialogContext);
                        }
                      },
                      child: Icon(Icons.close, color: CustomAppColor.of(context).txtPink),
                    ),
                  ),
                ),
                SizedBox(height: 10.setHeight),
                CommonText(
                  text: Languages.of(context).txtLogOut,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.setFontSize,
                ),
                SizedBox(height: 5.setHeight),
                Divider(color: CustomAppColor.of(context).divider),
                SizedBox(height: 20.setHeight),
                CommonText(
                  text: Languages.of(context).txtAreYouSureYouWantToLogout,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                SizedBox(height: 20.setHeight),
                CommonButton(
                  text: Languages.of(context).txtLogOut.toUpperCase(),
                  onTap: () {
                    if (dialogContext.mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteAccountAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSwipeCard,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 5.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScaffold,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (dialogContext.mounted) {
                          Navigator.pop(dialogContext);
                        }
                      },
                      child: Icon(Icons.close, color: CustomAppColor.of(context).txtPink),
                    ),
                  ),
                ),
                SizedBox(height: 5.setHeight),
                CommonText(
                  text: Languages.of(context).txtDeleteAccount,
                  fontWeight: FontWeight.w800,
                  fontSize: 22.setFontSize,
                ),
                SizedBox(height: 5.setHeight),
                Divider(color: CustomAppColor.of(context).divider),
                SizedBox(height: 20.setHeight),
                CommonText(
                  text: Languages.of(context).txtAreYouSureYouWantToDeleteAccount,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                SizedBox(height: 20.setHeight),
                CommonButton(
                  text: Languages.of(context).txtDeleteAccount.toUpperCase(),
                  onTap: () {
                    if (dialogContext.mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
