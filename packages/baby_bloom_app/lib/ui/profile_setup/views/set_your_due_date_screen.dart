import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/profile_setup/views/date_of_conception_screen.dart';
import 'package:baby_bloom_app/ui/profile_setup/views/estimated_due_date_screen.dart';
import 'package:baby_bloom_app/ui/profile_setup/views/select_your_first_day_of_last_period_screen.dart';
import 'package:baby_bloom_app/ui/profile_setup/views/your_weight_screen.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class SetYourDueDateScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SetYourDueDateScreen());
  }

  const SetYourDueDateScreen({super.key});

  @override
  State<SetYourDueDateScreen> createState() => _SetYourDueDateScreenState();
}

class _SetYourDueDateScreenState extends State<SetYourDueDateScreen> implements TopBarClickListener {
  bool isFirstDayIOfLastPeriodDateSelected = false;
  bool isEstimatedDueDateSelected = false;
  bool isDateOfConceptionSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgProfileSetupBackground,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                TopBar(
                  this,
                  title: Languages.of(context).txtSetYourDueDate,
                  isShowBack: true,
                  appBarColor: CustomAppColor.of(context).transparent,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: _selectDateView(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                  child: CommonButton(
                    text: Languages.of(context).txtContinue,
                    onTap: () => Navigator.push(context, YourWeightScreen.route()),
                  ),
                )
              ],
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

  Widget _selectDateView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtSetYourDueDateDesc,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 24.setHeight),
          Center(
            child: Image.asset(
              AppAssets.imgSetYourDueDate,
              height: 150.setHeight,
              width: 180.setWidth,
            ),
          ),
          SizedBox(height: 24.setHeight),
          CommonButton(
            height: 46.setHeight,
            text: Languages.of(context).txtFirstDayOfLastPeriod,
            buttonColor: isFirstDayIOfLastPeriodDateSelected ? CustomAppColor.of(context).setYourDueDateBtn : CustomAppColor.of(context).setYourDueDateBtn,
            buttonTextColor: isFirstDayIOfLastPeriodDateSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtLightGrey,
            borderColor: isFirstDayIOfLastPeriodDateSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).transparent,
            buttonFontFamily: Constant.fontFamilyMedium500,
            onTap: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectYourFirstDayOfLastPeriodScreen(),
                  ));

              if (result == true) {
                setState(() {
                  isFirstDayIOfLastPeriodDateSelected = true;
                });
              }
            },
          ),
          SizedBox(height: 24.setHeight),
          CommonButton(
            height: 46.setHeight,
            text: Languages.of(context).txtEstimateDueDate,
            buttonColor: isEstimatedDueDateSelected ? CustomAppColor.of(context).setYourDueDateBtn : CustomAppColor.of(context).setYourDueDateBtn,
            borderColor: isEstimatedDueDateSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).transparent,
            buttonTextColor: isEstimatedDueDateSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtLightGrey,
            buttonFontFamily: Constant.fontFamilyMedium500,
            onTap: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EstimatedDueDateScreen(),
                  ));

              if (result == true) {
                setState(() {
                  isEstimatedDueDateSelected = true;
                });
              }
            },
          ),
          SizedBox(height: 24.setHeight),
          CommonButton(
            height: 46.setHeight,
            text: Languages.of(context).txtDateOfConception,
            buttonColor: isDateOfConceptionSelected ? CustomAppColor.of(context).setYourDueDateBtn : CustomAppColor.of(context).setYourDueDateBtn,
            buttonTextColor: isDateOfConceptionSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtLightGrey,
            borderColor: isDateOfConceptionSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).transparent,
            buttonFontFamily: Constant.fontFamilyMedium500,
            onTap: () async {
              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DateOfConceptionScreen(),
                  ));

              if (result == true) {
                setState(() {
                  isDateOfConceptionSelected = true;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
