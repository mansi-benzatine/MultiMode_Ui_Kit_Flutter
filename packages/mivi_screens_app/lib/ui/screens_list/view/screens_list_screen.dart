import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/about_mivi/view/about_mivi_screen.dart';
import 'package:mivi_screens_app/ui/add_music/view/add_music_screen.dart';
import 'package:mivi_screens_app/ui/choose_media/view/choose_media_screen.dart';
import 'package:mivi_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:mivi_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:mivi_screens_app/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:mivi_screens_app/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:mivi_screens_app/ui/get_start/views/get_start_screen.dart';
import 'package:mivi_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:mivi_screens_app/ui/languages/view/langugage_screen.dart';
import 'package:mivi_screens_app/ui/mivi_pro/view/mivi_pro_screen.dart';
import 'package:mivi_screens_app/ui/onboarding/view/onboarding_screen.dart';
import 'package:mivi_screens_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:mivi_screens_app/ui/privacy_and_policy/view/privacy_and_policy_screen.dart';
import 'package:mivi_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:mivi_screens_app/ui/search/view/search_screen.dart';
import 'package:mivi_screens_app/ui/security/view/security_screen.dart';
import 'package:mivi_screens_app/ui/share/view/share_screen.dart';
import 'package:mivi_screens_app/ui/sign_in/view/sign_in_screen.dart';
import 'package:mivi_screens_app/ui/sign_up/view/sign_up_screen.dart';
import 'package:mivi_screens_app/ui/terms_and_condition/view/terms_and_condition_screen.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../choose_media/datamodel/choose_media_data.dart';
import '../../edit_video/view/edit_video_screen.dart';
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
        title: "Onboarding 4",
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Get Start",
        onClick: () => Navigator.push(context, GetStartScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sign In",
        onClick: () => Navigator.push(context, SignInScreen.route()),
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
        title: "Enter OTP ",
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
        onClick: () => Navigator.push(context, ResetPasswordScreen.route(isShowSuccessAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home : Grid View",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 0,
            isForListViewHome: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home : List View",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(
            currentIndex: 0,
            isForListViewHome: false,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Templates : Photos",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(currentIndex: 1, currentIndexOfTemplates: 0),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Templates : Videos",
        onClick: () => Navigator.push(
          context,
          DashboardScreen.route(currentIndex: 1, currentIndexOfTemplates: 1),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route(isForEmptySearchView: false)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search Not Found",
        onClick: () => Navigator.push(context, SearchScreen.route(isForEmptySearchView: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Choose Media ",
        onClick: () => Navigator.push(context, ChooseMediaScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video",
        onClick: () => Navigator.push(
            context,
            EditVideoScreen.route(imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ])),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Add Music",
        onClick: () => Navigator.push(context, AddMusicScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Edit Canvas",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 0,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Edit Background",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 1,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Add Text",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 2,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Custom text",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 13,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Align Text",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 13,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Add Color",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 13,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Add Font Style",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 13,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Add Stickers",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 3,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Trim Video",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 4,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Cut Video",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 5,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Split Video",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 6,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Crop",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 7,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Speed",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 8,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Filter",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 9,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Transition",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 10,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Volume",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 11,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Video : Adjust",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            currentIndex: 12,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Export",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            isShowExportVideoBs: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Export Video Loading",
        onClick: () => Navigator.push(
          context,
          EditVideoScreen.route(
            imageList: [
              MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
              MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
            ],
            isShowExportVideoBs: true,
            isShowLoader: true,
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Share Video",
        onClick: () => Navigator.push(context, ShareScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Setting",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Security",
        onClick: () => Navigator.push(context, SecurityScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguagesScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "About Mivi",
        onClick: () => Navigator.push(context, AboutMiviScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Share",
        onClick: () => Navigator.push(context, AboutMiviScreen.route(isShowShareBs: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
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
        title: "Terms Of Service",
        onClick: () => Navigator.push(context, TermsAndConditionScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Mivi Pro",
        onClick: () => Navigator.push(context, MiviProScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Method",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Payment Successfully",
        onClick: () => Navigator.push(context, PaymentMethodScreen.route(isShowSuccessAlert: true)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Logout",
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2, isShowLogoutAlert: true)),
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
            text: "Mivi - Music Video Maker App",
            fontSize: 18.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
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
                      fontFamily: Constant.fontFamilySemiBold600,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
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
