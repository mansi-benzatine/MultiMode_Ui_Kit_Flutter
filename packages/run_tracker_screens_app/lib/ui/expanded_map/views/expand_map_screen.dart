import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/constant.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/top_bar/topbar.dart';

class ExpandMapScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => ExpandMapScreen());
  }

  const ExpandMapScreen({super.key});

  @override
  State<ExpandMapScreen> createState() => _ExpandMapScreenState();
}

class _ExpandMapScreenState extends State<ExpandMapScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              isShowSimpleTitle: true,
              simpleTitle: Languages.of(context).txtAppName.toUpperCase(),
            ),
            Expanded(
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.asset(AppAssets.imgMap1, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).bgScaffold,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Image.asset(
                        AppAssets.icGps,
                        height: 30.setHeight,
                        width: 30.setWidth,
                        color: CustomAppColor.of(context).primary,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomAppColor.of(context).bgScaffold,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Image.asset(
                              AppAssets.icSatellite,
                              height: 34.setHeight,
                              color: CustomAppColor.of(context).primary,
                              width: 34.setWidth,
                            ),
                          ),
                          SizedBox(height: 10.setHeight),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomAppColor.of(context).bgScaffold,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Image.asset(
                              AppAssets.icLocation,
                              height: 34.setHeight,
                              width: 34.setWidth,
                              color: CustomAppColor.of(context).primary,
                            ),
                          ),
                        ],
                      ),
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
