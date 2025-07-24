import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/top_bar/topbar.dart';

class ShareRunHistoryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => ShareRunHistoryScreen());
  }

  const ShareRunHistoryScreen({super.key});

  @override
  State<ShareRunHistoryScreen> createState() => _ShareRunHistoryScreenState();
}

class _ShareRunHistoryScreenState extends State<ShareRunHistoryScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              isShowSimpleTitle: true,
              simpleTitle: Languages.of(context).txtShare,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20.setHeight),

                      ImageAndDetailsView(),
                      SizedBox(height: 25.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.setWidth,
                          vertical: 20.setHeight,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).primary,
                        ),
                        child: Icon(
                          Icons.share,
                          color: CustomAppColor.of(context).white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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

class ImageAndDetailsView extends StatelessWidget {
  const ImageAndDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Image.asset(
                  AppAssets.imgShareMapView,
                  width: double.infinity,
                  height: 450.setHeight,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                top: 0.setHeight,
                left: 5.setWidth,
                child: Image.asset(
                  AppAssets.imgShoe,
                  height: 100.setHeight,
                  width: 100.setWidth,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFD86C9),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 20.setHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(
                  context: context,
                  value: "00:10:50",
                  label: Languages.of(context).txtTimeMin,
                ),
                _buildStatColumn(
                  context: context,
                  value: "00.90",
                  label: Languages.of(context).txtPaceMinKm,
                ),
                _buildStatColumn(
                  context: context,
                  value: "5.0",
                  label: Languages.of(context).txtKcal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn({
    required BuildContext context,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        CommonText(
          text: value,
          textColor: Colors.white,
          fontSize: 20.setFontSize,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 4.setHeight),
        CommonText(
          text: label,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).white,
        ),
      ],
    );
  }
}
