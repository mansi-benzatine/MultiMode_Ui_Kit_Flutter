import '../../../utils/string_constant.dart';

class NotificationCategory {
  String name;
  bool isSelected;

  NotificationCategory({required this.name, this.isSelected = false});
}

List<NotificationCategory> categories = [
  NotificationCategory(name: AppStrings.ankletsAndTopRings),
  NotificationCategory(name: AppStrings.applicationCoversAndFridgeMats, isSelected: true),
  NotificationCategory(name: AppStrings.awesomeApril),
  NotificationCategory(name: AppStrings.bagsAndBackpacks, isSelected: true),
  NotificationCategory(name: AppStrings.banglesAndBracelets),
  NotificationCategory(name: AppStrings.bedSheets),
  NotificationCategory(name: AppStrings.capesShrugs),
  NotificationCategory(name: AppStrings.casualShoes),
  NotificationCategory(name: AppStrings.classicKurtis),
  NotificationCategory(name: AppStrings.decorativeStickers),
];
