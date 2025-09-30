import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
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
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // Main dialog container
            Container(
              width: 320.setWidth,
              margin: EdgeInsets.only(top: 50.setHeight),
              padding: EdgeInsets.fromLTRB(20.setWidth, 60.setHeight, 20.setWidth, 20.setWidth),
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
                  CommonText(
                    text: widget.title,
                    fontSize: 20.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: "Spot",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: "\$10,000",
                    fontSize: 35.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: "Sell Order Received!",
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLoremIpsumShort,
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
                    text: Languages.of(context).txtViewMyPortfolio,
                    onTap: () {
                      Navigator.of(context).pop();
                      if (widget.onComplete != null) {
                        widget.onComplete!();
                      }
                    },
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonButton(
                    text: Languages.of(context).txtBackToNFLXStock,
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
                ],
              ),
            ),

            Positioned(
              top: 0,
              child: SizedBox(
                width: 200.setWidth,
                height: 160.setHeight,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 70.setWidth,
                        height: 100.setHeight,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          widget.icon,
                          width: 70.setWidth,
                          height: 100.setHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
