import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/text_field/text_form_field.dart';

class EditCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditCardScreen());
  }

  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> implements TopBarClickListener {
  final TextEditingController cardNumberController = TextEditingController(text: "1 2 3 4   5 6 7 7   9 1 2 2   2 3 2 3");
  final TextEditingController cardHolderNameController = TextEditingController(text: "Kelly Oliver");
  final TextEditingController cvvController = TextEditingController(text: "123");
  final TextEditingController expireDateController = TextEditingController(text: "08/25");

  @override
  void initState() {
    super.initState();
    cardNumberController.addListener(() => setState(() {}));
    cardHolderNameController.addListener(() => setState(() {}));
    cvvController.addListener(() => setState(() {}));
    expireDateController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtMyWallet,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              AppAssets.imgCardView,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 80.setHeight,
                            left: 20.setWidth,
                            child: CommonText(
                              text: cardNumberController.text.isEmpty ? "* * * *    * * * *    * * * *    1 2 3 4" : cardNumberController.text,
                              textColor: CustomAppColor.of(context).white,
                              fontSize: 22.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ),
                          Positioned(
                            bottom: 30.setHeight,
                            left: 20.setWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Card Holder Name",
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 13.setFontSize,
                                  fontFamily: Constant.fontFamilyRegular400,
                                ),
                                CommonText(
                                  text: cardHolderNameController.text.isEmpty ? "CARD HOLDER" : cardHolderNameController.text.toUpperCase(),
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium500,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 30.setHeight,
                            right: 20.setWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Expire",
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 13.setFontSize,
                                  fontFamily: Constant.fontFamilyRegular400,
                                ),
                                CommonText(
                                  text: expireDateController.text.isEmpty ? "MM/YY" : expireDateController.text,
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: cardHolderNameController,
                        hintText: Languages.of(context).txtEnterCardHolderName,
                        titleText: Languages.of(context).txtCardHolderName,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        hintText: Languages.of(context).txtEnterCardNumber,
                        titleText: Languages.of(context).txtCardNumber,
                      ),
                      SizedBox(height: 20.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: CommonTextFormField(
                              controller: cvvController,
                              keyboardType: TextInputType.number,
                              hintText: Languages.of(context).txtEnterCvv,
                              titleText: Languages.of(context).txtCvv,
                            ),
                          ),
                          SizedBox(width: 16.setWidth),
                          Expanded(
                            flex: 2,
                            child: CommonTextFormField(
                              controller: expireDateController,
                              keyboardType: TextInputType.number,
                              hintText: Languages.of(context).txtEnterCardExpireDate,
                              titleText: Languages.of(context).txtExpireDate,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 22.setWidth),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtDelete,
                      buttonColor: CustomAppColor.of(context).transparent,
                      borderColor: CustomAppColor.of(context).red,
                      buttonTextColor: CustomAppColor.of(context).red,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtUpdate,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
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
}
