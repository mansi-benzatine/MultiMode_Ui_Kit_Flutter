import 'package:car_shop_screens_app_package/utils/app_color.dart';
import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../widgets/text/common_text.dart';

class SellCarDetailConfirmationBottomSheet extends StatelessWidget {
  const SellCarDetailConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgBottomSheet,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.setWidth),
              topRight: Radius.circular(20.setWidth),
            ),
          ),
          child: Wrap(
            children: [
              _buildHeader(context),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          IgnorePointer(
            ignoring: true,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgSearchBar,
                  borderRadius: BorderRadius.circular(8.setWidth),
                ),
                height: 30.setHeight,
                width: 30.setWidth,
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 20.setWidth,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtConfirmSellCarDetailMsg,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 30.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              text: Languages.of(context).txtEditDetails,
              buttonTextColor: CustomAppColor.of(context).compareBtnText,
              buttonTextWeight: FontWeight.w500,
              buttonGradient: LinearGradient(colors: [
                CustomAppColor.of(context).transparent,
                CustomAppColor.of(context).transparent,
              ]),
              borderColor: CustomAppColor.of(context).compareBtnBorder,
              width: double.infinity,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 10.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              text: Languages.of(context).txtSubmit,
              onTap: () {
                Navigator.pop(context);
                // Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20.setHeight),
        ],
      ),
    );
  }
}
