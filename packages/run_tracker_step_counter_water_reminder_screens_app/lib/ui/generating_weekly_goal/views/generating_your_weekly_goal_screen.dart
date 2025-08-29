import 'dart:async';

import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';

class GeneratingYourWeeklyGoalScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GeneratingYourWeeklyGoalScreen());
  }

  const GeneratingYourWeeklyGoalScreen({super.key});

  @override
  State<GeneratingYourWeeklyGoalScreen> createState() => _GeneratingYourWeeklyGoalScreenState();
}

class _GeneratingYourWeeklyGoalScreenState extends State<GeneratingYourWeeklyGoalScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _navigateToWeeklyGoalScreen();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))..repeat();

    _animation1 = Tween(begin: 0.0, end: -10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _animation2 = Tween(begin: 0.0, end: -10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeInOut),
      ),
    );
    _animation3 = Tween(begin: 0.0, end: -10.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  void _navigateToWeeklyGoalScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    /* Navigator.push(context, WeeklyGoalScreen.route());*/
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: Container(
            width: 14.setWidth,
            height: 14.setHeight,
            margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
            decoration: BoxDecoration(color: CustomAppColor.of(context).primary, shape: BoxShape.circle),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated dots
            Row(mainAxisSize: MainAxisSize.min, children: [_buildDot(_animation1), _buildDot(_animation2), _buildDot(_animation3)]),
            SizedBox(height: 24.setHeight),
            CommonText(text: "Generating Your Weekly Goal", fontSize: 18.setFontSize, fontWeight: FontWeight.w500, textColor: CustomAppColor.of(context).txtGrey),
          ],
        ),
      ),
    );
  }
}
