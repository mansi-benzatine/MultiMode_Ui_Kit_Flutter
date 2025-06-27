import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text_field/text_form_field.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodels/cancel_order_data.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CancelOrderScreen());
  }

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> implements TopBarClickListener {
  int? selectedReasonIndex;
  final TextEditingController _otherReasonController = TextEditingController();

  final List<CancelReason> reasons = [
    CancelReason("Waiting For Long Time."),
    CancelReason("Unable To Connect Driver."),
    CancelReason("Driver Denied To Go To Destination."),
    CancelReason("Driver Denied To Go To Pickup."),
    CancelReason("Wrong Address Shown."),
    CancelReason("I Just Want To Cancel."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
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
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtPleaseSelectReasonForCancelOrder,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      SizedBox(height: 10.setHeight),
                      ...List.generate(reasons.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedReasonIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.setHeight),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: reasons[index].reason,
                                  fontSize: 15.setFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selectedReasonIndex == index
                                          ? CustomAppColor.of(context).primary
                                          : CustomAppColor.of(context).containerBorder,
                                      width: 1,
                                    ),
                                    color: selectedReasonIndex == index ? CustomAppColor.of(context).primary : Colors.transparent,
                                  ),
                                  child: selectedReasonIndex == index ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(height: 12.setHeight),
                      CommonTextFormField(
                        controller: _otherReasonController,
                        hintText: Languages.of(context).txtEnterReason,
                        titleText: Languages.of(context).txtOtherReason,
                        maxLines: 4,
                        minLines: 4,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                onTap: () => Navigator.pop(context),
                text: Languages.of(context).txtCancelOrder.toUpperCase(),
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
