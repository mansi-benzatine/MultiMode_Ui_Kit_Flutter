import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/cancel_ride_data.dart';

class CancelRideScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => const CancelRideScreen());
  }

  const CancelRideScreen({super.key});

  @override
  State<CancelRideScreen> createState() => _CancelRideScreenState();
}

class _CancelRideScreenState extends State<CancelRideScreen> implements TopBarClickListener {
  final List<CancelReason> _reasons = [
    CancelReason(title: "Waiting for long time"),
    CancelReason(title: "Unable to contact driver"),
    CancelReason(title: "Driver denied to go to destination"),
    CancelReason(title: "Driver denied to come to pickup"),
    CancelReason(title: "Wrong address shown"),
    CancelReason(title: "The Price is not reasonable"),
    CancelReason(title: "Car condition is not good"),
  ];

  final TextEditingController _otherReasonController = TextEditingController();

/*  void _submitCancellation() {
    final selectedReasons = _reasons
        .where((reason) => reason.isSelected)
        .map((e) => e.title)
        .toList();

    final otherReason = _otherReasonController.text.trim();

    if (selectedReasons.isEmpty && otherReason.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select or enter a reason.")),
      );
      return;
    }
  }*/

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              TopBar(this, title: Languages.of(context).txtCancelRequest),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 14.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtPleaseSelectTheReasonForCancellation,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10.setHeight),
                        ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          children: [
                            ..._reasons.map((reason) {
                              return CheckboxListTile(
                                dense: true,
                                side: BorderSide(color: CustomAppColor.of(context).txtGray, width: 1.5),
                                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                contentPadding: EdgeInsets.zero,
                                controlAffinity: ListTileControlAffinity.leading,
                                title: CommonText(
                                  text: reason.title,
                                  fontSize: 14.setFontSize,
                                  textAlign: TextAlign.start,
                                  fontWeight: FontWeight.w400,
                                  textColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.7),
                                ),
                                value: reason.isSelected,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    reason.isSelected = value ?? false;
                                  });
                                },
                              );
                            }),
                            SizedBox(height: 20.setHeight),
                            CommonTextFormField(
                              maxLines: 4,
                              minLines: 4,
                              titleText: Languages.of(context).txtOtherReason,
                              controller: _otherReasonController,
                              hintText: Languages.of(context).txtEnterYourReason,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
                child: IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtSubmit,
                    onTap: () {
                      final selectedReasons = _reasons.where((reason) => reason.isSelected).map((e) => e.title).toList();
                      final otherReason = _otherReasonController.text.trim();

                      if (selectedReasons.isEmpty && otherReason.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select or enter a reason.")),
                        );
                        return;
                      }
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                            child: CommonDialog(
                              titleText: CommonText(
                                text: "It's sad to see you cancel",
                                fontWeight: FontWeight.w700,
                                fontSize: 24.setFontSize,
                                textColor: CustomAppColor.of(dialogContext).txtBlack,
                              ),
                              descriptionText: CommonText(
                                text: "We will continue to improve our service & satisfy you on the next trip.",
                                fontSize: 13.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(dialogContext).txtGray,
                              ),
                              icon: Image.asset(
                                AppAssets.imgCancelRide,
                                height: 110.setHeight,
                              ),
                              button: CommonButton(
                                text: "Back To Home",
                                onTap: () {
                                  Navigator.of(dialogContext, rootNavigator: true).pop('cancelled');
                                },
                                height: 45.setHeight,
                                buttonTextSize: 16.setFontSize,
                              ),
                            ),
                          );
                        },
                      ).then((result) {
                        if (result == 'cancelled') {
                          Navigator.of(context).pop('cancelled');
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
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
