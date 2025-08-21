import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../do_meditation/view/do_meditation_screen.dart';

class MeditationDetailsScreen extends StatefulWidget {
  const MeditationDetailsScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const MeditationDetailsScreen());
  }

  @override
  State<MeditationDetailsScreen> createState() => _MeditationDetailsScreenState();
}

class _MeditationDetailsScreenState extends State<MeditationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _sliverAppBar(),
              _sliverDetailsView(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CommonButton(
              text: Languages.of(context).txtStartMeditation,
              onTap: () {
                Navigator.push(context, DoMeditationScreen.route());
              },
              buttonColor: CustomAppColor.of(context).primary,
              borderColor: CustomAppColor.of(context).borderColor,
              borderWidth: 4,
              radius: 18,
              mLeft: 20.setWidth,
              mRight: 20.setWidth,
              mBottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              mTop: 20.setHeight,
            ),
          ),
        ],
      ),
    );
  }

  _sliverAppBar() {
    return SliverAppBar(
      expandedHeight: 270.setHeight,
      pinned: true,
      backgroundColor: CustomAppColor.of(context).primary,
      elevation: 0,
      leadingWidth: 42.setHeight,
      leading: Padding(
        padding: EdgeInsets.only(left: 20.setWidth),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: RotatedBox(
            quarterTurns: 2,
            child: Image.asset(
              AppAssets.icArrowRight,
              height: 20.setHeight,
              width: 20.setHeight,
              color: CustomAppColor.of(context).white,
            ),
          ),
        ),
      ),
      actions: [
        Image.asset(
          AppAssets.icShare,
          height: 20.setHeight,
          width: 20.setHeight,
          color: CustomAppColor.of(context).white,
        ),
        SizedBox(width: 15.setWidth),
        Padding(
          padding: EdgeInsets.only(right: 20.setWidth),
          child: Image.asset(
            AppAssets.icArchive,
            height: 20.setHeight,
            width: 20.setHeight,
            color: CustomAppColor.of(context).white,
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          AppAssets.imgMeditationDummy1,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _sliverDetailsView() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonText(
                    text: "Meditation",
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontFamilyBold700,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
                Image.asset(
                  AppAssets.icEye,
                  height: 18.setHeight,
                  width: 18.setWidth,
                ),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "21,560 ${Languages.of(context).txtViews}",
                  fontSize: 13.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "${Languages.of(context).txtLoremIpsum} ${Languages.of(context).txtLoremIpsum}",
              fontSize: 11.setFontSize,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamilyRegular400,
              textColor: CustomAppColor.of(context).txtDarkGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.icClock,
                  width: 16.setHeight,
                  height: 16.setHeight,
                ),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "8 ${Languages.of(context).txtMin}",
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.center,
                  height: 1,
                ),
                SizedBox(width: 18.setWidth),
                Image.asset(
                  AppAssets.icMeditation,
                  width: 16.setHeight,
                  height: 16.setHeight,
                ),
                SizedBox(width: 5.setWidth),
                Expanded(
                  child: CommonText(
                    text: "12 ${Languages.of(context).txtPoses}",
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: Constant.fontFamilyMedium500,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
