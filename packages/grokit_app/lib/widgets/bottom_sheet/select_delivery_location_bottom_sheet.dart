import 'package:flutter/material.dart';
import 'package:grokit_app/ui/set_location/view/set_location_screen.dart';
import 'package:grokit_app/utils/app_assets.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/widgets/text/common_text.dart';
import 'package:grokit_app/widgets/text_field/text_form_field.dart';

import '../../utils/app_color.dart';
import '../button/common_button.dart';

class SelectDeliveryLocationBottomSheet extends StatelessWidget {
  const SelectDeliveryLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: "Select Delivery Location",
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyBold700,
            ),
            SizedBox(height: 20.setHeight),
            CommonTextFormFieldWithPrefix(
              prefixIconColor: CustomAppColor.of(context).txtBlackGrey,
              controller: searchController,
              hintText: "Search Your Location",
              prefixIcon: AppAssets.icSearch,
            ),
            SizedBox(height: 20.setHeight),
            CommonButton(
              image: AppAssets.icGps,
              alignment: Alignment.topLeft,
              height: 40.setHeight,
              text: "Detect My Location",
              borderColor: CustomAppColor.of(context).borderPrimary,
              buttonColor: CustomAppColor.of(context).buttonPrimary,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, SetLocationScreen.route());
              },
            ),
          ],
        ),
      ),
    );
  }
}
