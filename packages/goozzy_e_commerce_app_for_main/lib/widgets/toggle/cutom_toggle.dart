import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  ToggleButtonWidgetState createState() => ToggleButtonWidgetState();
}

class ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  bool isEmailSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
      width: AppSizes.setWidth(281),
      height: AppSizes.setHeight(48),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).btnPurple.withOpacityPercent(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEmailSelected = true;
                });
              },
              child: Container(
                width: AppSizes.setWidth(134),
                height: AppSizes.setHeight(36),
                decoration: BoxDecoration(
                  color: isEmailSelected ? CustomAppColor.of(context).btnPurple : CustomAppColor.of(context).transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: CommonText(
                  text: Languages.of(context).eMail,
                  textColor: isEmailSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // Mobile Number Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isEmailSelected = false;
                });
              },
              child: Container(
                width: AppSizes.setWidth(134),
                height: AppSizes.setHeight(36),
                decoration: BoxDecoration(
                  color: !isEmailSelected ? const Color(0xFF7A58FF) : Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: CommonText(
                  text: Languages.of(context).mobileNumber,
                  textColor: isEmailSelected ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).txtWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
