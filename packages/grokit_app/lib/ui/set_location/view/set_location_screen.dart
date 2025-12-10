import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:grokit_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_app/localization/language/languages.dart';
import 'package:grokit_app/utils/app_assets.dart';
import 'package:grokit_app/utils/app_color.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/widgets/button/common_button.dart';
import 'package:grokit_app/widgets/text_field/text_form_field.dart';
import 'package:grokit_app/widgets/top_bar/topbar.dart';

import '../../../widgets/text/common_text.dart';

class SetLocationScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SetLocationScreen());
  }

  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> implements TopBarClickListener {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtSelectDeliveryLocation,
              isShowBack: true,
              alignment: Alignment.topLeft,
            ),
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    AppAssets.imgMap,
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 10.setHeight,
                    left: 20.setWidth,
                    right: 20.setWidth,
                    child: CommonTextFormFieldWithPrefix(
                      controller: searchController,
                      hintText: Languages.of(context).txtSearchYourLocation,
                      prefixIcon: AppAssets.icSearch,
                      prefixIconColor: CustomAppColor.of(context).txtBlackGrey,
                      fillColor: CustomAppColor.of(context).bgScreen,
                    ),
                  ),
                  Positioned(
                    bottom: 170.setHeight,
                    right: 92.setWidth,
                    left: 92.setWidth,
                    child: Container(
                      width: 185.setWidth,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.08),
                            offset: const Offset(0, 1),
                            spreadRadius: 2,
                            blurRadius: 0.09,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.setHeight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.icGps,
                            color: CustomAppColor.of(context).buttonPrimary,
                            height: 16.setHeight,
                            width: 16.setWidth,
                          ),
                          SizedBox(width: 6.setWidth),
                          CommonText(
                            text: Languages.of(context).txtUseMyCurrentLocation,
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtPrimary,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        border: Border.all(color: CustomAppColor.of(context).btnBorder.withValues(alpha: 0.2)),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 20.setHeight),
                          _topBarAddress(),
                          SizedBox(height: 20.setHeight),
                          CommonButton(
                            buttonColor: CustomAppColor.of(context).buttonPrimary,
                            borderColor: CustomAppColor.of(context).buttonPrimary,
                            text: Languages.of(context).txtSetLocation,
                            onTap: () => Navigator.pop(context),
                          ),
                          SizedBox(height: 20.setHeight),
                        ],
                      ),
                    ),
                  )
                ],
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

  _topBarAddress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.icLocation,
                  height: 18.setHeight,
                  width: 18.setWidth,
                  color: CustomAppColor.of(context).icBlackWhite,
                ),
                SizedBox(width: 5.setWidth),
                Row(
                  children: [
                    const CommonText(
                      text: "Square Building",
                      fontFamily: Constant.fontFamilyBold700,
                    ),
                    Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 25.setHeight,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 2.setHeight),
            CommonText(
              text: "47 W 13th St, New York, NY 10011, USA ",
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtGray,
            ),
          ],
        ),
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            dashPattern: [5, 2],
            strokeWidth: 0.5,
            padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 6.setHeight),
            radius: const Radius.circular(3),
            color: CustomAppColor.of(context).txtLightGrey,
          ),
          child: CommonText(
            text: "Change",
            fontSize: 12.setFontSize,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtPrimaryWhite,
          ),
        ),
      ],
    );
  }
}
