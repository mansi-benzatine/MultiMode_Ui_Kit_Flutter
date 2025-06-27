import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/text/common_text.dart';

class PhoneCallScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PhoneCallScreen());
  }

  const PhoneCallScreen({super.key});

  @override
  State<PhoneCallScreen> createState() => _PhoneCallScreenState();
}

class _PhoneCallScreenState extends State<PhoneCallScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgPinkScaffold,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              appBarColor: CustomAppColor.of(context).bgPinkScaffold,
            ),
            const Expanded(child: CallerDetailView()),
            const BottomActionView()
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

class CallerDetailView extends StatelessWidget {
  const CallerDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomAppColor.of(context).txtPink,
              width: 6,
            ),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppAssets.imgProfile1),
            maxRadius: 90,
          ),
        ),
        SizedBox(height: 10.setHeight),
        const CallDetailsView()
      ],
    );
  }
}

class CallDetailsView extends StatelessWidget {
  const CallDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonText(
          text: "Rose ward",
          fontWeight: FontWeight.w900,
          fontSize: 30.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvet,
        ),
        SizedBox(height: 5.setHeight),
        CommonText(
          text: "00:21:45",
          fontWeight: FontWeight.w400,
          fontSize: 13.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvet,
        ),
      ],
    );
  }
}

class BottomActionView extends StatelessWidget {
  const BottomActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.setHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 120.setHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.imgCallBg),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 30.setHeight),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRoundButton(AppAssets.icVolume, CustomAppColor.of(context).white.withValues(alpha: 0.2)),
                CommonText(
                  text: Languages.of(context).txtYourCallIsSecure,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).white.withValues(alpha: 0.6),
                ),
                _buildRoundButton(AppAssets.icMicrophone, CustomAppColor.of(context).white.withValues(alpha: 0.2)),
              ],
            ),
          ),
          Positioned(
            bottom: 75.setHeight,
            left: 0.setWidth,
            right: 0.setWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Container(
                    width: 76.setWidth,
                    height: 76.setHeight,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).bgVelvetRed),
                  ),
                ),
                Image.asset(
                  AppAssets.icPhone,
                  width: 55.setWidth,
                  height: 60.setHeight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRoundButton(String icon, Color? color) {
  return GestureDetector(
    child: Container(
      width: 56.setWidth,
      height: 56.setHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: Image.asset(
        icon,
        width: 30.setWidth,
        height: 30.setHeight,
      ),
    ),
  );
}
