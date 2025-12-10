import 'package:flutter/material.dart';
import 'package:grokit_app/localization/language/languages.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/widgets/button/common_button.dart';
import 'package:grokit_app/widgets/text_field/text_form_field.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodel/cancel_order_data.dart';

class CancelOrderScreen extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => const CancelOrderScreen());
  }

  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> implements TopBarClickListener {
  final List<CancelReason> _reasons = [
    CancelReason(title: "Waiting For Long Time."),
    CancelReason(title: "Unable To Connect Driver."),
    CancelReason(title: "Driver Denied To Go To Destination."),
    CancelReason(title: "Driver Denied To Go To Pickup."),
    CancelReason(title: "Wrong Address Shown."),
    CancelReason(title: "I Just Want to Cancel."),
  ];

  final TextEditingController _otherReasonController = TextEditingController();

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtCancelOrder,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtCancelOrderDesc,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                        fontFamily: Constant.fontFamilyMedium500,
                      ),
                      SizedBox(height: 10.setHeight),
                      ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          ..._reasons.map((reason) {
                            return CheckboxListTile(
                              dense: true,
                              side: BorderSide(
                                color: CustomAppColor.of(context).txtGray,
                                width: 1.5,
                              ),
                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                              contentPadding: EdgeInsets.zero,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: CommonText(
                                text: reason.title,
                                fontSize: 14.setFontSize,
                                textAlign: TextAlign.start,
                                fontFamily: Constant.fontFamilySemiBold600,
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
                            radius: 12,
                            minLines: 4,
                            titleText: Languages.of(context).txtOtherReason,
                            controller: _otherReasonController,
                            hintText: "Message...",
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
              child: CommonButton(
                height: 45.setHeight,
                text: Languages.of(context).txtCancelOrder,
                borderColor: CustomAppColor.of(context).buttonPrimary,
                buttonColor: CustomAppColor.of(context).buttonPrimary,
                onTap: () {
                  final selectedReasons = _reasons.where((reason) => reason.isSelected).map((e) => e.title).toList();
                  final otherReason = _otherReasonController.text.trim();

                  if (selectedReasons.isEmpty && otherReason.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select or enter a reason.")),
                    );
                    return;
                  }
                  Navigator.of(context).pop('cancelled');
                },
              ),
            )
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
