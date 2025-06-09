import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../ui/order_summary/views/order_summary_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../app/my_app.dart';

class AddDeliveryAddressScreen extends StatelessWidget implements TopBarClickListener {
  const AddDeliveryAddressScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const AddDeliveryAddressScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                isShowBack: true,
                title: Languages.of(context).addDeliveryAddress,
                textColor: CustomAppColor.of(context).txtBlack,
                topBarColor: CustomAppColor.of(context).bgTopBar,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(22)),
                      child: CommonText(
                        text: Languages.of(context).orderWillBeDeliveredAtThisAddress,
                        fontSize: AppSizes.setFontSize(15),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    _detailsFields(context),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _yourDetails(context),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgBlackWhiteScaffold,
                border: Border(
                  top: BorderSide(
                    color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5),
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(22)),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  height: AppSizes.setHeight(44),
                  radius: 3,
                  onTap: () => Navigator.push(context, OrderSummaryScreen.route()),
                  child: CommonText(
                    text: Languages.of(context).saveAddressAndContinue,
                    fontSize: AppSizes.setFontSize(14),
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsFields(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(18)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        children: [
          CommonTextFormField(
            hintText: Languages.of(context).name,
            radius: 8,
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
            child: Row(
              children: [
                Expanded(
                  child: CommonTextFormField(
                    hintText: "  +91",
                    hintStyle: TextStyle(color: CustomAppColor.of(context).txtBlack),
                    radius: 8,
                  ),
                ),
                SizedBox(width: AppSizes.setWidth(12)),
                Expanded(
                  flex: 4,
                  child: CommonTextFormField(
                    hintText: Languages.of(context).phoneNumber,
                    radius: 8,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
            child: CommonTextFormField(
              hintText: Languages.of(context).flatHouseNo,
              radius: 8,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
            child: CommonTextFormField(
              hintText: Languages.of(context).streetColony,
              radius: 8,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
            child: CommonTextFormField(
              hintText: Languages.of(context).pinCode,
              radius: 8,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
            child: Row(
              children: [
                Expanded(
                  child: CommonTextFormField(
                    hintText: Languages.of(context).city,
                    radius: 8,
                  ),
                ),
                SizedBox(width: AppSizes.setWidth(12)),
                Expanded(
                  child: CommonTextFormField(
                    hintText: Languages.of(context).state,
                    radius: 8,
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                      child: Image.asset(
                        AppAssets.icDownArrow,
                        height: AppSizes.setHeight(7),
                        width: AppSizes.setWidth(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
            child: CommonTextFormField(
              hintText: Languages.of(context).landmark,
              radius: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _yourDetails(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(18)),
        color: CustomAppColor.of(context).bgScaffold,
        child: Column(
          children: [
            Row(
              children: [
                CommonText(
                  text: Languages.of(context).yourDetails,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(width: AppSizes.setWidth(6)),
                Icon(
                  Icons.info_outline,
                  size: 15,
                  color: CustomAppColor.of(context).txtGrey,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                      activeColor: CustomAppColor.of(context).icPurple,
                      side: BorderSide(color: CustomAppColor.of(context).txtGrey),
                      visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
                    ),
                  ),
                  SizedBox(width: AppSizes.setWidth(6)),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).sameAsAboveDetails,
                      textAlign: TextAlign.start,
                      fontSize: AppSizes.setFontSize(12),
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            CommonTextFormField(
              hintText: Languages.of(context).yourName,
              radius: 8,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(24)),
              child: CommonTextFormField(
                hintText: Languages.of(context).state,
                radius: 8,
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                  child: Image.asset(
                    AppAssets.icDownArrow,
                    height: AppSizes.setHeight(7),
                    width: AppSizes.setWidth(14),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context);
    }
  }
}
