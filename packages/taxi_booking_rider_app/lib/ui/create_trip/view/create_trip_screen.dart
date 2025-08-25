import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_app_package/ui/create_trip_steps/view/create_trip_step_screen.dart';
import 'package:taxi_booking_rider_app_package/ui/update_location/view/update_location_screen.dart';
import 'package:taxi_booking_rider_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_app_package/widgets/text/common_text.dart';

class CreateTripScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateTripScreen());
  }

  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  String _pickupLocation = "1397 Walnut Street, Jackson";
  String _dropoffLocation = "345 Hardesty Street, 368972";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppAssets.imgTrackMap,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 25.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).black.withValues(alpha: 0.09),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtCreateTrip,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.setFontSize,
                        ),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.close,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.radio_button_checked, size: 24, color: CustomAppColor.of(context).icBlackWhite),
                            SizedBox(
                              height: 55.setHeight,
                              child: const DottedLine(
                                direction: Axis.vertical,
                                lineLength: double.infinity,
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
                          child: InkWell(
                            onTap: () => Navigator.push(context, UpdateLocationScreen.route()),
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
                                  text: _pickupLocation,
                                  fontSize: 15.setFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 4.setHeight),
                                Divider(
                                  endIndent: 30,
                                  color: CustomAppColor.of(context).dividerColor,
                                ),
                                SizedBox(height: 4.setHeight),
                                CommonText(
                                  text: "Drop Off",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtGray,
                                ),
                                CommonText(
                                  text: _dropoffLocation,
                                  fontSize: 15.setFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              final temp = _pickupLocation;
                              _pickupLocation = _dropoffLocation;
                              _dropoffLocation = temp;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).bgAlertDialog,
                              border: Border.all(color: CustomAppColor.of(context).btnBorder),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Image.asset(
                              AppAssets.icSwap,
                              width: 30.setWidth,
                              height: 30.setHeight,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 30.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).black.withValues(alpha: 0.09),
                      blurRadius: 10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, CreateTripStepScreen.route());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14.setHeight, horizontal: 10.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).btnPrimary,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CommonText(
                            text: Languages.of(context).txtCreateATrip,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.setFontSize,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Image.asset(
                            AppAssets.icNavigateArrow,
                            height: 18.setHeight,
                            width: 34.setWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
