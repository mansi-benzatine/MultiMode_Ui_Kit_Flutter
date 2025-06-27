import 'package:dating_app_package/ui/chats_list/views/chats_list_screen.dart';
import 'package:dating_app_package/ui/likes/views/likes_screen.dart';
import 'package:dating_app_package/utils/app_assets.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../home/views/home_screen.dart';
import '../../profile/views/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DashboardScreen());
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LikesScreen(),
    const ChatsListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: isLightTheme ? Brightness.dark : Brightness.light,
        statusBarBrightness: isLightTheme ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: _currentIndex == 0 || _currentIndex == 1 ? CustomAppColor.of(context).txtPink : CustomAppColor.of(context).bgScaffold,
        body: SafeArea(top: true, child: _pages[_currentIndex]),
        bottomNavigationBar: SafeArea(
          top: true,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSwipeCard,
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                String icon;
                final isSelected = _currentIndex == index;
                switch (index) {
                  case 0:
                    icon = isSelected ? AppAssets.icSelectedDiscover : AppAssets.icUnselectedDiscover;
                    break;
                  case 1:
                    icon = isSelected ? AppAssets.icSelectedLikes : AppAssets.icUnselectedLikes;

                    break;
                  case 2:
                    icon = isSelected ? AppAssets.icSelectedChat : AppAssets.icUnselectedChat;

                    break;
                  default:
                    icon = isSelected ? AppAssets.icSelectedProfile : AppAssets.icUnselectedProfile;
                }

                return GestureDetector(
                  onTap: () => setState(() => _currentIndex = index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          icon,
                          width: 40.setWidth,
                          height: 40.setHeight,
                          fit: BoxFit.fill,
                        ),
                        if (index == 2)
                          Positioned(
                            top: -2.setHeight,
                            right: -2.setWidth,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).txtPink,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              constraints: BoxConstraints(minWidth: 20.setWidth, minHeight: 20.setHeight),
                              child: Center(
                                child: CommonText(
                                  text: '4',
                                  textColor: Colors.white,
                                  fontSize: 10.setFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
