import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';

class CommonDialog extends StatelessWidget {
  final Widget icon;
  final bool showLoader;
  final Widget? titleText;
  final Widget? descriptionText;
  final Widget? button;
  const CommonDialog({
    super.key,
    required this.icon,
    required this.titleText,
    required this.descriptionText,
    this.showLoader = false,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(17), horizontal: AppSizes.setWidth(17)),
        width: AppSizes.setWidth(340),
        decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScaffold,
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  AppAssets.icCloseSquare,
                  width: AppSizes.setWidth(20),
                  height: AppSizes.setHeight(20),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.setHeight(20)),
              child: icon,
            ),
            titleText ?? const CommonText(text: ""),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
              child: descriptionText ?? const CommonText(text: ""),
            ),
            button ?? const SizedBox(),
            if (showLoader)
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(2)),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [CustomAppColor.of(context).btnPurple, CustomAppColor.of(context).btnPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: SpinKitCircle(
                    color: CustomAppColor.of(context).btnPurple,
                    size: 70.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
