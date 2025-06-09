import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/string_constant.dart';
import '../../app/my_app.dart';
import '../datamodel/track_order_data.dart';

class TrackOrderScreen extends StatelessWidget implements TopBarClickListener {
  const TrackOrderScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const TrackOrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: Column(
          children: [
            TopBar(
              this,
              isShowShadow: false,
              isShowBack: true,
              title: Languages.of(context).trackOrder,
              textColor: CustomAppColor.of(context).txtBlack,
              topBarColor: CustomAppColor.of(context).bgScaffold,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
                      child: _buildOrderDetails(context),
                    ),
                    SizedBox(height: AppSizes.setHeight(26)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
                      child: Divider(
                        color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.3),
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: AppSizes.setHeight(14)),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
                      itemCount: orderTracking.trackingSteps.length,
                      itemBuilder: (context, index) {
                        final step = orderTracking.trackingSteps[index];
                        return _buildTrackingStep(context, step, index, orderTracking.trackingSteps.length);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
                      width: AppSizes.fullWidth,
                      color: CustomAppColor.of(context).bgTopBar,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: AppSizes.setHeight(25)),
                            child: CommonText(
                              text: Languages.of(context).pleaseDontForgetToRate,
                              fontWeight: FontWeight.w700,
                              fontSize: AppSizes.setFontSize(16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                5,
                                (index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(2)),
                                  child: Image.asset(
                                    AppAssets.icGreyStar,
                                    height: AppSizes.setHeight(24),
                                    width: AppSizes.setWidth(24),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            orderTracking.imageUrl,
            height: AppSizes.setHeight(89),
            width: AppSizes.setWidth(89),
          ),
          SizedBox(width: AppSizes.setWidth(15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonText(
                    text: Languages.of(context).orderId,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: orderTracking.orderId,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.setHeight(10)),
              Row(
                children: [
                  CommonText(
                    text: Languages.of(context).deliveryDate,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: orderTracking.deliveryDate,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingStep(BuildContext context, TrackingStep step, int index, int length) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(4), horizontal: AppSizes.setWidth(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(minWidth: AppSizes.setWidth(55)),
                child: step.time.isNotEmpty
                    ? CommonText(
                        text: step.time,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.setFontSize(14),
                      )
                    : const SizedBox(),
              ),
              SizedBox(width: AppSizes.setWidth(30)),
              Column(
                children: [
                  Container(
                    height: AppSizes.setHeight(22),
                    width: AppSizes.setWidth(22),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: step.isCompleted ? CustomAppColor.of(context).green : CustomAppColor.of(context).bgScaffold,
                      border: Border.all(
                          color: step.isCompleted ? CustomAppColor.of(context).green : CustomAppColor.of(context).borderGrey,
                          width: step.isCompleted ? 2 : 1),
                    ),
                    child: step.isCompleted
                        ? Icon(Icons.check, size: AppSizes.setWidth(14), color: CustomAppColor.of(context).icWhite)
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 10),
                  if (index < length - 1)
                    Container(
                      width: AppSizes.setWidth(2),
                      height: AppSizes.setHeight(50),
                      color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.3),
                    ),
                ],
              ),
              SizedBox(width: AppSizes.setWidth(32)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: step.status,
                      fontSize: AppSizes.setFontSize(16),
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: AppSizes.setHeight(8)),
                    CommonText(
                      text: step.description,
                      fontSize: AppSizes.setFontSize(14),
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGrey,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceMyApp.navigatorKey.currentState!.context);
    }
  }
}
