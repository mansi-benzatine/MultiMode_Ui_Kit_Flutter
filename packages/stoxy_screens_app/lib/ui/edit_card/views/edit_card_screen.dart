import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/preference.dart';
import 'package:stoxy_screens_app_package/utils/service_locator.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/button/common_button.dart';
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
  final TextEditingController cardHolderNAmeController = TextEditingController(text: "Andrew Oliver");
  final TextEditingController cardNumberController = TextEditingController(text: "1234 4567 7890 0123");
  final TextEditingController cardExpiryDateController = TextEditingController(text: "08/25");
  final TextEditingController cvvController = TextEditingController(text: "***");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                ? null
                : DecorationImage(
                    image: AssetImage(AppAssets.imgCommonBackground),
                    fit: BoxFit.fill,
                  ),
          ),
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtEditCard,
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                  child: Column(
                    children: [
                      CommonTextFormField(
                        controller: cardHolderNAmeController,
                        hintText: Languages.of(context).txtEnterCardHolderName,
                        titleText: Languages.of(context).txtCardHolderName,
                      ),
                      SizedBox(
                        height: 20.setHeight,
                      ),
                      CommonTextFormField(
                        controller: cardNumberController,
                        hintText: Languages.of(context).txtEnterCardNumber,
                        titleText: Languages.of(context).txtCardNumber,
                      ),
                      SizedBox(
                        height: 20.setHeight,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CommonTextFormField(
                              controller: cvvController,
                              hintText: Languages.of(context).txtEnterCVV,
                              titleText: Languages.of(context).txtCVV,
                            ),
                          ),
                          SizedBox(
                            width: 10.setWidth,
                          ),
                          Expanded(
                            flex: 2,
                            child: CommonTextFormField(
                              controller: cardExpiryDateController,
                              hintText: Languages.of(context).txtEnterExpiryDate,
                              titleText: Languages.of(context).txtExpiryDate,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.setHeight,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        buttonColor: CustomAppColor.of(context).red.withValues(alpha: 0.2),
                        text: Languages.of(context).txtDelete,
                        buttonTextColor: CustomAppColor.of(context).red,
                        gradient: null,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: CommonButton(
                        text: Languages.of(context).txtUpdate,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
