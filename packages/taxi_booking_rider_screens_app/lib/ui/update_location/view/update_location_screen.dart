import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/button/common_button.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class UpdateLocationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const UpdateLocationScreen());
  }

  const UpdateLocationScreen({super.key});

  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  List<Map<String, dynamic>> navigateItems = [];
  final TextEditingController pickUpController = TextEditingController(text: "1397 Walnut Street, Jackson");
  final TextEditingController dropOffController = TextEditingController(text: "345 Hardesty Street, 368972");

  _fillData() {
    navigateItems = [
      {
        "icon": Icons.star,
        "title": Languages.of(context).txtSavedPlaces,
      },
      {
        "icon": Icons.location_on_outlined,
        "title": Languages.of(context).txtSetLocationOnMap,
      },
      {
        "icon": Icons.skip_next,
        "title": Languages.of(context).txtEnterDestinationLater,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: CustomAppColor.of(context).bgScreen),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgAlertDialog,
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScreen,
          automaticallyImplyLeading: false,
          titleSpacing: 28.setWidth,
          title: CommonText(
            text: Languages.of(context).txtLocation,
            fontWeight: FontWeight.w500,
            fontSize: 20.setFontSize,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Stack(
            fit: StackFit.loose,
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 170.setHeight, left: 22.setWidth, right: 22.setWidth),
                itemCount: navigateItems.length,
                itemBuilder: (context, index) {
                  final item = navigateItems[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.setHeight),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(12)), border: Border.all(color: CustomAppColor.of(context).txtGray, width: 0.5)),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            item["icon"],
                            color: CustomAppColor.of(context).txtGray,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: item["title"],
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
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
                      SizedBox(height: 10.setHeight),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.radio_button_checked, size: 24, color: CustomAppColor.of(context).icBlackWhite),
                              SizedBox(
                                height: 60.setHeight,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Pickup",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtGray,
                                ),
                                TextFormField(
                                  controller: pickUpController,
                                  style: TextStyle(
                                    fontSize: 14.setFontSize,
                                    color: CustomAppColor.of(context).txtBlack,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: CustomAppColor.of(context).bgScreen, width: 0.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: CustomAppColor.of(context).bgScreen, width: 0.0),
                                    ),
                                  ),
                                ),
                                Divider(endIndent: 10, color: CustomAppColor.of(context).dividerColor),
                                SizedBox(height: 4.setHeight),
                                CommonText(
                                  text: "Drop Off",
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).txtGray,
                                ),
                                TextFormField(
                                  controller: dropOffController,
                                  style: TextStyle(
                                    fontSize: 14.setFontSize,
                                    color: CustomAppColor.of(context).txtBlack,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: CustomAppColor.of(context).bgScreen, width: 0.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: CustomAppColor.of(context).bgScreen, width: 0.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 35.setHeight),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
                    child: CommonButton(onTap: () => Navigator.pop(context), text: Languages.of(context).txtSetLocation),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
