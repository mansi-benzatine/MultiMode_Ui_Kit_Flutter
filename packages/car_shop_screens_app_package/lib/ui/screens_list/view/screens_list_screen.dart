import 'package:car_shop_screens_app_package/edit_profile/view/edit_profile_screen.dart';
import 'package:car_shop_screens_app_package/ui/all_brand/view/all_brand_screen.dart';
import 'package:car_shop_screens_app_package/ui/brand_car_list/view/brand_car_list_screen.dart';
import 'package:car_shop_screens_app_package/ui/call/view/call_screen.dart';
import 'package:car_shop_screens_app_package/ui/car_detail/view/car_detail_screen.dart';
import 'package:car_shop_screens_app_package/ui/customer_service/view/customer_service.dart';
import 'package:car_shop_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:car_shop_screens_app_package/ui/forgot_password/view/forgot_password_screen.dart';
import 'package:car_shop_screens_app_package/ui/help_center/view/help_center_screen.dart';
import 'package:car_shop_screens_app_package/ui/language_setting/view/language_setting_screen.dart';
import 'package:car_shop_screens_app_package/ui/login/view/login_screen.dart';
import 'package:car_shop_screens_app_package/ui/my_vehicle/view/my_vehicle_screen.dart';
import 'package:car_shop_screens_app_package/ui/notification/view/notification_screen.dart';
import 'package:car_shop_screens_app_package/ui/notification_setting/view/notification_setting.dart';
import 'package:car_shop_screens_app_package/ui/onboarding/on_boarding_screen.dart';
import 'package:car_shop_screens_app_package/ui/popular_cars/view/polpular_cars_screen.dart';
import 'package:car_shop_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:car_shop_screens_app_package/ui/profile_setup/create_new_pin/view/create_new_pin_screen.dart';
import 'package:car_shop_screens_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:car_shop_screens_app_package/ui/search/view/search_screen.dart';
import 'package:car_shop_screens_app_package/ui/sell_car/view/sell_car_screen.dart';
import 'package:car_shop_screens_app_package/ui/sign_up/view/sign_up_screen.dart';
import 'package:car_shop_screens_app_package/ui/used_car/view/used_car_screen.dart';
import 'package:car_shop_screens_app_package/ui/verify_otp/view/verify_otp_screen.dart';
import 'package:car_shop_screens_app_package/ui/view_offer/view/view_offer_screen.dart';
import 'package:car_shop_screens_app_package/ui/welcome/view/welcome_screen.dart';
import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../enter_car_detail/view/enter_car_detail_screen.dart';
import '../../home/view/home_screen.dart';
import '../../news/view/news_screen.dart';
import '../../news_detail/view/news_detail_screen.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';
import '../../profile_setup/your_profile/view/your_profile_screen.dart';
import '../../similar_offer/view/similar_offer_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../../used_car_detail/view/used_car_detail_screen.dart';
import '../../view_seller_detail/view/view_seller_detail_screen.dart';
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
        onClick: () => Navigator.push(context, OnboardingScreen.route(selectedIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        onClick: () => Navigator.push(context, OnboardingScreen.route(selectedIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        onClick: () => Navigator.push(context, OnboardingScreen.route(selectedIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Welcome",
        onClick: () => Navigator.push(context, WelcomeScreen.route()),
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
        onClick: () => Navigator.push(context, VerifyOtpScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Reset Password",
        onClick: () => Navigator.push(context, ResetPasswordScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Favorite Brands",
        onClick: () => Navigator.push(context, YourFavBrandScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Your Profile",
        onClick: () => Navigator.push(context, YourProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Create New Pin",
        onClick: () => Navigator.push(context, CreateNewPinScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Home",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedIndex: 0)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Search",
        onClick: () => Navigator.push(context, SearchScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification",
        onClick: () => Navigator.push(context, NotificationScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "All Brands",
        onClick: () => Navigator.push(context, AllBrandScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Brands List",
        onClick: () => Navigator.push(
            context,
            BrandCarListScreen.route(
              brand: YourFavBrandItem(
                brandName: "Mercedes",
                brandImage: AppAssets.icMercedes,
                isSelected: false,
              ),
            )),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Popular Cars",
        onClick: () => Navigator.push(
          context,
          PolpularCarsScreen.route(cars: [
            PopularCarItem(
              carName: "Tesla Model  Y",
              carImage: AppAssets.imgTesla,
              carPrice: "\$32,340",
              carDescription: "New Looks, Longer Range, And Faster Charging Rate",
            ),
            PopularCarItem(
              carName: "Tesla Model  Y",
              carImage: AppAssets.imgTesla2,
              carPrice: "\$32,340",
              carDescription: "New Looks, Longer Range, And Faster Charging Rate",
            ),
            PopularCarItem(
              carName: "Tesla Model  Y",
              carImage: AppAssets.imgMercedes,
              carPrice: "\$32,340",
              carDescription: "New Looks, Longer Range, And Faster Charging Rate",
            ),
          ]),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Car All Details",
        onClick: () => Navigator.push(
          context,
          CarDetailScreen.route(
            car: PopularCarItem(
              carName: "Tesla Model  Y",
              carImage: AppAssets.imgTesla,
              carPrice: "\$32,340",
              carDescription: "New Looks, Longer Range, And Faster Charging Rate",
            ),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "View Offers",
        onClick: () => Navigator.push(context, ViewOfferScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "View Similar Offers",
        onClick: () => Navigator.push(context, SimilarOfferScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Used Car",
        onClick: () => Navigator.push(context, UsedCarScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Used Car Overview",
        onClick: () => Navigator.push(context, UsedCarDetailScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "View Seller Details",
        onClick: () => Navigator.push(context, ViewSellerDetailScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Favorite Car",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedIndex: 2)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Sell Car",
        onClick: () => Navigator.push(context, SellCarScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Select Required Car Detail",
        onClick: () => Navigator.push(context, EnterCarDetailScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Car News",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedIndex: 1)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Explore Car News",
        onClick: () => Navigator.push(
          context,
          NewsDetailScreen.route(
            newsItem: NewsItem(
                title: "Tesla's Launched New Model Y In Singapore",
                image: AppAssets.imgNews1,
                date: DateFormat('MMM d, yyyy').format(DateTime.now()),
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
        ),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Profile",
        onClick: () => Navigator.push(context, DashboardScreen.route(selectedIndex: 3)),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Edit Profile",
        onClick: () => Navigator.push(context, EditProfileScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Notification Settings",
        onClick: () => Navigator.push(context, NotificationSetting.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "My Vehicle",
        onClick: () => Navigator.push(context, MyVehicleScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Privacy Policy",
        onClick: () => Navigator.push(context, PrivacyPolicyScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Languages",
        onClick: () => Navigator.push(context, LanguageSettingScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Help Center",
        onClick: () => Navigator.push(context, HelpCenterScreen.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Custom Service",
        onClick: () => Navigator.push(context, CustomerService.route()),
        icon: AppAssets.icBlueNavigator,
      ),
      ScreenListDataModel(
        title: "Call",
        onClick: () => Navigator.push(context, CallScreen.route()),
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
            text: "Cardex - Car Detail App",
            fontSize: 22.setFontSize,
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
              image: AssetImage(AppAssets.imgBgHomeScreenPlain),
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
