import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';

class MyWeightScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyWeightScreen());
  }

  const MyWeightScreen({super.key});

  @override
  State<MyWeightScreen> createState() => _MyWeightScreenState();
}

class _MyWeightScreenState extends State<MyWeightScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    final TextEditingController prePregnancyWeightController = TextEditingController();
    final TextEditingController currentWeightController = TextEditingController();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtMyWeight,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextFormField(
                      radius: 48,
                      controller: prePregnancyWeightController,
                      hintText: "KG",
                      titleText: Languages.of(context).txtPrePregnancyWeight,
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonTextFormField(
                      radius: 48,
                      controller: currentWeightController,
                      hintText: "KG",
                      titleText: Languages.of(context).txtCurrentWeight,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 50.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtSave,
                onTap: () => Navigator.pop(context),
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
