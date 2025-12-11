import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class AddYourFingerView extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddYourFingerView());
  }

  const AddYourFingerView({super.key});

  @override
  State<AddYourFingerView> createState() => _AddYourFingerViewState();
}

class _AddYourFingerViewState extends State<AddYourFingerView> {
  double progress = 0.0; // 0 to 1.0

  void _onFingerprintTap() {
    setState(() {
      // increase by 10% each tap
      progress += 0.1;
      if (progress > 1.0) progress = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = CustomAppColor.of(context).primary;
    final gray = CustomAppColor.of(context).txtGray;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtAddYourFingerprintDesc,
            textColor: gray,
            fontSize: 14.setFontSize,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 120.setHeight),
          GestureDetector(
            onTap: _onFingerprintTap,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 200.setHeight,
                  width: 200.setWidth,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: progress),
                    duration: const Duration(milliseconds: 400),
                    builder: (context, value, _) {
                      return CircularProgressIndicator(
                        value: value,
                        strokeWidth: 4,
                        color: primary,
                        backgroundColor: Colors.grey.withValues(alpha: 0.2),
                      );
                    },
                  ),
                ),
                AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: progress < 1.0 ? 0.9 : 1.2,
                  child: Image.asset(
                    AppAssets.icFingerprint,
                    height: 125.setHeight,
                    width: 125.setWidth,
                    color: primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.setHeight),
          CommonText(
            text: '${(progress * 100).toInt()}%',
            fontSize: 22.setFontSize,
            textColor: primary,
          ),
          CommonText(
            text: progress < 1.0 ? 'Scanning...' : 'Completed',
            fontSize: 14.setFontSize,
            textColor: progress < 1.0 ? gray : CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 80.setHeight),
          CommonText(
            text: Languages.of(context).txtPleasePressYourFingerToYourPhone,
            textColor: gray,
            fontSize: 14.setFontSize,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
