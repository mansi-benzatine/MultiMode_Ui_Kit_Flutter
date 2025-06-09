import 'package:chat_ai_app_package/utils/app_assets.dart';
import 'package:chat_ai_app_package/utils/app_color.dart';
import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_app_package/widgets/button/common_button.dart';
import 'package:chat_ai_app_package/widgets/text/common_text.dart';
import 'package:chat_ai_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';

class AddNewCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AddNewCardScreen());
  }

  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtAddNewCard,
              isShowBack: true,
            ),
            SizedBox(height: 15.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: const Column(
                    children: [AddNewCardView()],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton(
                  text: Languages.of(context).txtAdd,
                  onTap: () => Navigator.pop(context),
                ),
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

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 26.setWidth, vertical: 20.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(AppAssets.imgBgCard),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Current Balance",
                        fontWeight: FontWeight.w700,
                        fontSize: 14.setFontSize,
                      ),
                      CommonText(
                        text: "\$4,570,80",
                        fontWeight: FontWeight.w600,
                        fontSize: 30.setFontSize,
                      ),
                    ],
                  ),
                  Image.asset(
                    AppAssets.icMastercard,
                    width: 55.setWidth,
                    height: 44.setHeight,
                  )
                ],
              ),
              SizedBox(height: 70.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "5294 2436 4780 2468",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.setFontSize,
                  ),
                  CommonText(
                    text: "12/24",
                    fontWeight: FontWeight.w600,
                    fontSize: 14.setFontSize,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          titleText: Languages.of(context).txtCardName,
          hintText: Languages.of(context).txtEnterYourCardName,
          prefixIcon: "",
        ),
        SizedBox(height: 30.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          titleText: Languages.of(context).txtCardNumber,
          hintText: Languages.of(context).txtEnterYourCardNumber,
          prefixIcon: "",
        ),
        SizedBox(height: 30.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          titleText: Languages.of(context).txtExpireCard,
          hintText: "Enter Expiry Date",
          prefixIcon: "",
        ),
        SizedBox(height: 30.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          titleText: Languages.of(context).txtCVV,
          hintText: Languages.of(context).txtEnterCVV,
          prefixIcon: "",
        ),
      ],
    );
  }
}
