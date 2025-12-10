import 'dart:ui';

class ProfileOption {
  final String title;
  final String icon;
  final VoidCallback? onTap;
  final bool hasToggle;
  bool toggleValue;

  ProfileOption({
    required this.title,
    required this.icon,
    this.onTap,
    this.hasToggle = false,
    this.toggleValue = false,
  });
}
