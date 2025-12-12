import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../widgets/text/common_text.dart';
import '../../notification_popup/view/notification_popup_screen.dart';

class AddMedicineScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddMedicineScreen());
  }

  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> implements TopBarClickListener {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController setTime = TextEditingController();
  ValueNotifier<bool> isReminder = ValueNotifier(false);
  final List<String> weekDays = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
  late List<bool> selectedDays;

  @override
  void initState() {
    super.initState();
    selectedDays = List<bool>.filled(weekDays.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtAddMedicine,
            isShowBack: true,
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
                      controller: medicineNameController,
                      hintText: Languages.of(context).txtEnterYourMedicineName,
                      titleText: Languages.of(context).txtMedicineName,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      radius: 48,
                      controller: setTime,
                      hintText: Languages.of(context).txtSetYourTime,
                      titleText: Languages.of(context).txtSetTime,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtMedicineDays,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constant.fontFamilyMedium500,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 15.setHeight),
                    Row(
                      children: weekDays.asMap().entries.map((entry) {
                        final dayIndex = entry.key;
                        final day = entry.value;
                        final bool isSelected = selectedDays[dayIndex];

                        return Padding(
                          padding: EdgeInsets.only(right: 7.setWidth),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDays[dayIndex] = !isSelected;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 34.setHeight,
                              width: 34.setWidth,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).bgScreen,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtLightGrey,
                                  width: 1,
                                ),
                              ),
                              child: CommonText(
                                text: day,
                                height: 0,
                                textColor: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGrey,
                                fontSize: 16.setFontSize,
                                fontFamily: isSelected ? Constant.fontFamilySemiBold600 : Constant.fontFamilyMedium500,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20.setHeight),
                    ValueListenableBuilder(
                      valueListenable: isReminder,
                      builder: (context, value, child) {
                        return Row(
                          children: [
                            FlutterSwitch(
                              value: value,
                              onToggle: (bool newValue) {
                                setState(() {
                                  isReminder.value = newValue;
                                });
                              },
                              activeColor: Colors.green,
                              inactiveColor: CustomAppColor.of(context).grey,
                              activeToggleColor: CustomAppColor.of(context).white,
                              inactiveToggleColor: CustomAppColor.of(context).white,
                              width: 40.setWidth,
                              height: 22.setHeight,
                              toggleSize: 16.0,
                              borderRadius: 16.0,
                              padding: 2.5,
                            ),
                            SizedBox(width: 10.setWidth),
                            CommonText(
                              text: Languages.of(context).txtReminder.replaceAll("s", ""),
                              fontSize: 14.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 15.setHeight),
                    GestureDetector(
                      onTap: () => Navigator.push(context, NotificationPopupScreen.route()),
                      child: CommonText(
                        text: "*  Preview reminder screen",
                        fontSize: 12.setFontSize,
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 50.setHeight),
            child: CommonButton(
              text: Languages.of(context).txtAddMedicine,
              onTap: () => Navigator.pop(context),
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
