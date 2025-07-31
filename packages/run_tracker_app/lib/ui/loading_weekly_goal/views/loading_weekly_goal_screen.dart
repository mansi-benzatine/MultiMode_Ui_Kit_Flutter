import 'dart:async';

import 'package:flutter/material.dart';
import 'package:run_tracker_app/localization/language/languages.dart';
import 'package:run_tracker_app/ui/dashboard/views/dashboard_screen.dart';
import 'package:run_tracker_app/utils/app_assets.dart';
import 'package:run_tracker_app/utils/app_color.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';
import 'package:run_tracker_app/widgets/text/common_text.dart';

class GoalLoadingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GoalLoadingScreen());
  }

  const GoalLoadingScreen({super.key});

  @override
  State<GoalLoadingScreen> createState() => _GoalLoadingScreenState();
}

class _GoalLoadingScreenState extends State<GoalLoadingScreen> {
  double progress = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startProgressAnimation();
  }

  void startProgressAnimation() {
    const duration = Duration(milliseconds: 50);
    timer = Timer.periodic(duration, (timer) {
      setState(() {
        progress += 0.02;
        if (progress >= 1.0) {
          progress = 1.0;
          timer.cancel();
          Navigator.push(context, DashboardScreen.route(currentIndex: 0));
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.imgLoading),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 8,
                          backgroundColor: CustomAppColor.of(
                            context,
                          ).white.withValues(alpha: 0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            CustomAppColor.of(context).lime,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: "${(progress * 100).toInt()}%",
                        textColor: CustomAppColor.of(context).white,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),

                // Label
                SizedBox(height: 20.setHeight),
                CommonText(
                  text: Languages.of(
                    context,
                  ).txtGeneratingYourDailyGoal.toUpperCase(),
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).white,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 40.setHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
