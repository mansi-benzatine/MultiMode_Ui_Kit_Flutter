import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgSplash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
