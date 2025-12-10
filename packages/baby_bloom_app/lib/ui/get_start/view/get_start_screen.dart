import 'package:baby_bloom_app/ui/login/view/login_screen.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/swipe_button.dart';

class GetStartScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GetStartScreen());
  }

  const GetStartScreen({super.key});

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgGetStart,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 260.setHeight,
              left: 30.setWidth,
              child: const SwipeToNavigateButton(
                destinationPage: LoginScreen(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
