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

/*
List<EditProfileData> editProfileList = [
  EditProfileData(
    icon: AppAssets.icProfileFilled,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).name,
    detail: AppStrings.johnDoe,
  ),
  EditProfileData(
    icon: AppAssets.icTickSquare,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).userName,
    detail: AppStrings.john.replaceAll("@", ""),
  ),
  EditProfileData(
    icon: AppAssets.icDocument,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).bio,
    detail: AppStrings.designerPhoto,
  ),
];

List<EditProfileData> socialList = [
  EditProfileData(
      icon: AppAssets.icInstagramFilled,
      label: Languages.of(MyApp.navigatorKey.currentState!.context).instagram,
      detail: AppStrings.john.toLowerCase()),
  EditProfileData(
      icon: AppAssets.icFacebookFilled,
      label: Languages.of(MyApp.navigatorKey.currentState!.context).facebook,
      detail: AppStrings.johnDoe.toLowerCase().replaceAll(" ", "")),
  EditProfileData(
      icon: AppAssets.icTwitterFilled,
      label: Languages.of(MyApp.navigatorKey.currentState!.context).twitter,
      detail: AppStrings.john.replaceAll("@", "")),
];

List<EditProfileData> settingsList = [
  EditProfileData(
    icon: AppAssets.icProfileFilled,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).manageAccount,
    isTrailingIcon: true,
    isTrailingIconWithLabel: false,
    route: (context) => ManageAccountScreen.route(),
  ),
  EditProfileData(
    icon: AppAssets.icMoreCircle,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).language,
    isTrailingIcon: true,
    isTrailingIconWithLabel: true,
    route: (context) => LanguageScreen.route(),
  ),
  EditProfileData(
    icon: AppAssets.icShow,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).darkMode,
    isTrailingIcon: false,
    isTrailingIconWithLabel: false,
  ),
  EditProfileData(
    icon: AppAssets.icInfo,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).helpCenter,
    isTrailingIcon: true,
    isTrailingIconWithLabel: false,
    route: (context) => HelpCenterScreen.route(),
  ),
  EditProfileData(
    icon: AppAssets.icPrivacyPolicy,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).privacyPolicy,
    isTrailingIcon: true,
    isTrailingIconWithLabel: false,
    route: (context) => PrivacyPolicyScreen.route(),
  ),
];

List<EditProfileData> manageAccountList = [
  EditProfileData(
    icon: AppAssets.icCall,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).phoneNumber,
    detail: "+1 0123456789",
    isTrailingIcon: true,
    isTrailingIconWithLabel: true,
  ),
  EditProfileData(
    icon: AppAssets.icMail,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).email,
    isTrailingIcon: true,
    detail: AppStrings.john.replaceAll("@", ""),
    isTrailingIconWithLabel: true,
  ),
  EditProfileData(
    icon: AppAssets.icCalender,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).dateOfBirth,
    isTrailingIcon: false,
    isTrailingIconWithLabel: true,
    detail: "12/06/1991",
  ),
];

List<EditProfileData> accountControlList = [
  EditProfileData(
    icon: AppAssets.icPassword,
    label: Languages.of(MyApp.navigatorKey.currentState!.context).changePassword,
    isTrailingIcon: true,
    route: (context) => ChangePasswordScreen.route(),
  ),
  EditProfileData(icon: AppAssets.icDelete, label: Languages.of(MyApp.navigatorKey.currentState!.context).deleteAccount, isTrailingIcon: false),
  EditProfileData(icon: AppAssets.icLogout, label: Languages.of(MyApp.navigatorKey.currentState!.context).logout, isTrailingIcon: false),
];

List<EditProfileData> helpCenterList = [
  EditProfileData(label: Languages.of(MyApp.navigatorKey.currentState!.context).customerService, icon: AppAssets.icCustomerService),
  EditProfileData(label: Languages.of(MyApp.navigatorKey.currentState!.context).whatsapp, icon: AppAssets.icWhatAppFilled),
  EditProfileData(label: Languages.of(MyApp.navigatorKey.currentState!.context).website, icon: AppAssets.icWebsite),
  EditProfileData(label: Languages.of(MyApp.navigatorKey.currentState!.context).facebook, icon: AppAssets.icFacebookColored),
  EditProfileData(label: Languages.of(MyApp.navigatorKey.currentState!.context).twitter, icon: AppAssets.icTwitterFilled),
  EditProfileData(label: Languages.of(MyApp.navigatorKey.currentState!.context).instagram, icon: AppAssets.icInstagramFill),
];
*/
