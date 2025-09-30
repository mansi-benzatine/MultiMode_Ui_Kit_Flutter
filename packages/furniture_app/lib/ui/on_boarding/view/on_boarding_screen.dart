import 'package:flutter/material.dart';
import 'package:furniture_app_package/ui/get_start/view/get_start_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';

class OnBoardingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
  }

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<Map<String, String>> _pages = [
    {
      "title": "Stylish Sofa",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
      "image": AppAssets.imgOnboarding1,
    },
    {
      "title": "Wooden Chair",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
      "image": AppAssets.imgOnboarding2,
    },
    {
      "title": "Roof Lamp",
      "description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever.",
      "image": AppAssets.imgOnboarding3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        page["image"]!,
                        fit: BoxFit.fill,
                        height: 630.setHeight,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: page["title"]!,
                              fontSize: 30.setFontSize,
                              textColor: CustomAppColor.of(context).txtBlack,
                              fontFamily: Constant.fontFamilyBold700,
                            ),
                            SizedBox(height: 10.setHeight),
                            CommonText(
                              text: page["description"]!,
                              fontSize: 14,
                              textColor: CustomAppColor.of(context).txtLightGrey,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 20.setHeight),
                            Row(
                              children: List.generate(
                                _pages.length,
                                (dotIndex) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(horizontal: 2),
                                  height: 5.setHeight,
                                  width: _currentIndex == dotIndex ? 20.setWidth : 5.setWidth,
                                  decoration: BoxDecoration(
                                    color: _currentIndex == dotIndex ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderTextFormField,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                      _controller.jumpToPage(2);
                    });
                  },
                  child: const CommonText(text: "Skip"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 26.setWidth,
                    right: 14.setWidth,
                    top: 16.setHeight,
                    bottom: 14.setHeight,
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (_currentIndex < _pages.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(context, GetStartScreen.route());
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
