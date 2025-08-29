import 'dart:async';

import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';

class CountdownScreen extends StatefulWidget {
  final int currentIndex;

  const CountdownScreen({super.key, this.currentIndex = 0});

  static Route<void> route({int currentIndex = 0}) {
    return MaterialPageRoute(builder: (_) => CountdownScreen(currentIndex: currentIndex));
  }

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  final List<String> countdownImages = [AppAssets.imgCount3, AppAssets.imgCount2, AppAssets.imgCount1, AppAssets.imgCountGO];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _initAnimation();

    if (widget.currentIndex >= 0) {
      _playAnimation();
    } else {
      // run full countdown
      _startCountdown();
    }
  }

  void _initAnimation() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  }

  void _startCountdown() {
    _playAnimation();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentIndex < countdownImages.length - 1) {
        setState(() {
          _currentIndex++;
        });
        _playAnimation();
      } else {
        timer.cancel();
      }
    });
  }

  void _playAnimation() {
    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Image.asset(AppAssets.imgCounterBg, fit: BoxFit.cover),

          // Countdown image animation
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(countdownImages[_currentIndex], width: 200, height: 200, fit: BoxFit.contain),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
