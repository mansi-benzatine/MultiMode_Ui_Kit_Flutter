import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';

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
      insetPadding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 320.setWidth,
              margin: EdgeInsets.only(top: 50.setHeight),
              padding: EdgeInsets.fromLTRB(20.setWidth, 80.setHeight, 20.setWidth, 20.setWidth),
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
                  SizedBox(height: 25.setHeight),
                  CommonText(
                    text: "\$10,000",
                    fontSize: 32.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 14.setHeight),
                  CommonText(
                    text: "Order Exchange Received!",
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. industry's standard",
                    fontSize: 13.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGray,
                    textAlign: TextAlign.center,
                    height: 1.2,
                    maxLines: 3,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonButton(
                    gradient: CustomAppColor.of(context).primaryGradient,
                    text: "View My Portfolio",
                    onTap: () {
                      Navigator.of(context).pop();
                      if (widget.onComplete != null) {
                        widget.onComplete!();
                      }
                    },
                  ),
                  SizedBox(height: 10.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: "Back To NFLX Stock",
                      onTap: () {
                        Navigator.of(context).pop();
                        if (widget.onComplete != null) {
                          widget.onComplete!();
                        }
                      },
                      buttonColor: CustomAppColor.of(context).bgScreen,
                      buttonTextColor: CustomAppColor.of(context).txtDarkGray,
                      borderColor: CustomAppColor.of(context).borderTextFormFeild,
                      gradient: null,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Row(
                children: [
                  SizedBox(
                    width: 140.setWidth,
                    height: 160.setHeight,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          child: Column(
                            children: [
                              Container(
                                width: 70.setWidth,
                                height: 100.setHeight,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  widget.icon1,
                                  width: 70.setWidth,
                                  height: 100.setHeight,
                                ),
                              ),
                              CommonText(
                                text: widget.title1,
                                fontSize: 18.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 28.setWidth,
                  ),
                  SizedBox(
                    width: 140.setWidth,
                    height: 160.setHeight,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          child: Column(
                            children: [
                              Container(
                                width: 70.setWidth,
                                height: 100.setHeight,
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).white,
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  widget.icon2,
                                  width: 70.setWidth,
                                  height: 100.setHeight,
                                ),
                              ),
                              CommonText(
                                text: widget.title2,
                                fontSize: 18.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: CustomAppColor.of(context).txtBlack,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
