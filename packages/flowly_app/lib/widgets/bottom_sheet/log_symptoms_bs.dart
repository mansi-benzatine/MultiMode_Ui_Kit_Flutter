import 'package:flowly_app/ui/log_symptoms/view/log_symptoms_screen.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogSymptomsBs extends StatelessWidget {
  final DateTime date;

  const LogSymptomsBs({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.setHeight),
            Center(
              child: Container(
                height: 4.setHeight,
                width: 40.setWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFFDDDDDD),
                ),
              ),
            ),
            SizedBox(height: 18.setHeight),
            CommonText(
              text: DateFormat.MMMMEEEEd().format(date).toString(),
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            SizedBox(height: 14.setHeight),
            const Divider(thickness: 0.5),
            SizedBox(height: 24.setHeight),
            CommonButton(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, LogSymptomsScreen.route(date: date));
              },
              text: "Log Symptoms",
              buttonColor: CustomAppColor.of(context).transparent,
              buttonTextColor: CustomAppColor.of(context).primary,
            ),
            SizedBox(height: 24.setHeight),
          ],
        ),
      ),
    );
  }
}
