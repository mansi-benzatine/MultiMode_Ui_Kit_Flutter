import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class OrderExchangeDialog extends StatefulWidget {
  final String title1;
  final String title2;
  final String message;
  final String icon1;
  final String icon2;
  final VoidCallback? onComplete;

  const OrderExchangeDialog({
    super.key,
    this.title1 = "Congratulations",
    this.message = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
    this.onComplete,
    this.icon1 = "",
    this.icon2 = "",
    this.title2 = "",
  });

  @override
  State<OrderExchangeDialog> createState() => _OrderExchangeDialogState();
}

class _OrderExchangeDialogState extends State<OrderExchangeDialog> with SingleTickerProviderStateMixin {
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
      insetPadding: EdgeInsets.symmetric(horizontal: 35.setWidth),
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        widget.icon1,
                        width: 55.setWidth,
                        height: 55.setHeight,
                      ),
                      SizedBox(height: 15.setHeight),
                      CommonText(
                        text: widget.title1,
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                    child: Icon(
                      Icons.swap_horiz_rounded,
                      size: 35.setWidth,
                      color: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        widget.icon2,
                        width: 55.setWidth,
                        height: 55.setHeight,
                      ),
                      SizedBox(height: 15.setHeight),
                      CommonText(
                        text: widget.title2,
                        fontSize: 18.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25.setHeight),
              CommonText(
                text: "Successful!",
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: "\$1000 bitcoin has been exchange into \$1000 tether.",
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                height: 1.2,
                maxLines: 3,
              ),
              SizedBox(height: 15.setHeight),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "Go To Exchange",
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
                  gradient: CustomAppColor.of(context).linearGradiant,
                  borderColor: CustomAppColor.of(context).borderTextFormFeild,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
