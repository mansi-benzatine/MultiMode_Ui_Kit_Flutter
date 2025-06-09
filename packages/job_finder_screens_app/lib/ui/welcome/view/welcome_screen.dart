import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../localization/language/languages.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../on_boarding/view/on_boarding_screen.dart';

class JobFinderWelcomeScreen extends StatefulWidget {
  final bool isPreview;

  const JobFinderWelcomeScreen({super.key, this.isPreview = false});

  static Route<void> route({bool isPreview = false}) {
    return MaterialPageRoute<void>(
      builder: (_) => JobFinderWelcomeScreen(isPreview: isPreview),
    );
  }

  @override
  State<JobFinderWelcomeScreen> createState() => _JobFinderWelcomeScreenState();
}

class _JobFinderWelcomeScreenState extends State<JobFinderWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Container(
        width: 0.screenWidth,
        height: 0.screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBgWelcome),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            const _DetailsView(),
            _BottomNextButtonView(isPreview: widget.isPreview),
          ],
        ),
      ),
    );
  }
}

class _DetailsView extends StatelessWidget {
  const _DetailsView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      ),
      width: 0.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.setHeight),
          CommonText(
            text: Languages.of(context).txtFindYour,
            fontWeight: FontWeight.w800,
            fontSize: 40.setFontSize,
            textColor: CustomAppColor.of(context).txtBlue,
            textAlign: TextAlign.start,
            height: 1,
          ),
          CommonText(
            text: Languages.of(context).txtDreamJob,
            fontWeight: FontWeight.w800,
            fontSize: 40.setFontSize,
            textColor: CustomAppColor.of(context).icPrimary,
            textDecoration: TextDecoration.underline,
            textAlign: TextAlign.start,
            height: 1,
          ),
          CommonText(
            text: "${Languages.of(context).txtHere}!",
            fontWeight: FontWeight.w800,
            fontSize: 40.setFontSize,
            textColor: CustomAppColor.of(context).txtBlue,
            textAlign: TextAlign.start,
            height: 1,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtWelcomeDesc,
            fontWeight: FontWeight.w500,
            fontSize: 15.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 40.setHeight),
        ],
      ),
    );
  }
}

class _BottomNextButtonView extends StatelessWidget {
  final bool isPreview;

  const _BottomNextButtonView({this.isPreview = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
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
          text: Languages.of(context).txtNext,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          image: AppAssets.icNextRound,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            if (!isPreview) {
              Navigator.push(context, OnBoardingScreen.route());
            }
          },
        ),
      ),
    );
  }
}
