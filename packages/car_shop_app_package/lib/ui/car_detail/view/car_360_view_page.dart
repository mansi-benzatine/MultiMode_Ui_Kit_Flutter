import 'package:car_shop_app_package/utils/app_assets.dart';
import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class Car360ViewPage extends StatefulWidget {
  const Car360ViewPage({super.key});

  @override
  State<Car360ViewPage> createState() => _Car360ViewPageState();
}

class _Car360ViewPageState extends State<Car360ViewPage> {
  late List<String> carImages;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    carImages = List.generate(
      7,
      (index) => "packages/car_shop_app_package/assets/images/img_anim${index + 1}.webp",
    );
  }

  void _rotateLeft() {
    setState(() {
      currentIndex = (currentIndex - 1) % carImages.length;
      if (currentIndex < 0) currentIndex = carImages.length - 1;
    });
  }

  void _rotateRight() {
    setState(() {
      currentIndex = (currentIndex + 1) % carImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
            child: Image.asset(
              carImages[currentIndex],
              fit: BoxFit.fill,
              height: 200,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: (details) {
              final box = context.findRenderObject() as RenderBox;
              final localPos = box.globalToLocal(details.globalPosition);

              final width = box.size.width;
              if (localPos.dx < width / 2) {
                _rotateLeft();
              } else {
                _rotateRight();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: Image.asset(
                AppAssets.imgRotationBar,
                height: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
