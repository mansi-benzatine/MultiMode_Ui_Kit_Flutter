import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/app/my_app.dart';
import '../../../../../../utils/app_assets.dart';

class AccountData {
  final String leadingIcon;
  final String label;
  final bool? isSuffixIcon;
  final bool? isNavigate;

  AccountData({
    required this.leadingIcon,
    required this.label,
    this.isSuffixIcon,
    this.isNavigate,
  });
}

List<AccountData> accountList = [
  AccountData(
    leadingIcon: AppAssets.icBank,
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).myBankDetails,
    isSuffixIcon: true,
  ),
  AccountData(
      leadingIcon: AppAssets.icShare,
      label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).mySharedCatalogs,
      isSuffixIcon: true),
  AccountData(
      leadingIcon: AppAssets.icRefer, label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).referAndEarn, isSuffixIcon: false),
  AccountData(
      leadingIcon: AppAssets.icSetting, label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).settings, isSuffixIcon: true),
  AccountData(
      leadingIcon: AppAssets.icNotificationBell,
      label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).notificationSettings,
      isSuffixIcon: true),
  AccountData(
      leadingIcon: AppAssets.icRate, label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).rateGozzy, isNavigate: true),
  AccountData(leadingIcon: AppAssets.icLogout, label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).logout, isNavigate: true),
];
