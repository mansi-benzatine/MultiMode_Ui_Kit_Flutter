import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/app/my_app.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/string_constant.dart';

class OrderModel {
  final String status;
  final String date;
  final String orderId;
  final String productName;
  final double price;

  final String paymentMode;
  final String size;
  final int quantity;
  final String imageUrl;
  final String iconUrl;
  List<String>? actions = [];

  OrderModel({
    required this.status,
    required this.date,
    required this.orderId,
    required this.productName,
    required this.price,
    required this.paymentMode,
    required this.size,
    required this.quantity,
    required this.imageUrl,
    required this.iconUrl,
    this.actions,
  });
}

class ReasonOfCancellationData {
  final String reason;
  final bool? isSelected;

  ReasonOfCancellationData({
    required this.reason,
    this.isSelected,
  });
}

List<OrderModel> orders = [
  OrderModel(
    status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderConfirmed,
    date: AppStrings.date,
    orderId: AppStrings.orderId,
    productName: AppStrings.anniDesigner,
    iconUrl: AppAssets.icOrderConfirmed,
    price: 299.0,
    paymentMode: "COD",
    size: "M",
    quantity: 1,
    imageUrl: AppAssets.imgOrangeSaree6,
    actions: [
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).cancel,
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).track
    ],
  ),
  OrderModel(
    status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderCancelled,
    date: AppStrings.date,
    orderId: AppStrings.orderId,
    productName: AppStrings.anniDesigner,
    iconUrl: AppAssets.icOrderCancelled,
    price: 299.0,
    paymentMode: "COD",
    size: "M",
    quantity: 1,
    imageUrl: AppAssets.imgOrangeSaree6,
  ),
  OrderModel(
    status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderProcessing,
    date: AppStrings.date,
    orderId: AppStrings.orderId,
    productName: AppStrings.anniDesigner,
    iconUrl: AppAssets.icOrderProcessing,
    price: 299.0,
    paymentMode: "COD",
    size: "M",
    quantity: 1,
    imageUrl: AppAssets.imgOrangeSaree6,
    actions: [
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).cancel,
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).track
    ],
  ),
  OrderModel(
    status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderDelivered,
    date: AppStrings.date,
    orderId: AppStrings.orderId,
    productName: AppStrings.anniDesigner,
    iconUrl: AppAssets.icOrderDelivered,
    price: 299.0,
    paymentMode: "COD",
    size: "M",
    quantity: 1,
    imageUrl: AppAssets.imgOrangeSaree6,
    actions: [
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).goToShopping,
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).reviewNow
    ],
  ),
  OrderModel(
    status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderPending,
    date: AppStrings.date,
    orderId: AppStrings.orderId,
    productName: AppStrings.anniDesigner,
    iconUrl: AppAssets.icOrderPending,
    price: 299.0,
    paymentMode: "COD",
    size: "M",
    quantity: 1,
    imageUrl: AppAssets.imgOrangeSaree6,
    actions: [
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).cancel,
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).track
    ],
  ),
  OrderModel(
    status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderDispatch,
    date: AppStrings.date,
    orderId: AppStrings.orderId,
    productName: AppStrings.anniDesigner,
    iconUrl: AppAssets.icOrderDispatch,
    price: 299.0,
    paymentMode: "COD",
    size: "M",
    quantity: 1,
    imageUrl: AppAssets.imgOrangeSaree6,
    actions: [
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).cancel,
      Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).track
    ],
  ),
];

List<ReasonOfCancellationData> reasons = [
  ReasonOfCancellationData(reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).incorrectSizeOrdered, isSelected: false),
  ReasonOfCancellationData(
      reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).productNotRequiredAnymore, isSelected: false),
  ReasonOfCancellationData(reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).cashIssue, isSelected: false),
  ReasonOfCancellationData(reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderedByMistake, isSelected: false),
  ReasonOfCancellationData(
      reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).wantsToChangeStyleColorSize, isSelected: false),
  ReasonOfCancellationData(
      reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).delayedDeliveryCancellation, isSelected: false),
  ReasonOfCancellationData(reason: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).duplicateOrder, isSelected: false),
];
