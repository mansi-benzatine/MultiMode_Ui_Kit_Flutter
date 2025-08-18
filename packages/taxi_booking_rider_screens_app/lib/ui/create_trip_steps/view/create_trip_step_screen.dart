import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/chat/view/chat_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/create_new_pin/call_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/ui/update_location/view/update_location_screen.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/button/common_button.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/text/common_text.dart';

class CreateTripStepScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateTripStepScreen());
  }

  const CreateTripStepScreen({super.key});

  @override
  State<CreateTripStepScreen> createState() => _CreateTripStepScreenState();
}

class _CreateTripStepScreenState extends State<CreateTripStepScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
                          text: _currentPage == 0
                              ? Languages.of(context).txtCreateTrip
                              : _currentPage == 1
                                  ? Languages.of(context).txtChooseATrip
                                  : _currentPage == 2
                                      ? Languages.of(context).txtPaymentMethod
                                      : Languages.of(context).txtRideConfirmed,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.setFontSize,
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 25.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        bool isActive = index <= _currentPage;
                        return Row(
                          children: [
                            if (index > 0)
                              SizedBox(
                                width: 40.setWidth,
                                height: 2.setHeight,
                                child: DottedLine(
                                  direction: Axis.horizontal,
                                  dashLength: 4,
                                  dashGapLength: 3,
                                  lineThickness: 1,
                                  dashColor: isActive ? const Color(0xFF2DBB54) : CustomAppColor.of(context).txtGray.withValues(alpha: 0.5),
                                ),
                              ),
                            Container(
                              decoration: BoxDecoration(
                                  color: isActive ? const Color(0xFF2DBB54) : CustomAppColor.of(context).bgAlertDialog,
                                  border: Border.all(color: isActive ? const Color(0xFF2DBB54) : CustomAppColor.of(context).dividerColor),
                                  borderRadius: const BorderRadius.all(Radius.circular(10))),
                              padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 16.setWidth),
                              child: CommonText(
                                text: '${index + 1}',
                                fontSize: 16.setFontSize,
                                textColor: isActive ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 450.setHeight,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    StepOneView(pageController: _pageController),
                    StepTwoView(pageController: _pageController),
                    StepThreeView(pageController: _pageController),
                    StepFourView(pageController: _pageController),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StepOneView extends StatefulWidget {
  final PageController pageController;

  const StepOneView({super.key, required this.pageController});

  @override
  State<StepOneView> createState() => _StepOneViewState();
}

class _StepOneViewState extends State<StepOneView> {
  int _selectedSeat = 1;
  String _pickupLocation = "1397 Walnut Street, Jackson";
  String _dropoffLocation = "345 Hardesty Street, 368972";
  TimeOfDay? startTime;
  bool _isNow = true;
  bool _isTimeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 25.setHeight),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTrip,
                fontWeight: FontWeight.w500,
                fontSize: 20.setFontSize,
              ),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.push(context, UpdateLocationScreen.route()),
                  child: CommonText(
                    text: Languages.of(context).txtChange.toUpperCase(),
                    fontWeight: FontWeight.w700,
                    fontSize: 14.setFontSize,
                    textColor: const Color(0xFF2DBB54),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.setHeight),
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
              ),
            ],
          ),
          SizedBox(height: 25.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 2,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 18.setHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: Languages.of(context).txtSeatAndTime,
                fontSize: 17.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 15.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtNeedSeat,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 20.setWidth),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _selectedSeat = 1),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.setWidth,
                            vertical: 6.setHeight,
                          ),
                          margin: EdgeInsets.only(right: 8.setWidth),
                          decoration: BoxDecoration(
                            color: _selectedSeat == 1 ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _selectedSeat == 1 ? Colors.black : CustomAppColor.of(context).btnBorder,
                            ),
                          ),
                          child: CommonText(
                            text: "1",
                            fontSize: 14.setFontSize,
                            textColor: _selectedSeat == 1 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _selectedSeat = 2),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.setWidth,
                            vertical: 6.setHeight,
                          ),
                          margin: EdgeInsets.only(right: 8.setWidth),
                          decoration: BoxDecoration(
                            color: _selectedSeat == 2 ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _selectedSeat == 2 ? Colors.black : CustomAppColor.of(context).btnBorder,
                            ),
                          ),
                          child: CommonText(
                            text: "2",
                            fontSize: 14.setFontSize,
                            textColor: _selectedSeat == 2 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _selectedSeat = 3),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.setWidth,
                            vertical: 6.setHeight,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedSeat == 3 ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _selectedSeat == 3 ? Colors.black : CustomAppColor.of(context).btnBorder,
                            ),
                          ),
                          child: CommonText(
                            text: "3",
                            fontSize: 14.setFontSize,
                            textColor: _selectedSeat == 3 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 13.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "Schedule Time",
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(width: 20.setWidth),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          _isNow = true;
                          _isTimeSelected = false;
                          startTime = null;
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.setWidth,
                            vertical: 8.setHeight,
                          ),
                          decoration: BoxDecoration(
                            color: _isNow ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _isNow ? Colors.black : CustomAppColor.of(context).btnBorder,
                            ),
                          ),
                          child: CommonText(
                            text: "Now",
                            fontSize: 12.setFontSize,
                            textColor: _isNow ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      GestureDetector(
                        onTap: () async {
                          _isNow = false;
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            setState(() {
                              startTime = time;
                              _isTimeSelected = true;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.setWidth,
                            vertical: _isTimeSelected ? 8.setHeight : 6.setHeight,
                          ),
                          decoration: BoxDecoration(
                            color: !_isNow ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).bgAlertDialog,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: !_isNow ? Colors.black : CustomAppColor.of(context).btnBorder,
                            ),
                          ),
                          child: _isTimeSelected
                              ? CommonText(
                                  text: startTime!.format(context),
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).white,
                                )
                              : Icon(
                                  Icons.watch_later,
                                  color: !_isNow ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 26.setHeight),
              Row(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        height: 48.setHeight,
                        onTap: () => Navigator.pop(context),
                        text: Languages.of(context).txtBack,
                        borderColor: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                        buttonColor: CustomAppColor.of(context).bgAlertDialog,
                        buttonTextColor: CustomAppColor.of(context).txtBlack,
                        buttonTextSize: 16.setFontSize,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    flex: 3,
                    child: CommonButton(
                      height: 48.setHeight,
                      buttonTextSize: 16.setFontSize,
                      onTap: () {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      text: Languages.of(context).txtContinue,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StepTwoView extends StatefulWidget {
  final PageController pageController;

  const StepTwoView({super.key, required this.pageController});

  @override
  State<StepTwoView> createState() => _StepTwoViewState();
}

class _StepTwoViewState extends State<StepTwoView> {
  String? _selectedCar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtSelectCar,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 10.setHeight),
          SizedBox(
            height: 120.setHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCarOption("RideGo", AppAssets.imgRideGo),
                _buildCarOption("Premium", AppAssets.imgPremium),
                _buildCarOption("RideGoAuto", AppAssets.imgRideGoAuto),
                _buildCarOption("Eco", AppAssets.imgEco),
              ],
            ),
          ),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icMap,
                      height: 19.setHeight,
                      width: 19.setWidth,
                    ),
                    SizedBox(width: 7.setWidth),
                    CommonText(
                      text: "45 km",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icClock,
                      height: 19.setHeight,
                      width: 19.setWidth,
                    ),
                    SizedBox(width: 7.setWidth),
                    CommonText(
                      text: "15 min",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icDollar,
                      height: 19.setHeight,
                      width: 19.setWidth,
                    ),
                    SizedBox(width: 7.setWidth),
                    CommonText(
                      text: "\$146",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              Column(
                children: [
                  Icon(Icons.radio_button_checked, size: 22, color: CustomAppColor.of(context).icBlackWhite),
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
                  const Icon(Icons.radio_button_checked, size: 22, color: Colors.green),
                ],
              ),
              SizedBox(width: 15.setWidth),
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
                      text: "1397 Walnut Street, Jackson",
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
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    CommonText(
                      text: "345 Hardesty Street, 368972",
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  height: 48.setHeight,
                  onTap: () {
                    widget.pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutBack,
                    );
                  },
                  text: Languages.of(context).txtBack,
                  borderColor: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                  buttonColor: CustomAppColor.of(context).bgAlertDialog,
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  buttonTextSize: 16.setFontSize,
                ),
              ),
              SizedBox(width: 12.setWidth),
              Expanded(
                flex: 3,
                child: CommonButton(
                  height: 48.setHeight,
                  buttonTextSize: 16.setFontSize,
                  onTap: () {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: Languages.of(context).txtBookPremium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarOption(String carType, String imagePath) {
    bool isSelected = _selectedCar == carType;
    return GestureDetector(
      onTap: () => setState(() => _selectedCar = carType),
      child: Container(
        padding: EdgeInsets.all(8.setHeight),
        margin: EdgeInsets.only(right: 5.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75.setWidth,
              height: 75.setHeight,
              decoration: BoxDecoration(
                color: isSelected ? CustomAppColor.of(context).btnPrimary : const Color(0xFFF6F6F6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.black : CustomAppColor.of(context).transparent,
                ),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: carType,
              fontSize: 12.setFontSize,
              textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

class StepThreeView extends StatefulWidget {
  final PageController pageController;

  const StepThreeView({super.key, required this.pageController});

  @override
  State<StepThreeView> createState() => _StepThreeViewState();
}

class _StepThreeViewState extends State<StepThreeView> {
  String? _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 16.setHeight),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtSelectPayment,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () {},
                  child: CommonText(
                    text: Languages.of(context).txtAddNew.toUpperCase(),
                    fontSize: 15.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPaymentOption(
                Languages.of(context).txtCashPayment,
                AppAssets.icCash,
                cardNumber: "Default Method",
                isSelected: _selectedPaymentMethod == Languages.of(context).txtCashPayment,
              ),
              _buildPaymentOption(
                Languages.of(context).txtDebitCard,
                AppAssets.icCard,
                cardNumber: "**** **** **** 8978",
                isSelected: _selectedPaymentMethod == Languages.of(context).txtDebitCard,
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: Languages.of(context).txtPromoCode,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 10.setHeight),
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [4, 4],
              strokeWidth: 1,
              radius: const Radius.circular(16),
              color: CustomAppColor.of(context).txtGray,
              borderPadding: const EdgeInsets.all(1),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              decoration: BoxDecoration(color: CustomAppColor.of(context).bgPromoCode, borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtAddPromoCode.toUpperCase(),
                      fontWeight: FontWeight.w700,
                      textColor: Colors.green,
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    size: 25.setFontSize,
                    color: const Color(0xFF9EA2A7),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 22.setHeight),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  height: 48.setHeight,
                  onTap: () {
                    widget.pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: Languages.of(context).txtBack,
                  borderColor: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                  buttonColor: CustomAppColor.of(context).bgAlertDialog,
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  buttonTextSize: 16.setFontSize,
                ),
              ),
              SizedBox(width: 12.setWidth),
              Expanded(
                flex: 3,
                child: CommonButton(
                  height: 48.setHeight,
                  buttonTextSize: 16.setFontSize,
                  onTap: () {
                    widget.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: Languages.of(context).txtRequestATrip,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String method, String icon, {String? cardNumber, bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedPaymentMethod == method) {
            _selectedPaymentMethod = null;
          } else {
            _selectedPaymentMethod = method;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.setHeight),
        padding: EdgeInsets.all(12.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgAlertDialog,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.green : CustomAppColor.of(context).dividerColor,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
              decoration: BoxDecoration(
                color: isSelected ? CustomAppColor.of(context).icBlackWhite : const Color(0xFF9EA2A7).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                icon,
                width: 24.setFontSize,
              ),
            ),
            SizedBox(width: 12.setWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: method,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  if (cardNumber != null)
                    CommonText(
                      text: cardNumber,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                ],
              ),
            ),
            Icon(
              Icons.check_circle,
              size: 25.setFontSize,
              color: isSelected ? CustomAppColor.of(context).icBlackWhite : CustomAppColor.of(context).dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}

class StepFourView extends StatelessWidget {
  final PageController pageController;
  const StepFourView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 24.setHeight),
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadiusGeometry.all(
                  Radius.circular(12),
                ),
                child: Image.asset(
                  AppAssets.imgDummyDriverProfile,
                  alignment: Alignment.center,
                  width: 70.setWidth,
                  height: 70.setHeight,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Devin Jorje",
                      fontWeight: FontWeight.w700,
                      fontSize: 17.setFontSize,
                    ),
                    CommonText(
                      text: "Toyota Inova (CSR874-569)",
                      fontWeight: FontWeight.w500,
                      fontSize: 13.setFontSize,
                      textColor: CustomAppColor.of(context).txtGray,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7.setWidth, vertical: 3.setHeight),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    border: Border.all(
                      color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.1),
                    ),
                    color: CustomAppColor.of(context).bgAlertDialog),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFC107),
                      size: 15,
                    ),
                    SizedBox(width: 4.setWidth),
                    CommonText(
                      text: "4.5",
                      fontWeight: FontWeight.w500,
                      fontSize: 10.setFontSize,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16.setHeight),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 17.setHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icMap,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "45 km",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icClock,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "15 min",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icDollar,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "\$146",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashGapLength: 4,
            dashColor: CustomAppColor.of(context).dividerColor,
          ),
          SizedBox(height: 18.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtPickupPoint,
                fontSize: 17.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              InkWell(
                onTap: () {},
                child: CommonText(
                  text: Languages.of(context).txtChange.toUpperCase(),
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          ClipRRect(
            borderRadius: const BorderRadiusGeometry.all(
              Radius.circular(12),
            ),
            child: Image.asset(
              AppAssets.imgMapHome,
              alignment: Alignment.center,
              width: 335.setWidth,
              height: 130.setHeight,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              Expanded(
                child: IgnorePointer(
                  ignoring: true,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(context, ChatScreen.route()),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                              ),
                              color: CustomAppColor.of(context).bgAlertDialog),
                          padding: const EdgeInsets.all(11),
                          child: Image.asset(
                            AppAssets.icChat,
                            width: 24.setWidth,
                            height: 24.setHeight,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      InkWell(
                        onTap: () => Navigator.push(context, CallScreen.route()),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              border: Border.all(
                                color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1),
                              ),
                              color: CustomAppColor.of(context).bgAlertDialog),
                          padding: const EdgeInsets.all(11),
                          child: const Icon(Icons.call),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.setWidth),
              Expanded(
                flex: 2,
                child: CommonButton(
                  height: 48.setHeight,
                  buttonTextSize: 16.setFontSize,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.setWidth),
                          child: CommonDialog(
                            titleText: CommonText(
                              text: Languages.of(context).txtConfirmBooking,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.setFontSize,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            descriptionText: CommonText(
                              text: Languages.of(context).txtConfirmBookingDesc,
                              fontSize: 13.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtGray,
                            ),
                            icon: Image.asset(
                              AppAssets.imgThankYou,
                              height: 110.setHeight,
                            ),
                            button: CommonButton(
                              text: Languages.of(context).txtDone,
                              onTap: () {
                                Navigator.pop(dialogContext);
                                // Navigator.push(context, HomeScreen.route(isFromRideBooked: true));
                              },
                              height: 45.setHeight,
                              buttonTextSize: 16.setFontSize,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  text: Languages.of(context).txtRideConfirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
