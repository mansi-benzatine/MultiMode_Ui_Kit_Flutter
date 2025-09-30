import 'package:flutter/material.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/utils/app_assets.dart';
import 'package:stoxy_app_package/utils/utils.dart';

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
              padding: EdgeInsets.fromLTRB(30.setWidth, 100.setHeight, 30.setWidth, 30.setWidth),
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
                  // Title
                  CommonText(
                    text: widget.title,
                    fontSize: 24.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20.setHeight),

                  // Message
                  CommonText(
                    text: widget.message,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                    height: 1.2,
                    maxLines: 3,
                  ),

                  SizedBox(height: 30.setHeight),

                  // Done button
                  CommonButton(
                    text: Languages.of(context).txtDoneExclamation,
                    mLeft: 50.setWidth,
                    mRight: 50.setWidth,
                    gradient: CustomAppColor.of(context).primaryGradient,
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

            // Purple circular icon with subtle wave rings
            Positioned(
              top: 0,
              child: SizedBox(
                width: 200.setWidth,
                height: 160.setHeight,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Subtle wave rings positioned behind the icon
                    Positioned(
                      top: 50.setHeight,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: 0.5,
                            child: Container(
                              width: 160.setWidth,
                              height: 160.setHeight,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).primary.withValues(alpha: 0.1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 50.setHeight,
                    //   child: RotatedBox(
                    //     quarterTurns: 2,
                    //     child: ClipRect(
                    //       child: Align(
                    //         alignment: Alignment.topCenter,
                    //         heightFactor: 0.5,
                    //         child: Container(
                    //           width: 140.setWidth,
                    //           height: 160.setHeight,
                    //           decoration: BoxDecoration(
                    //             shape: BoxShape.circle,
                    //             color: CustomAppColor.of(context).primary.withValues(alpha: 0.07),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      top: 50.setHeight,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.topCenter,
                            heightFactor: 0.5,
                            child: Container(
                              width: 130.setWidth,
                              height: 130.setHeight,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Main purple circular icon
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 100.setWidth,
                        height: 100.setHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: CustomAppColor.of(context).primaryGradient,
                          boxShadow: [
                            BoxShadow(
                              color: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(25.setWidth),
                        child: Image.asset(
                          AppAssets.icProfile,
                          width: 50.setWidth,
                          height: 50.setHeight,
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
