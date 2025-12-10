import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class AddNewCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddNewCardScreen());
  }

  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> implements TopBarClickListener {
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expireDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtAddNewCard,
            isShowBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  CommonTextFormField(
                    radius: 50,
                    titleText: Languages.of(context).txtCardHolderName,
                    controller: cardHolderNameController,
                    hintText: Languages.of(context).txtCardHolderName,
                  ),
                  SizedBox(height: 25.setHeight),
                  CommonTextFormField(
                    radius: 50,
                    titleText: Languages.of(context).txtCardNumber,
                    controller: cardNumberController,
                    hintText: Languages.of(context).txtEnterCardNumber,
                  ),
                  SizedBox(height: 25.setHeight),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CommonTextFormField(
                          radius: 50,
                          titleText: Languages.of(context).txtExpireDate,
                          controller: expireDateController,
                          hintText: Languages.of(context).txtExpireDate,
                        ),
                      ),
                      SizedBox(width: 10.setHeight),
                      Expanded(
                        child: CommonTextFormField(
                          radius: 50,
                          titleText: Languages.of(context).txtCvv,
                          controller: cvvController,
                          hintText: Languages.of(context).txtEnterCvv,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 50.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtAdd,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
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
