import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class EditCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditCardScreen());
  }

  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> implements TopBarClickListener {
  final TextEditingController cardHolderNameController = TextEditingController(text: "Smith Adon");
  final TextEditingController cardNumberController = TextEditingController(text: "1234 5678 9012 3456");
  final TextEditingController expireDateController = TextEditingController(text: "04/25");
  final TextEditingController cvvController = TextEditingController(text: "123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditCard,
              isShowBack: true,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  CommonTextFormField(
                    controller: cardHolderNameController,
                    titleText: Languages.of(context).txtCardHolderName,
                    hintText: Languages.of(context).txtEnterCardHolderName,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonTextFormField(
                    controller: cardNumberController,
                    titleText: Languages.of(context).txtCardNumber,
                    hintText: Languages.of(context).txtEnterCardNumber,
                  ),
                  SizedBox(height: 15.setHeight),
                  Row(
                    children: [
                      Expanded(
                        child: CommonTextFormField(
                          controller: expireDateController,
                          titleText: Languages.of(context).txtExpireDate,
                          hintText: Languages.of(context).txtEnterExpireDate,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      Expanded(
                        child: CommonTextFormField(
                          controller: expireDateController,
                          titleText: Languages.of(context).txtExpireDate,
                          hintText: Languages.of(context).txtEnterExpireDate,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        onTap: () => Navigator.pop(context),
                        text: Languages.of(context).txtDelete,
                        borderColor: CustomAppColor.of(context).borderTextFormField,
                        buttonColor: CustomAppColor.of(context).unselectedCard,
                        buttonTextColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    SizedBox(width: 15.setWidth),
                    Expanded(
                      child: CommonButton(
                        onTap: () => Navigator.pop(context),
                        text: Languages.of(context).txtUpdate,
                        borderColor: CustomAppColor.of(context).buttonPrimary,
                        buttonColor: CustomAppColor.of(context).buttonPrimary,
                      ),
                    ),
                  ],
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
