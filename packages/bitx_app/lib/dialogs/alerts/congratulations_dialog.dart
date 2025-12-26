import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class CongratulationsDialog extends StatefulWidget {
  final String title;
  final String message;
  final String icon;
  final VoidCallback? onComplete;

  const CongratulationsDialog({
    super.key,
    this.title = "Congratulations",
    this.message = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
    this.icon = AppAssets.icCheck,
    this.onComplete,
  });

  @override
  State<CongratulationsDialog> createState() => _CongratulationsDialogState();
}

class _CongratulationsDialogState extends State<CongratulationsDialog> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.setWidth,
        margin: EdgeInsets.only(top: 50.setHeight),
        padding: EdgeInsets.fromLTRB(25.setWidth, 25.setHeight, 25.setWidth, 25.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).dialogBg,
          borderRadius: BorderRadius.circular(30.setWidth),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacityPercent(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.imgCongratulation,
              width: 100.setWidth,
              height: 100.setHeight,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: widget.title,
              fontSize: 24.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: widget.message,
              fontSize: 13.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.center,
              height: 1.2,
              maxLines: 3,
            ),
            SizedBox(height: 30.setHeight),
            CommonButton(
              text: "Done",
              mLeft: 40.setWidth,
              mRight: 40.setWidth,
              onTap: () {
                Navigator.of(context).pop();
                if (widget.onComplete != null) {
                  widget.onComplete!();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
