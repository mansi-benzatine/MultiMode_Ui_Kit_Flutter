import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/cupertino.dart';

class YourBirthdayPage extends StatefulWidget {
  const YourBirthdayPage({super.key});

  @override
  State<YourBirthdayPage> createState() => _YourBirthdayPageState();
}

class _YourBirthdayPageState extends State<YourBirthdayPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 25.setWidth,
        right: 25.setWidth,
        top: 30.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtWhatsYourBirthday,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtWeUseYourBirthdayToTailorHealthGuidanceAndAccuratePeriodTracking,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 100.setHeight),
          SizedBox(
            height: 260.setHeight,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    fontSize: 20.setFontSize,
                    package: "flowly_screens_app",
                    fontFamily: Constant.fontFamilyMulishBold700,
                    color: CustomAppColor.of(context).txtPrimary,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                itemExtent: 50,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
