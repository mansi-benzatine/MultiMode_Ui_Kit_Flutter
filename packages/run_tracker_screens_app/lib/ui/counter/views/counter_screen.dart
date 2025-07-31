import 'dart:async';

import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/ui/start_running_details/views/start_running_details_screen.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => CountdownScreen());
  }

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  final List<String> countdownImages = [
    AppAssets.icCount3,
    AppAssets.icCount2,
    AppAssets.icCount1,
    AppAssets.icCountGo,
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    _startCountdown();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
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
        _timer?.cancel();

        // Navigator.push(context, StartRunningDetailsScreen.route());
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
          Image.asset(AppAssets.imgBgCountDown, fit: BoxFit.cover),
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Image.asset(
                      countdownImages[_currentIndex],
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
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
