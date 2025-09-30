import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/top_bar/topbar.dart';

class LiveTrackingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LiveTrackingScreen());
  }

  const LiveTrackingScreen({super.key});

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppAssets.imgLiveTracking,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 15.setHeight,
            right: 0,
            left: 0,
            child: TopBar(
              this,
              isShowBack: true,
              appBarColor: Colors.transparent,
              isShowTrackingGps: true,
              iconColor: CustomAppColor.of(context).black,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 40.setHeight,
            child: detailCardView(),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  Widget detailCardView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 35.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 24.setHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: CustomAppColor.of(context).btnPrimary,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: CustomAppColor.of(context).white,
                    ),
                    SizedBox(width: 10.setWidth),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "10:00 AM",
                          fontFamily: Constant.fontFamilySemiBold600,
                          fontSize: 18.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        ),
                        CommonText(
                          text: "Delivery Time",
                          height: 0,
                          fontSize: 14.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.icLocation,
                      width: 20.setWidth,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).white,
                    ),
                    SizedBox(width: 10.setWidth),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Washington",
                          fontFamily: Constant.fontFamilySemiBold600,
                          fontSize: 18.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        ),
                        CommonText(
                          text: "Delivery Place",
                          height: 0,
                          fontSize: 14.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Divider(
              height: 35.setHeight,
              thickness: 0.2,
              color: CustomAppColor.of(context).white,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Image.asset(AppAssets.imgDummyProfile),
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Rohan Nick",
                        fontFamily: Constant.fontFamilySemiBold600,
                        fontSize: 18.setFontSize,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      CommonText(
                        text: "Delivery Boy",
                        height: 0,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).white,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomAppColor.of(context).white.withValues(alpha: 0.2),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.phone_outlined,
                    color: CustomAppColor.of(context).white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
