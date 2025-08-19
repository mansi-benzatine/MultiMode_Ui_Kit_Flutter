import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking_driver_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';

class CallScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CallScreen());
  }

  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light, statusBarColor: CustomAppColor.of(context).bgScreen),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).btnPrimary,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: CustomAppColor.of(context).bgScreen,
        ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 0.screenHeight / 1.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                  ),
                  color: CustomAppColor.of(context).bgScreen,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DottedBorder(
                      options: const CircularDottedBorderOptions(
                        dashPattern: [4, 4],
                        strokeWidth: 2,
                        color: Colors.green,
                        padding: EdgeInsets.all(10),
                      ),
                      child: DottedBorder(
                        options: const CircularDottedBorderOptions(
                          dashPattern: [4, 4],
                          strokeWidth: 2,
                          color: Colors.green,
                          padding: EdgeInsets.all(10),
                        ),
                        child: DottedBorder(
                          options: const CircularDottedBorderOptions(
                            dashPattern: [4, 4],
                            strokeWidth: 2,
                            color: Colors.green,
                            padding: EdgeInsets.all(10),
                          ),
                          child: CircleAvatar(
                            radius: 90,
                            backgroundImage: AssetImage(AppAssets.imgDummyProfile),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: "   Calling...",
                      textColor: CustomAppColor.of(context).txtGray,
                      fontSize: 20.setFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                    CommonText(
                      text: "Brayden Jockos",
                      textColor: Colors.green,
                      fontWeight: FontWeight.w700,
                      fontSize: 25.setFontSize,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.setWidth, right: 22.setWidth, top: 20.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).txtWhite.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.mic,
                        color: CustomAppColor.of(context).white,
                        size: 28,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).txtWhite.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.volume_up,
                        color: CustomAppColor.of(context).white,
                        size: 28,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).txtWhite.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.videocam_rounded,
                        color: CustomAppColor.of(context).white,
                        size: 28,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).txtWhite.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.pause,
                        color: CustomAppColor.of(context).white,
                        size: 28,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.close_rounded,
                        color: CustomAppColor.of(context).white,
                        size: 28,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
