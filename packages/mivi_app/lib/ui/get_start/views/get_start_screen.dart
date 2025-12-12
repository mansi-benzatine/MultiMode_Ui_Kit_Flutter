import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mivi_app/ui/sign_in/view/sign_in_screen.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GetStartScreen());
  }

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> with TickerProviderStateMixin {
  late final List<List<String>> _allImageLists;
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();

    _allImageLists = [
      [AppAssets.imgGetStart1, AppAssets.imgGetStart2, AppAssets.imgGetStart3],
      [AppAssets.imgGetStart4, AppAssets.imgGetStart5, AppAssets.imgGetStart6],
      [AppAssets.imgGetStart7, AppAssets.imgGetStart8, AppAssets.imgGetStart9],
      [AppAssets.imgGetStart10, AppAssets.imgGetStart11, AppAssets.imgGetStart12],
    ];

    _controllers = List.generate(
      _allImageLists.length,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(seconds: 15),
      )..repeat(),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _buildRow(int rowIndex) {
    final images = _allImageLists[rowIndex];
    final controller = _controllers[rowIndex];
    final direction = rowIndex.isEven ? 1.0 : -1.0;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final itemWidth = 180.setWidth;
        final totalWidth = (itemWidth + 12) * images.length;
        final offset = (controller.value * totalWidth * direction) % totalWidth;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Transform.translate(
            offset: Offset(-offset, 0),
            child: Row(
              children: [
                ...images.map((img) => _buildImageItem(img, itemWidth)),
                ...images.map((img) => _buildImageItem(img, itemWidth)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageItem(String img, double width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.setWidth),
      width: width,
      height: 120.setHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).black,
      body: Stack(
        children: [
          Positioned(
            top: -110,
            left: -92,
            child: Transform.rotate(
              angle: -pi / 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(4, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      height: 120.setHeight,
                      width: MediaQuery.of(context).size.width * 3,
                      child: _buildRow(i),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40.setWidth, vertical: 70.setHeight),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black.withValues(alpha: 0.8),
                    Colors.black.withValues(alpha: 0.01),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.80, 1],
                ),
              ),
              child: Column(
                children: [
                  CommonText(
                    text: "CUSTOMIZE YOUR PHOTOS\nWITH FILTER & EFFECT IN",
                    textAlign: TextAlign.center,
                    fontSize: 32.setFontSize,
                    textColor: Colors.white,
                    fontFamily: Constant.fontFamilyMedium500,
                    letterSpacing: 1.1,
                  ),
                  SizedBox(height: 6.setHeight),
                  CommonText(
                    text: "MIVI",
                    fontSize: 32.setFontSize,
                    textColor: CustomAppColor.of(context).primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                  const SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, SignInScreen.route());
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 12.setHeight),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: const BorderSide(width: 0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: "LET’S START",
                          textColor: CustomAppColor.of(context).primary,
                          fontSize: 14.setFontSize,
                        ),
                        Image.asset(
                          AppAssets.icRightDoubleArrow,
                          height: 18.setHeight,
                          width: 18.setWidth,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
