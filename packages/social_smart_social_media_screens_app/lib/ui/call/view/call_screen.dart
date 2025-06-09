import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/text/common_text.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CallScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IgnorePointer(ignoring: true, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back))),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
          child: Column(
            children: [
              callingAvatar(context),
              CommonText(
                text: AppStrings.tonyArmstrong,
                fontSize: AppSizes.setFontSize(26),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: AppSizes.setHeight(14)),
              CommonText(
                text: AppStrings.minutes,
                fontSize: AppSizes.setFontSize(14),
                textColor: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: AppSizes.setHeight(20)),
              callAction()
            ],
          ),
        ),
      ),
    );
  }

  Widget callingAvatar(BuildContext context) {
    return SizedBox(
      height: AppSizes.setHeight(480),
      width: AppSizes.setWidth(480),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.imgCallBg,
              fit: BoxFit.contain,
              color: CustomAppColor.of(context).imageBg,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColor.btnGradiant1, AppColor.btnGradiant2],
                ),
                border: Border.all(
                  width: 12,
                  color: Colors.transparent,
                ),
              ),
              child: Image.asset(
                AppAssets.imgProfile5,
                width: AppSizes.setWidth(180),
                height: AppSizes.setWidth(180),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget callAction() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(
            gradientColors: [AppColor.btnOrange.withOpacityPercent(0.8), AppColor.btnOrange],
            icon: AppAssets.icCloseCall,
          ),
          _buildActionButton(
            gradientColors: [AppColor.btnOlive.withOpacityPercent(0.8), AppColor.btnOlive],
            icon: AppAssets.icCameraClose,
          ),
          _buildActionButton(
            gradientColors: [AppColor.btnRed.withOpacityPercent(0.8), AppColor.btnRed],
            icon: AppAssets.icVolume,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({required List<Color> gradientColors, required String icon}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 18,
          color: AppColor.transparent,
        ),
        borderRadius: BorderRadius.circular(140),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: Image.asset(
        icon,
        width: AppSizes.setWidth(30),
        height: AppSizes.setHeight(30),
      ),
    );
  }
}
