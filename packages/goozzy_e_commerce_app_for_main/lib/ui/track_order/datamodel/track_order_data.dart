import '../../../../../localization/language/languages.dart';
import '../../../../../ui/app/my_app.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/string_constant.dart';

class OrderTrackingModel {
  final String orderId;
  final String deliveryDate;
  final String imageUrl;
  final List<TrackingStep> trackingSteps;

  OrderTrackingModel({
    required this.orderId,
    required this.deliveryDate,
    required this.imageUrl,
    required this.trackingSteps,
  });
}

class TrackingStep {
  final String time;
  final String status;
  final String description;
  final bool isCompleted;

  TrackingStep({
    required this.time,
    required this.status,
    required this.description,
    required this.isCompleted,
  });
}

OrderTrackingModel orderTracking = OrderTrackingModel(
  orderId: "212454",
  deliveryDate: AppStrings.date,
  imageUrl: AppAssets.imgOrangeSaree6,
  trackingSteps: [
    TrackingStep(
      time: "9:30 AM",
      status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).orderPlaced,
      description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).yourOrderWasPlaced,
      isCompleted: true,
    ),
    TrackingStep(
      time: "9:35 AM",
      status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).pending,
      description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).yourOrderIsPendingForConfirmation,
      isCompleted: true,
    ),
    TrackingStep(
      time: "9:55 AM",
      status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).confirmed,
      description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).yourOrderIsConfirmed,
      isCompleted: true,
    ),
    TrackingStep(
      time: "",
      status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).processing,
      description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).yourProductIsProcessingToDeliverYouOnTime,
      isCompleted: false,
    ),
    TrackingStep(
      time: "",
      status: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).delivered,
      description: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).productDeliveredToYouAndMarkedAsDeliveredByCustomer,
      isCompleted: false,
    ),
  ],
);
