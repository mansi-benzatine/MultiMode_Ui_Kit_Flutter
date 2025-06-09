import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../app/my_app.dart';

class PaymentModesData {
  final String leadingIcon;
  final String label;
  final bool? isSuffixIconSelect;
  final String? description;

  PaymentModesData({
    required this.leadingIcon,
    required this.label,
    this.isSuffixIconSelect,
    this.description,
  });
}

List<PaymentModesData> paymentModeList = [
  PaymentModesData(
    leadingIcon: AppAssets.imgMoney,
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).cashOnDelivery,
    isSuffixIconSelect: true,
  ),
  PaymentModesData(
    leadingIcon: AppAssets.imgPaytm,
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).paytm,
    description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).walletDebitCard,
    isSuffixIconSelect: false,
  ),
  PaymentModesData(
    leadingIcon: AppAssets.imgCreditCard,
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).online,
    description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).debitCardCreditCard,
    isSuffixIconSelect: false,
  ),
];
