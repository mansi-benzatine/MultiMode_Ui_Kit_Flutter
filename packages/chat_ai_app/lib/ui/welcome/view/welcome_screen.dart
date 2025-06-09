import 'package:flutter/material.dart';

import '../../../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../sign_in/view/sign_in_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const WelcomeScreen());
  }

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AppAssets.refreshAssets(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgWelcome,
            width: 0.screenWidth,
            height: 0.screenHeight,
            fit: BoxFit.fill,
            gaplessPlayback: true,
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 50.setHeight),
                Container(
                  width: 0.screenWidth,
                  margin: EdgeInsets.symmetric(horizontal: 25.setWidth),
                  child: CommonText(
                    text: Languages.of(context).txtWelcomeToChatAI,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                    height: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.setHeight),
                Container(
                  margin: EdgeInsets.only(
                    left: 30.setWidth,
                    right: 30.setWidth,
                  ),
                  width: 0.screenWidth,
                  child: CommonText(
                    text: Languages.of(context).txtLoremIpsumDesc,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlackAndGray,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                CommonButton(
                  text: Languages.of(context).txtGetStarted,
                  mLeft: 20.setWidth,
                  mRight: 20.setWidth,
                  onTap: () {
                    Navigator.push(context, SignInScreen.route());
                  },
                ),
                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
