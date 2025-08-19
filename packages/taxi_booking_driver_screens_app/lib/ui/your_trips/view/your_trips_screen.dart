import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/top_bar/topbar.dart';

import '../datamodel/your_trips_data.dart';

class YourTripsScreen extends StatefulWidget {
  const YourTripsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourTripsScreen());
  }

  @override
  State<YourTripsScreen> createState() => _YourTripsScreenState();
}

class _YourTripsScreenState extends State<YourTripsScreen> implements TopBarClickListener {
  final List<Trip> trips = [
    Trip(
      userName: "Brayden Jockos",
      userImageUrl: AppAssets.imgDummyProfile,
      paymentMethod: "Cash Payment",
      distanceKm: 2.00,
      duration: "5 min",
      pickupAddress: "1397 Walnut Street, Jackson",
      dropOffAddress: "345 Hardesty Street, 368972",
      fare: 25.00,
      status: TripStatus.confirm,
    ),
    Trip(
      userName: "Brayden",
      userImageUrl: AppAssets.imgDummyProfile,
      paymentMethod: "Cash Payment",
      distanceKm: 2.00,
      duration: "5 min",
      pickupAddress: "1397 Walnut Street, Jackson",
      dropOffAddress: "345 Hardesty Street, 368972",
      fare: 25.00,
      status: TripStatus.completed,
    ),
    Trip(
      userName: "Brayden",
      userImageUrl: AppAssets.imgDummyProfile,
      paymentMethod: "Cash Payment",
      distanceKm: 2.00,
      duration: "5 min",
      pickupAddress: "1397 Walnut Street, Jackson",
      dropOffAddress: "345 Hardesty Street, 368972",
      fare: 25.00,
      status: TripStatus.cancelled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: "Your Rides"),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                itemCount: trips.length,
                separatorBuilder: (_, __) => Divider(
                  color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                  thickness: 3,
                ),
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return TripCard(trip: trip);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    switch (trip.status) {
      case TripStatus.confirm:
        statusColor = const Color(0xFFFFC107);
        statusText = "CONFIRM";
        break;
      case TripStatus.completed:
        statusColor = Colors.green;
        statusText = "COMPLETED";
        break;
      case TripStatus.cancelled:
        statusColor = Colors.red;
        statusText = "CANCELLED";
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusGeometry.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  trip.userImageUrl,
                  alignment: Alignment.center,
                  width: 60.setWidth,
                  height: 60.setHeight,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: trip.userName,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.setFontSize,
                    ),
                    CommonText(
                      text: trip.paymentMethod,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.grey.shade600,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: "${trip.distanceKm.toStringAsFixed(2)} Km",
                    fontWeight: FontWeight.w700,
                    fontSize: 14.setFontSize,
                  ),
                  CommonText(
                    text: trip.duration,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.grey.shade600,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.radio_button_checked, size: 24, color: CustomAppColor.of(context).icBlackWhite),
                  SizedBox(
                    height: 50.setHeight,
                    child: const DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity, // optional
                      dashLength: 2,
                      lineThickness: 2,
                      dashGapLength: 4,
                      dashColor: Colors.grey,
                    ),
                  ),
                  const Icon(Icons.radio_button_checked, size: 24, color: Colors.green),
                ],
              ),
              SizedBox(width: 20.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Pickup",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    CommonText(
                      text: trip.pickupAddress,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 4.setHeight),
                    Divider(color: CustomAppColor.of(context).dividerColor),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: "Drop Off",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    CommonText(
                      text: trip.dropOffAddress,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 14.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(text: "\$${trip.fare.toStringAsFixed(2)}", fontSize: 16.setFontSize, fontWeight: FontWeight.w700),
              CommonText(
                text: statusText,
                textColor: statusColor,
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
