import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../dashboard/view/dashboard_screen.dart';

class ConfirmNewAccountScreen extends StatefulWidget {
  const ConfirmNewAccountScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ConfirmNewAccountScreen());
  }

  @override
  State<ConfirmNewAccountScreen> createState() => _ConfirmNewAccountScreenState();
}

class _ConfirmNewAccountScreenState extends State<ConfirmNewAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        body: Column(
          children: [
            const _TopBarWithImageView(),
            Expanded(child: _ProfileDetailView()),
            _ContinueButtonView(
              buttonText: Languages.of(context).txtConfirmNow,
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
      child: Column(
        children: [
          CommonText(
            text: "Zack Stevens",
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
          ),
          CommonText(
            text: "UI/UX Designer",
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          SizedBox(height: 77.setHeight),
          CommonText(
            text: Languages.of(context).txtConfirmNewAccount,
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
          ),
          CommonText(
            text: Languages.of(context).txtConfirmNewAccountDesc,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ],
      ),
    );
  }
}

class _TopBarWithImageView extends StatefulWidget {
  const _TopBarWithImageView();

  @override
  State<_TopBarWithImageView> createState() => _TopBarWithImageViewState();
}

class _TopBarWithImageViewState extends State<_TopBarWithImageView> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgSecondary,
      child: Column(
        children: [
          TopBar(
            this,
            isShowTitle: true,
            title: Languages.of(context).txtWelcome,
            iconColor: CustomAppColor.of(context).bgBackIcon,
            textColor: CustomAppColor.of(context).txtWhite,
          ),
          SizedBox(height: 30.setHeight),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100.setHeight,
                width: 0.screenWidth,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreenWhite,
                  border: Border(
                    bottom: BorderSide(
                      color: CustomAppColor.of(context).bgScreenWhite,
                      width: 0,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200.setHeight,
                width: 200.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreenWhite,
                  borderRadius: BorderRadius.circular(500),
                ),
                padding: EdgeInsets.all(10.setHeight),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        AppAssets.imgDummyProfile,
                        fit: BoxFit.fill,
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class _ContinueButtonView extends StatelessWidget {
  final String buttonText;
  final Color? backgroundColor;
  final Function()? onTap;
  const _ContinueButtonView({required this.buttonText, this.onTap, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? CustomAppColor.of(context).bgScreenWhite,
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
            text: buttonText,
            buttonTextSize: 18.setFontSize,
            buttonTextWeight: FontWeight.w500,
            buttonColor: CustomAppColor.of(context).txtSecondary,
            onTap: onTap ?? () => _showConfirmationBottomSheet(context)),
      ),
    );
  }

  void _showConfirmationBottomSheet(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.setHeight),
              child: Image.asset(
                AppAssets.icCreateAccountSuccess,
                height: 120.setHeight,
                width: 120.setWidth,
              ),
            ),
            CommonText(
              text: Languages.of(context).txtYourAccountSetNow,
              fontSize: 24.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtSecondary,
            ),
            CommonText(
              text: Languages.of(context).txtYourAccountSetNowDesc,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
            SizedBox(height: 48.setHeight),
            _ContinueButtonView(
                backgroundColor: CustomAppColor.of(context).bgWhiteSecondary,
                buttonText: Languages.of(context).txtBackToHome,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, DashboardScreen.route());
                }),
          ],
        );
      },
    );
  }
}
