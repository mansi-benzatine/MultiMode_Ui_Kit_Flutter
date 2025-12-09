import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/ui/add_note/view/add_note_screen.dart';
import 'package:flowly_app/ui/add_pill/view/add_pill_screen.dart';
import 'package:flowly_app/ui/edit_note/view/edit_note_screen.dart';
import 'package:flowly_app/ui/pills_settings/view/pills_settings_screens.dart';
import 'package:flowly_app/utils/app_assets.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/text_field/text_form_field.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../datamodel/log_symptoms_data.dart';

class LogSymptomsScreen extends StatefulWidget {
  final DateTime date;

  static Route<void> route({required DateTime date}) {
    return MaterialPageRoute(builder: (_) => LogSymptomsScreen(date: date));
  }

  const LogSymptomsScreen({super.key, required this.date});

  @override
  State<LogSymptomsScreen> createState() => _LogSymptomsScreenState();
}

class _LogSymptomsScreenState extends State<LogSymptomsScreen> implements TopBarClickListener {
  List<TrackerTag> menstrualFlowList = [];
  List<TrackerTag> moodList = [];
  List<TrackerTag> symptomList = [];
  List<TrackerTag> dischargeList = [];
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
      shapeId: AppAssets.icMedicineCapsule,
      reminder: false,
    ),
  ];

  final DailyHealthLog log = DailyHealthLog(date: DateTime.now());

  final weightController = TextEditingController();
  final noteController = TextEditingController();

  void fillData() {
    menstrualFlowList = [
      TrackerTag(id: "low", title: "Low", icon: AppAssets.icLowMenstrualFlow),
      TrackerTag(id: "medium", title: "Medium", icon: AppAssets.icMediumMenstrualFlow),
      TrackerTag(id: "high", title: "High", icon: AppAssets.icHighMenstrualFlow),
    ];
    moodList = [
      TrackerTag(id: "calm", title: "Calm", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "happy", title: "Happy", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "energetic", title: "Energetic", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "frisky", title: "Frisky", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "mood_swing", title: "Mood swing", icon: AppAssets.icMoodSwingEmoji),
      TrackerTag(id: "anxious", title: "Anxious", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "sad", title: "Sad", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "angry", title: "Angry", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "depressed", title: "Depressed", icon: AppAssets.icClamEmoji),
      TrackerTag(id: "tired", title: "Tired", icon: AppAssets.icTiredEmoji),
      TrackerTag(id: "irritated", title: "Irritated", icon: AppAssets.icIrritatedEmoji),
    ];
    symptomList = [
      TrackerTag(id: "fine", title: "Fine", icon: AppAssets.icCravingSymptoms),
      TrackerTag(id: "cramps", title: "Cramps", icon: AppAssets.icCravingSymptoms),
      TrackerTag(id: "headache", title: "Headache", icon: AppAssets.icHeadacheSymptoms),
      TrackerTag(id: "backache", title: "Backache", icon: AppAssets.icBackacheSymptoms),
      TrackerTag(id: "cravings", title: "Cravings", icon: AppAssets.icCravingSymptoms),
      TrackerTag(id: "fatigue", title: "Fatigue", icon: AppAssets.icFatigueSymptoms),
      TrackerTag(id: "abdominal_pain", title: "Abdominal pain", icon: AppAssets.icCravingSymptoms),
      TrackerTag(id: "vaginal_itching", title: "Vaginal itching", icon: AppAssets.icVaginalItchingSymptoms),
      TrackerTag(id: "oversleep", title: "Over sleep", icon: AppAssets.icOverSleepSymptoms),
      TrackerTag(id: "nausea", title: "Nausea", icon: AppAssets.icNauseaSymptoms),
      TrackerTag(id: "diarrhea", title: "Diarrhea", icon: AppAssets.icDiarrheasSymptoms),
    ];
    dischargeList = [
      TrackerTag(id: "no_discharge", title: "No discharge", icon: AppAssets.icNoDischarge),
      TrackerTag(id: "watery", title: "Watery", icon: AppAssets.icWateryDischarge),
      TrackerTag(id: "creamy", title: "Creamy", icon: AppAssets.icCreamyDischarge),
      TrackerTag(id: "sticky", title: "Sticky", icon: AppAssets.icStickyDischarge),
      TrackerTag(id: "egg_white", title: "Egg white", icon: AppAssets.icEggWhiteDischarge),
      TrackerTag(id: "unusual", title: "Unusual", icon: AppAssets.icUnusualDischarge),
      TrackerTag(id: "clumpy", title: "Clumpy", icon: AppAssets.icClumpyDischarge),
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: DateFormat.MMMMEEEEd().format(widget.date).toString(),
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 24,
                          spreadRadius: 1,
                        ),
                      ],
                      color: CustomAppColor.of(context).cardBg,
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(Languages.of(context).txtMenstrualFlow),
                        SizedBox(height: 10.setHeight),
                        Wrap(
                          spacing: 10,
                          children: menstrualFlowList.map((tag) {
                            return TagChip(
                              color: const Color(0xFFFD8599),
                              tag: tag,
                              onTap: () {
                                setState(() {
                                  for (var t in menstrualFlowList) {
                                    t.isSelected = false;
                                  }
                                  tag.isSelected = true;
                                  log.menstrualFlow = tag.id;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.setHeight),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 24,
                          spreadRadius: 1,
                        ),
                      ],
                      color: CustomAppColor.of(context).cardBg,
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(Languages.of(context).txtMood),
                        SizedBox(height: 10.setHeight),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: moodList.map((tag) {
                            return TagChip(
                                color: const Color(0xFFF3D71A),
                                tag: tag,
                                onTap: () {
                                  setState(() {
                                    tag.isSelected = !tag.isSelected; // toggle
                                  });
                                });
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.setHeight),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 24,
                          spreadRadius: 1,
                        ),
                      ],
                      color: CustomAppColor.of(context).cardBg,
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(Languages.of(context).txtSymptoms),
                        SizedBox(height: 10.setHeight),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: symptomList.map((tag) {
                            return TagChip(
                                color: const Color(0xFF43DF5B),
                                tag: tag,
                                onTap: () {
                                  setState(() {
                                    tag.isSelected = !tag.isSelected; // toggle
                                  });
                                });
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.setHeight),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 24,
                          spreadRadius: 1,
                        ),
                      ],
                      color: CustomAppColor.of(context).cardBg,
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(Languages.of(context).txtDischarge),
                        SizedBox(height: 10.setHeight),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: dischargeList.map((tag) {
                            return TagChip(
                                color: const Color(0xFF9267E4),
                                tag: tag,
                                onTap: () {
                                  setState(() {
                                    tag.isSelected = !tag.isSelected; // toggle
                                  });
                                });
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.setHeight),
                  pillsSection(),
                  SizedBox(height: 18.setHeight),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 24,
                          spreadRadius: 1,
                        ),
                      ],
                      color: CustomAppColor.of(context).cardBg,
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(Languages.of(context).txtAddWeight),
                        SizedBox(height: 10.setHeight),
                        CommonTextFormField(
                          controller: weightController,
                          hintText: Languages.of(context).txtAddYourCurrentWeight,
                          fillColor: CustomAppColor.of(context).cardBg,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.setHeight),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          offset: const Offset(1, 1),
                          blurRadius: 24,
                          spreadRadius: 1,
                        ),
                      ],
                      color: CustomAppColor.of(context).cardBg,
                    ),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle(Languages.of(context).txtNote),
                        SizedBox(height: 10.setHeight),
                        CommonTextFormField(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => noteController.text.isNotEmpty
                                    ? EditNoteScreen(
                                        noteController: noteController,
                                      )
                                    : const AddNoteScreen(),
                              ),
                            );

                            if (result != null && result is String) {
                              noteController.text = result;
                            }
                          },
                          controller: noteController,
                          hintText: Languages.of(context).txtAddANote,
                          fillColor: CustomAppColor.of(context).cardBg,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 55.setHeight,
              top: 20.setHeight,
            ),
            child: CommonButton(
              text: Languages.of(context).txtApply,
              onTap: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
      child: CommonText(
        text: title,
        fontFamily: Constant.fontFamilyMulishSemiBold600,
      ),
    );
  }

  void updateList(TrackerTag tag, List<String> list) {
    if (tag.isSelected) {
      if (!list.contains(tag.id)) list.add(tag.id);
    } else {
      list.remove(tag.id);
    }
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  Widget pillsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
        color: CustomAppColor.of(context).cardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtPills,
            fontFamily: Constant.fontFamilyMulishSemiBold600,
          ),
          SizedBox(height: 12.setHeight),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, AddPillScreen.route());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 5.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: CustomAppColor.of(context).pillBg,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).cardBg,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xFF4AB4BB),
                        ),
                      ),
                      SizedBox(width: 6.setWidth),
                      CommonText(
                        text: "Add medicine",
                        fontFamily: Constant.fontFamilyMulishMedium500,
                        fontSize: 12.setFontSize,
                      ),
                    ],
                  ),
                ),
              ),
              ...pills.map((pill) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 6.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFF4AB4BB),
                      width: 1.5,
                    ),
                    color: CustomAppColor.of(context).pillBg,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).cardBg,
                        ),
                        child: Image.asset(
                          pill.shapeId,
                          height: 14.setHeight,
                        ),
                      ),
                      SizedBox(width: 6.setWidth),
                      CommonText(
                        text: "${pill.medicineName}: ${DateFormat.jm().format(pill.time)}",
                        fontFamily: Constant.fontFamilyMulishMedium500,
                        fontSize: 12.setFontSize,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
          Divider(height: 30.setHeight),
          GestureDetector(
            onTap: () {
              Navigator.push(context, PillsSettingsScreens.route());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtPillsSettings,
                  fontFamily: Constant.fontFamilyMulishSemiBold600,
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  final TrackerTag tag;
  final VoidCallback onTap;
  final Color color;

  const TagChip({
    super.key,
    required this.tag,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = tag.isSelected;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 6.setHeight),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(tag.icon, height: 20),
              SizedBox(width: 6.setWidth),
              CommonText(
                text: tag.title,
                fontFamily: Constant.fontFamilyMulishMedium500,
                fontSize: 12.setFontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
