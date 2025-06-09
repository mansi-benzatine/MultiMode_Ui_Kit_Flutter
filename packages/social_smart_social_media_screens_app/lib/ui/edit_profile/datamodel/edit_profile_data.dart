import 'package:flutter/cupertino.dart';

class EditProfileData {
  final String? icon;
  final String? label;
  final String? detail;
  final bool? isTrailingIcon;
  final bool? isTrailingIconWithLabel;
  final Route Function(BuildContext)? route;

  EditProfileData({
    this.icon,
    this.label,
    this.detail,
    this.isTrailingIcon,
    this.isTrailingIconWithLabel,
    this.route,
  });
}
