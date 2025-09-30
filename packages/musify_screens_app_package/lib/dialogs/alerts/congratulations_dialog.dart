import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/localization/language/languages.dart';
import 'package:musify_screens_app_package/utils/app_assets.dart';
import 'package:musify_screens_app_package/utils/utils.dart';

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
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
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
      insetPadding: EdgeInsets.symmetric(horizontal: 50.setWidth),
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 25.setHeight, horizontal: 10.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgDialog,
            borderRadius: BorderRadius.circular(20.setWidth),
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
              Container(
                width: 80.setWidth,
                height: 80.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).primary,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(15.setWidth),
                child: Image.asset(widget.icon, width: 40.setWidth, height: 40.setHeight),
              ),

              SizedBox(height: 15.setHeight),

              // Title
              CommonText(
                text: widget.title,
                fontSize: 24.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10.setHeight),

              // Message
              CommonText(
                text: widget.message,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtGray,
                textAlign: TextAlign.center,
                height: 1.2,
                maxLines: 3,
              ),

              SizedBox(height: 20.setHeight),

              // Done button
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(context).txtDoneExclamation,
                  mLeft: 50.setWidth,
                  mRight: 50.setWidth,
                  onTap: () {
                    Navigator.of(context).pop();
                    if (widget.onComplete != null) {
                      widget.onComplete!();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
