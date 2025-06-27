import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class AddAddressScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const AddAddressScreen(),
    );
  }

  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController houseNoController = TextEditingController();
    final TextEditingController landmarkController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppAssets.imgSetAddressLocation,
                fit: BoxFit.cover,
              ),
            ),
            AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 26.setHeight),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScaffold,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtSelectDeliveryLocation.toUpperCase(),
                          textColor: CustomAppColor.of(context).txtGrey,
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                        SizedBox(height: 25.setHeight),
                        CommonTextFormField(
                          controller: houseNoController,
                          hintText: Languages.of(context).txtEnterHouseFlatBlockNo,
                          titleText: Languages.of(context).txtHouseFlatBlockNo,
                        ),
                        SizedBox(height: 22.setHeight),
                        CommonTextFormField(
                          controller: landmarkController,
                          hintText: Languages.of(context).txtEnterLandmark,
                          titleText: Languages.of(context).txtLandmark,
                        ),
                        SizedBox(height: 24.setHeight),
                        IgnorePointer(
                          ignoring: true,
                          child: CommonButton(
                            text: Languages.of(context).txtAddAddress.toUpperCase(),
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                        SizedBox(height: 5.setHeight),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.setWidth,
              top: 64.setHeight,
              child: IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13.setWidth, vertical: 12.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.asset(
                      AppAssets.icClose,
                      height: 13.setHeight,
                      width: 13.setWidth,
                      color: const Color(0xFF021713),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
