import 'dart:ui';

class WhoIsWatchingModel {
  final String name;
  final String? image;
  final Color? backgroundColor;
  final bool isAddProfile;
  final bool isEditProfile;

  WhoIsWatchingModel({
    required this.name,
    this.image,
    this.backgroundColor,
    this.isAddProfile = false,
    this.isEditProfile = false,
  });
}
