import 'package:flowly_screens_app/ui/log_symptoms/view/log_symptoms_screen.dart';
import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/button/common_button.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../ui/calendar/view/calendar_screen.dart';
import '../../ui/log_symptoms/datamodel/log_symptoms_data.dart';

class LogDetailsBottomSheet extends StatelessWidget {
  final DailyLog log;
  final String dayStatus;

  const LogDetailsBottomSheet({
    super.key,
    required this.log,
    required this.dayStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScreen,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            CommonText(
              text: DateFormat.yMMMMEEEEd().format(log.date),
              fontSize: 18.setFontSize,
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            SizedBox(height: 12.setHeight),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 4.setHeight),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CommonText(
                text: dayStatus,
                textColor: Colors.pink,
                fontSize: 12,
              ),
            ),
            Divider(
              height: 25.setHeight,
              color: CustomAppColor.of(context).dividerColor,
            ),
            const CommonText(
              text: "Menstrual Flow",
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            SizedBox(height: 6.setHeight),
            Wrap(
              spacing: 8,
              children: log.menstrualFlow
                  .map(
                    (e) => Container(
                      decoration: const BoxDecoration(color: Color(0xFFF5F5F5), shape: BoxShape.circle),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        e,
                        width: 22.setWidth,
                        height: 22.setHeight,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.setHeight),
            const CommonText(
              text: "Mood",
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: log.mood
                  .map(
                    (e) => Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        e,
                        width: 22.setWidth,
                        height: 22.setHeight,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.setHeight),
            const CommonText(
              text: "Symptoms",
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            SizedBox(height: 6.setHeight),
            Wrap(
              spacing: 8,
              children: log.symptoms
                  .map(
                    (e) => Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        e,
                        width: 22.setWidth,
                        height: 22.setHeight,
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.setHeight),
            const CommonText(
              text: "Pill Reminders",
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            SizedBox(height: 16.setHeight),
            ...log.pills.map((p) => _pillTile(context, p)),
            SizedBox(height: 10.setHeight),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: "Edit Log",
                image: AppAssets.icEdit,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    LogSymptomsScreen.route(date: log.date),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pillTile(BuildContext context, PillLog pill) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            offset: const Offset(1, 1),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xFFE9F6F6),
            child: Image.asset(
              pill.shapeId,
              height: 16.setHeight,
              width: 16.setWidth,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: pill.medicineName,
                fontFamily: Constant.fontFamilyMulishBold700,
                fontSize: 14.setFontSize,
              ),
              CommonText(
                text: DateFormat.j().format(pill.time),
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
              ),
            ],
          )
        ],
      ),
    );
  }
}
