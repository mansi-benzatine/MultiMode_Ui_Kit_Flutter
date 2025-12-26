import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class OrderReceivedDialog extends StatefulWidget {
  final String title;
  final String message;
  final String icon;
  final VoidCallback? onComplete;

  const OrderReceivedDialog({
    super.key,
    this.title = "Congratulations",
    this.message = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
    this.icon = AppAssets.icCheck,
    this.onComplete,
  });

  @override
  State<OrderReceivedDialog> createState() => _OrderReceivedDialogState();
}

class _OrderReceivedDialogState extends State<OrderReceivedDialog> with SingleTickerProviderStateMixin {
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
      insetPadding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 320.setWidth,
          margin: EdgeInsets.only(top: 20.setHeight),
          padding: EdgeInsets.fromLTRB(20.setWidth, 20.setHeight, 20.setWidth, 20.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).dialogBg,
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
              Image.asset(
                widget.icon,
                width: 70.setWidth,
                height: 70.setHeight,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: widget.title,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: "Bitcoin",
                fontSize: 14.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.setHeight),
              CommonText(
                text: "Successful!",
                fontSize: 25.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. industry's standard",
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtGray,
                textAlign: TextAlign.center,
                height: 1.2,
                maxLines: 3,
              ),
              SizedBox(height: 15.setHeight),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "Go To Wallet",
                  onTap: () {
                    Navigator.of(context).pop();
                    if (widget.onComplete != null) {
                      widget.onComplete!();
                    }
                  },
                ),
              ),
              SizedBox(height: 10.setHeight),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "Close",
                  onTap: () {
                    Navigator.of(context).pop();
                    if (widget.onComplete != null) {
                      widget.onComplete!();
                    }
                  },
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  borderColor: CustomAppColor.of(context).borderTextFormFeild,
                  gradient: CustomAppColor.of(context).linearGradiant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
