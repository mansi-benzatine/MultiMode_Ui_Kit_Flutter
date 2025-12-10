import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

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
      body: SafeArea(
        child: Column(
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
                child: CommonButton(
                  onTap: () => Navigator.pop(context),
                  text: Languages.of(context).txtAddCard,
                  borderColor: CustomAppColor.of(context).buttonPrimary,
                  buttonColor: CustomAppColor.of(context).buttonPrimary,
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
