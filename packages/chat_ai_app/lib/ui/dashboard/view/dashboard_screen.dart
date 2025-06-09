import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../history/view/history_screen.dart';
import '../../home/view/home_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../../tools/view/tools_screen.dart';

class ChatAiDashboardScreen extends StatefulWidget {
  const ChatAiDashboardScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ChatAiDashboardScreen());
  }

  @override
  State<ChatAiDashboardScreen> createState() => _ChatAiDashboardScreenState();
}

class _ChatAiDashboardScreenState extends State<ChatAiDashboardScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: _DashboardPagesView(selectedIndex: _currentIndex, pageController: _pageController),
      bottomNavigationBar: _BottomBarView(selectedIndex: _currentIndex, pageController: _pageController),
    );
  }
}

class _DashboardPagesView extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  final PageController pageController;

  const _DashboardPagesView({required this.selectedIndex, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          selectedIndex.value = index;
        },
        children: [
          HomeScreen(pageController: pageController),
          const ToolsScreen(),
          const HistoryScreen(),
          const ProfileScreen(),
        ],
      ),
    );
  }
}

class _BottomBarView extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  final PageController pageController;

  const _BottomBarView({required this.selectedIndex, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (context, value, child) {
          return Container(
            width: 0.screenWidth,
            height: 75.setHeight,
            margin: EdgeInsets.only(bottom: 10.setHeight, right: 15.setWidth, left: 15.setWidth),
            padding: EdgeInsets.symmetric(vertical: 5.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bottomBarBgColor,
              borderRadius: BorderRadius.circular(500),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _itemBottomBar(
                    context: context, index: 0, image: selectedIndex.value == 0 ? AppAssets.icBottomFilledHome : AppAssets.icBottomUnFilledHome),
                _itemBottomBar(
                    context: context, index: 1, image: selectedIndex.value == 1 ? AppAssets.icBottomFilledTools : AppAssets.icBottomUnFilledTools),
                _itemBottomBar(
                    context: context,
                    index: 2,
                    image: selectedIndex.value == 2 ? AppAssets.icBottomFilledHistory : AppAssets.icBottomUnFilledHistory),
                _itemBottomBar(
                    context: context,
                    index: 3,
                    image: selectedIndex.value == 3 ? AppAssets.icBottomFilledProfile : AppAssets.icBottomUnFilledProfile),
              ],
            ),
          );
        },
      ),
    );
  }

  _itemBottomBar({required BuildContext context, required int index, required String image}) {
    return InkWell(
      onTap: () {
        pageController.jumpToPage(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: (selectedIndex.value == index) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(22.setHeight),
        child: Image.asset(
          image,
          color: (selectedIndex.value == index) ? CustomAppColor.of(context).black : CustomAppColor.of(context).txtBlack,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
