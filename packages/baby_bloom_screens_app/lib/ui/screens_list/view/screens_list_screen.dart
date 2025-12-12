import 'package:baby_bloom_screens_app/ui/3d_model/view/3d_model_screen.dart';
import 'package:baby_bloom_screens_app/ui/add_medicine/view/add_medicine_screen.dart';
import 'package:baby_bloom_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:baby_bloom_screens_app/ui/baby_names/view/baby_names_screen.dart';
import 'package:baby_bloom_screens_app/ui/contractions/views/contraction_screen.dart';
import 'package:baby_bloom_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:baby_bloom_screens_app/ui/diet_chart/view/diet_chart_screen.dart';
import 'package:baby_bloom_screens_app/ui/edit_medicine/view/edit_medicine_screen.dart';
import 'package:baby_bloom_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:baby_bloom_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:baby_bloom_screens_app/ui/explore_week_detail/view/explore_detail_screen.dart';
import 'package:baby_bloom_screens_app/ui/faq/views/faq_screen.dart';
import 'package:baby_bloom_screens_app/ui/favourite/view/favourite_screen.dart';
import 'package:baby_bloom_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:baby_bloom_screens_app/ui/get_start/view/get_start_screen.dart';
import 'package:baby_bloom_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:baby_bloom_screens_app/ui/history/view/history_screen.dart';
import 'package:baby_bloom_screens_app/ui/kick_counter/view/kick_counter_screen.dart';
import 'package:baby_bloom_screens_app/ui/languages/view/languages_screen.dart';
import 'package:baby_bloom_screens_app/ui/login/view/login_screen.dart';
import 'package:baby_bloom_screens_app/ui/my_profile/view/my_profile_screen.dart';
import 'package:baby_bloom_screens_app/ui/my_weight/view/my_weight_screen.dart';
import 'package:baby_bloom_screens_app/ui/notification_history/view/notification_history_screen.dart';
import 'package:baby_bloom_screens_app/ui/on_boarding/view/on_boarding_screen.dart';
import 'package:baby_bloom_screens_app/ui/pill_reminder/view/pill_reminder_screen.dart';
import 'package:baby_bloom_screens_app/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/about_you_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/date_of_conception_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/estimated_due_date_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/select_your_first_day_of_last_period_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/set_your_due_date_screen.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/your_weight_screen.dart';
import 'package:baby_bloom_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:baby_bloom_screens_app/ui/search/view/search_screen.dart';
import 'package:baby_bloom_screens_app/ui/sign_up/view/sign_up_screen.dart';
import 'package:baby_bloom_screens_app/ui/size/view/size_screen.dart';
import 'package:baby_bloom_screens_app/ui/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:baby_bloom_screens_app/ui/upgrade_plan/view/upgrade_plan_screen.dart';
import 'package:baby_bloom_screens_app/ui/vaccination/view/vaccination_screen.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../explore_exercise_detail/view/explore_exercise_detail_screen.dart';
import '../../notification_popup/view/notification_popup_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';
import '../../profile_setup/views/congratulation_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../datamodels/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(
      builder: (_) => ScreenListScreen(title: title),
    );
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];
  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash",
        onClick: () => Navigator.push(context, SplashScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        onClick: () => Navigator.push(context, OnBoardingScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Start",
        onClick: () => Navigator.push(context, GetStartScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Login",
        onClick: () => Navigator.push(context, LoginScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign Up",
        onClick: () => Navigator.push(context, SignUpScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Forgot Password",
        onClick: () => Navigator.push(context, ForgotPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter OTP",
        onClick: () => Navigator.push(context, EnterOtpScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password Successfully",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(isShowResetAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "About You",
        onClick: () => Navigator.push(context, AboutYouScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Due Date",
        onClick: () => Navigator.push(context, SetYourDueDateScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Your First Day Of Last Period",
        onClick: () => Navigator.push(context, SelectYourFirstDayOfLastPeriodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Estimated Due Date",
        onClick: () => Navigator.push(context, EstimatedDueDateScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Date Of Conception",
        onClick: () => Navigator.push(context, DateOfConceptionScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Weight",
        onClick: () => Navigator.push(context, YourWeightScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Pregnancy Estimation",
        onClick: () => Navigator.push(context, CongratulationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Due Date",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isForEditDueDate: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calendar",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "No Events",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isForNoEventsBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Note",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isForAddNoteBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Reminder",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isForAddRemindersBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Scheduled Past Events",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isForScheduledEventsPastBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Scheduled Future Events",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 1,
            isForScheduledEventsFutureBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Store",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Weeks",
        onClick: () => Navigator.push(context, ExploreDetailScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Exercise",
        onClick: () => Navigator.push(context, ExploreExerciseDetailScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route(currentViewIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Searched View",
        onClick: () => Navigator.push(context, SearchScreen.route(currentViewIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search Not Found",
        onClick: () => Navigator.push(context, SearchScreen.route(currentViewIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : 3D Model",
        onClick: () => Navigator.push(context, ThreeDModelScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Pill Reminder",
        onClick: () => Navigator.push(context, PillReminderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Medicine",
        onClick: () => Navigator.push(context, AddMedicineScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Medicine",
        onClick: () => Navigator.push(context, EditMedicineScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : My Weight",
        onClick: () => Navigator.push(context, MyWeightScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Diet Chart : Mother",
        onClick: () => Navigator.push(context, DietChartScreen.route(currentIndex: -1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Diet Chart : Baby",
        onClick: () => Navigator.push(context, DietChartScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Kick Counter",
        onClick: () => Navigator.push(context, KickCounterScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Kick Counter - History",
        onClick: () => Navigator.push(context, HistoryScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Size",
        onClick: () => Navigator.push(context, SizeScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Vaccination",
        onClick: () => Navigator.push(context, VaccinationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Vaccination : Dose Completed",
        onClick: () => Navigator.push(context, VaccinationScreen.route(currentAlertIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Vaccination : Dose Upcoming",
        onClick: () => Navigator.push(context, VaccinationScreen.route(currentAlertIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Vaccination : Dose Missing",
        onClick: () => Navigator.push(context, VaccinationScreen.route(currentAlertIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Initial Contractions",
        onClick: () => Navigator.push(context, ContractionScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Recent Contractions",
        onClick: () => Navigator.push(context, ContractionScreen.route(isForHistoryView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Baby Names",
        onClick: () => Navigator.push(context, BabyNamesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : Favorite Names",
        onClick: () => Navigator.push(context, FavouriteScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Tools : FAQ",
        onClick: () => Navigator.push(context, FaqScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Profile",
        onClick: () => Navigator.push(context, MyProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upgrade Plan",
        onClick: () => Navigator.push(context, UpgradePlanScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add New Card",
        onClick: () => Navigator.push(context, AddNewCardScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Upgrade Plan Successfully",
        onClick: () => Navigator.push(context, UpgradePlanScreen.route(isForUpgradeAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Change Due Date",
        onClick: () => Navigator.push(context, MyProfileScreen.route(isShowEditDueDateBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Change Your Weight",
        onClick: () => Navigator.push(context, YourWeightScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Pregnancy Lose Alert",
        onClick: () => Navigator.push(context, MyProfileScreen.route(isShowLossAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification History",
        onClick: () => Navigator.push(context, NotificationHistoryScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Notification History",
        onClick: () => Navigator.push(context, NotificationHistoryScreen.route(isForEmptyView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reminder Preview",
        onClick: () => Navigator.push(context, NotificationPopupScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Rate Us",
        onClick: () => Navigator.push(context, MyProfileScreen.route(isShowRateUsAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Terms & Conditions",
        onClick: () => Navigator.push(context, TermsAndConditionScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center - FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center - Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(context, MyProfileScreen.route(isShowLogoutAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: CustomAppColor.of(context).white,
              ),
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          title: CommonText(
            text: "BabyBloom - Pregnancy Tracker App",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilyMontserratSemiBold,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).white,
          ),
          leadingWidth: 38,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBgHOmeScreenPlain),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 26),
              _ModeGridView(screenList: screenList),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeGridView extends StatelessWidget {
  final List<ScreenListDataModel> screenList;

  const _ModeGridView({required this.screenList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 0.screenWidth,
        margin: EdgeInsets.only(top: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              height: 6.setHeight,
              width: 50.setWidth,
              margin: EdgeInsets.symmetric(vertical: 15.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).greyHandle,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(height: 5.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: List.generate(screenList.length, (index) {
                        return _itemList(
                          context: context,
                          item: screenList[index],
                          index: index + 1,
                        );
                      }),
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemList({
    required BuildContext context,
    required ScreenListDataModel item,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 3.setHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomAppColor.of(context).listTileColorScreenList,
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(
                  context,
                ).listTileShadow.withValues(alpha: .10),
                offset: const Offset(0, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "${index.toString()}.  ",
                      fontSize: 15.setFontSize,
                      fontFamily: Constant.fontFamilyMontserratSemiBold,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilyMontserratSemiBold,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.setWidth),
                child: Image.asset(
                  item.icon,
                  height: 20.setHeight,
                  width: 20.setHeight,
                  gaplessPlayback: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
