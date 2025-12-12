import 'package:flowly_screens_app/ui/add_note/view/add_note_screen.dart';
import 'package:flowly_screens_app/ui/add_pill/view/add_pill_screen.dart';
import 'package:flowly_screens_app/ui/bookmark/view/bookmark_screen.dart';
import 'package:flowly_screens_app/ui/calendar/view/calendar_screen.dart';
import 'package:flowly_screens_app/ui/cycle_history/view/cycle_history_screen.dart';
import 'package:flowly_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:flowly_screens_app/ui/edit_period_date/view/edit_period_date_screen.dart';
import 'package:flowly_screens_app/ui/edit_pill/view/edit_pill_screen.dart';
import 'package:flowly_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:flowly_screens_app/ui/explore_self_care/view/explore_self_care_screen.dart';
import 'package:flowly_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:flowly_screens_app/ui/home/datamodel/home_data.dart';
import 'package:flowly_screens_app/ui/languages/view/languages_screen.dart';
import 'package:flowly_screens_app/ui/onboarding/view/onboarding_screen.dart';
import 'package:flowly_screens_app/ui/pills_settings/view/pills_settings_screens.dart';
import 'package:flowly_screens_app/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:flowly_screens_app/ui/profile_setup/view/profile_setup_screen.dart';
import 'package:flowly_screens_app/ui/reminder/view/reminder_screen.dart';
import 'package:flowly_screens_app/ui/search/view/search_screen.dart';
import 'package:flowly_screens_app/ui/splash/view/splash_screen.dart';
import 'package:flowly_screens_app/ui/terms_and_condition/view/terms_and_condition_screen.dart';
import 'package:flowly_screens_app/ui/unlock_premium/view/unlock_premium_screen.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../edit_note/view/edit_note_screen.dart';
import '../../log_symptoms/datamodel/log_symptoms_data.dart';
import '../../log_symptoms/view/log_symptoms_screen.dart';
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
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Name",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Birthday",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Period Length",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Cycle Length",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Weight",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 4)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set your Height",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 5)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Relationship Status",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 6)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your Goal",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 7)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Set Your First Date Of Last Period",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 8)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Preparing Your Calendar",
        onClick: () => Navigator.push(context, ProfileSetupScreen.route(currentIndex: 8, isShowPreparingLoader: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedDate: DateTime(2025, 8, 14))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home - Non Period View",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedDate: DateTime(2025, 8, 20))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home - Fertile View",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedDate: DateTime(2025, 9, 2))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home - Ovulation View",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedDate: DateTime(2025, 8, 29))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home - Until Period View",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedDate: DateTime(2025, 9, 8))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Calendar",
        onClick: () => Navigator.push(context, CalendarScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Log Symptoms",
        onClick: () => Navigator.push(context, CalendarScreen.route(isShowLogBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Enter Log Symptoms",
        onClick: () => Navigator.push(context, LogSymptomsScreen.route(date: DateTime(2025, 8, 15))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Pill",
        onClick: () => Navigator.push(context, AddPillScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Pill Settings",
        onClick: () => Navigator.push(context, PillsSettingsScreens.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Pill",
        onClick: () => Navigator.push(
          context,
          EditPillScreen.route(
            pills: PillLog(
              id: "1",
              medicineName: "OC-1",
              time: DateTime(2025, 1, 1, 9, 0),
              numberOfIntakes: 1,
              shapeId: AppAssets.icMedicineRound,
              reminder: true,
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Add Note",
        onClick: () => Navigator.push(context, AddNoteScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Note",
        onClick: () => Navigator.push(context, EditNoteScreen.route(noteController: TextEditingController(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."))),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Past Log Symptoms",
        onClick: () => Navigator.push(context, CalendarScreen.route(isShowLogDetailsBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Period Date",
        onClick: () => Navigator.push(context, EditPeriodDateScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Self Care",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Self Care",
        onClick: () => Navigator.push(
          context,
          ExploreSelfCareScreen.route(
            selfCare: SuggestedForYouModel(
              title: "Handle a period during work",
              imageName: AppAssets.imgSelfCare1,
              subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Self Care Video",
        onClick: () => Navigator.push(
          context,
          ExploreSelfCareScreen.route(
            selfCare: SuggestedForYouModel(
              title: "First period?",
              imageName: AppAssets.imgSelfCare1,
              subTitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
              isVideo: true,
              duration: "5:48",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search View",
        onClick: () => Navigator.push(context, SearchScreen.route(isForSearchedView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search Not Found",
        onClick: () => Navigator.push(context, SearchScreen.route(isForEmptyView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Bookmarks",
        onClick: () => Navigator.push(context, BookmarkScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Empty Bookmarks",
        onClick: () => Navigator.push(context, BookmarkScreen.route(isForEmptyScreen: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Report",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Cycle History",
        onClick: () => Navigator.push(context, CycleHistoryScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Personal Information",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reminders",
        onClick: () => Navigator.push(context, ReminderScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Unlock Premium",
        onClick: () => Navigator.push(context, UnlockPremiumScreen.route()),
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
        title: "Help Center : FAQ",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center : Contact Us",
        onClick: () => Navigator.push(context, HelpCenterScreen.route(currentIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Delete Account",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3, isShowDeleteAccountBs: true)),
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
            text: "Flowly - Period Tracker App",
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
