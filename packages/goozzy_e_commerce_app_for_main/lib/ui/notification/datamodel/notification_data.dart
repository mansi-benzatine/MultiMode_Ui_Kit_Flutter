import '../../../../../utils/app_assets.dart';
import '../../../../../utils/string_constant.dart';

class OrderNotification {
  final String title;

  final String date;
  final String time;
  final String type;
  final String imageUrl;

  OrderNotification({
    required this.title,
    required this.date,
    required this.time,
    required this.type,
    required this.imageUrl,
  });
}

final List<OrderNotification> notifications = [
  OrderNotification(
    title: AppStrings.notification1,
    date: "10 July, 2021",
    time: "01:01 PM",
    type: "Offers",
    imageUrl: AppAssets.imgNotification1,
  ),
  OrderNotification(
    title: AppStrings.notification2,
    date: "05 July, 2021",
    time: "01:01 PM",
    type: "Order Info",
    imageUrl: AppAssets.imgNotification2,
  ),
  OrderNotification(
    title: AppStrings.notification3,
    date: "05 June, 2021",
    time: "01:01 PM",
    type: "Offers",
    imageUrl: AppAssets.imgNotification3,
  ),
  OrderNotification(
    title: AppStrings.notification4,
    date: "10 April, 2021",
    time: "01:01 PM",
    type: "Payment",
    imageUrl: AppAssets.imgNotification4,
  ),
  OrderNotification(
    title: AppStrings.notification5,
    date: "10 July, 2021",
    time: "01:01 PM",
    type: "Offers",
    imageUrl: AppAssets.imgNotification5,
  ),
  OrderNotification(
    title: AppStrings.notification6,
    date: "05 July, 2021",
    time: "01:01 PM",
    type: "Order",
    imageUrl: AppAssets.imgNotification6,
  ),
];
