import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class CongratulationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CongratulationScreen());
  }

  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgProfileSetupSuccessfully,
            width: double.infinity,
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Positioned(
            top: 80.setHeight,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CommonText(
                  text: Languages.of(context).txtCongratulations,
                  fontFamily: Constant.fontFamilyBold700,
                  fontSize: 30.setFontSize,
                  textColor: CustomAppColor.of(context).txtSecondary,
                ),
                SizedBox(height: 15.setHeight),
                CommonText(
                  text: Languages.of(context).txtYourPregnancy,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtLightGrey,
                ),
                CommonText(
                  text: "4 week and 2 days",
                  fontFamily: Constant.fontFamilyMedium500,
                  fontSize: 18.setFontSize,
                  textColor: CustomAppColor.of(context).black,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20.setWidth,
            right: 20.setWidth,
            child: _detailsCardView(),
          ),
        ],
      ),
    );
  }

  Widget _detailsCardView() {
    Widget infoRow({required String asset, required String normalText, required String boldText, double padding = 8}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(padding),
            child: Image.asset(
              asset,
              height: 36.setHeight,
              width: asset == AppAssets.imgSetYourDueDate ? 32.setWidth : 22.setWidth,
            ),
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: normalText,
                    style: TextStyle(
                      color: CustomAppColor.of(context).black,
                      fontFamily: Constant.fontFamilyRegular400,
                      package: "baby_bloom_screens_app",
                      fontSize: 15.setFontSize,
                    ),
                  ),
                  TextSpan(
                    text: boldText,
                    style: TextStyle(
                      color: CustomAppColor.of(context).black,
                      fontFamily: Constant.fontFamilyBold700,
                      fontSize: 15.setFontSize,
                      package: "baby_bloom_screens_app",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: CustomAppColor.of(context).white),
            color: CustomAppColor.of(context).white.withValues(alpha: 0.5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
          child: Column(
            children: [
              infoRow(
                asset: AppAssets.icLovingMother,
                normalText: "We estimate your due date to be ",
                boldText: "15/04/2026.",
              ),
              SizedBox(height: 10.setHeight),
              infoRow(
                asset: AppAssets.icPregnantWomen,
                normalText: "This means you have ",
                boldText: "8 weeks and 2 days",
              ),
              SizedBox(height: 10.setHeight),
              infoRow(
                asset: AppAssets.imgSetYourDueDate,
                normalText: "This means you have ",
                boldText: "32 weeks and 4 days to go.",
                padding: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
        IgnorePointer(
          ignoring: true,
          child: CommonButton(
            text: "4 week and 2 days",
            onTap: () => Navigator.push(context, DashboardScreen.route()),
          ),
        ),
      ],
    );
  }
}
