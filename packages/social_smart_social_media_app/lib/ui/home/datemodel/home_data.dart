import 'package:flutter/material.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../ui/create_posts/view/create_post_screen.dart';
import '../../../../../../../ui/inbox/view/inbox_screen.dart';
import '../../../../../../../utils/app_assets.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../discover/view/discover_screen.dart';
import '../../profile/view/profile_screen.dart';

class NavigationItem {
  final String? label;
  final String activeIcon;
  final String inactiveIcon;
  final Widget screen;

  NavigationItem({
    this.label,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.screen,
  });
}

List<NavigationItem> navItems(BuildContext context) {
  return [
    NavigationItem(
      label: Languages.of(context).home,
      activeIcon: AppAssets.icActiveHome,
      inactiveIcon: AppAssets.icHome,
      screen: const DashboardScreen(),
    ),
    NavigationItem(
      label: Languages.of(context).discover,
      activeIcon: AppAssets.icActiveDiscovery,
      inactiveIcon: AppAssets.icDiscovery,
      screen: const DiscoverScreen(),
    ),
    NavigationItem(
      activeIcon: AppAssets.icClose,
      inactiveIcon: AppAssets.icCreate,
      screen: const CreatePostScreen(),
    ),
    NavigationItem(
      label: Languages.of(context).inbox,
      activeIcon: AppAssets.icActiveChat,
      inactiveIcon: AppAssets.icChat,
      screen: const InboxScreen(),
    ),
    NavigationItem(
      label: Languages.of(context).profile,
      activeIcon: AppAssets.icActiveProfile,
      inactiveIcon: AppAssets.icProfileFilled,
      screen: const ProfileScreen(
        fromPost: false,
      ),
    ),
  ];
}
