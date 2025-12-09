import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/ui/edit_pill/view/edit_pill_screen.dart';
import 'package:flowly_app/ui/log_symptoms/datamodel/log_symptoms_data.dart';
import 'package:flowly_app/utils/app_assets.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PillsSettingsScreens extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PillsSettingsScreens());
  }

  const PillsSettingsScreens({super.key});

  @override
  State<PillsSettingsScreens> createState() => _PillsSettingsScreensState();
}

class _PillsSettingsScreensState extends State<PillsSettingsScreens> implements TopBarClickListener {
  List<PillLog> pills = [
    PillLog(
      id: "1",
      medicineName: "OC-1",
      time: DateTime(2025, 1, 1, 9, 0),
      numberOfIntakes: 1,
      shapeId: AppAssets.icMedicineRound,
      reminder: true,
    ),
    PillLog(
      id: "2",
      medicineName: "OC-2",
      time: DateTime(2025, 1, 1, 13, 0),
      numberOfIntakes: 2,
      shapeId: AppAssets.icMedicineCapsule, // match your MedicineShape.id

      reminder: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtPillsSettings,
            isShowBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  ...List.generate(
                    pills.length,
                    (index) {
                      final item = pills[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.setHeight),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, EditPillScreen.route(pills: item));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).cardBg,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                                  blurRadius: 24,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).bgScreen,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(
                                    item.shapeId,
                                    width: 22.setWidth,
                                    height: 22.setHeight,
                                  ),
                                ),
                                SizedBox(width: 12.setWidth),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: item.medicineName,
                                        fontFamily: Constant.fontFamilyMulishBold700,
                                        fontSize: 18.setFontSize,
                                      ),
                                      SizedBox(height: 3.setHeight),
                                      CommonText(
                                        text: DateFormat.j().format(item.time),
                                        textColor: CustomAppColor.of(context).txtGray,
                                        fontSize: 13.setFontSize,
                                      ),
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
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
