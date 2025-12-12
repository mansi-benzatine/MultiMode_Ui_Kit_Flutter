import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/alert_dialog/dose_complete_alert_dialog.dart';
import 'package:baby_bloom_screens_app/widgets/alert_dialog/dose_missing_alert_dialog.dart';
import 'package:baby_bloom_screens_app/widgets/alert_dialog/dose_upcoming_alert_dialog.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:gradient_progress_bar/gradient_progress_bar.dart';

import '../datamodel/vaccination_data.dart';

class VaccinationScreen extends StatefulWidget {
  final int currentAlertIndex;

  static Route<void> route({int currentAlertIndex = 0}) {
    return MaterialPageRoute(
      builder: (_) => VaccinationScreen(currentAlertIndex: currentAlertIndex),
    );
  }

  const VaccinationScreen({super.key, this.currentAlertIndex = 0});

  @override
  State<VaccinationScreen> createState() => _VaccinationScreenState();
}

class _VaccinationScreenState extends State<VaccinationScreen> implements TopBarClickListener {
  late double indicatorProgress;
  final List<VaccineGroup> vaccineSchedule = [
    VaccineGroup(
      title: "At Birth",
      vaccines: [
        Vaccine(
          name: "BCG",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.completed,
        ),
        Vaccine(
          name: "HepB (1st dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.completed,
        ),
      ],
    ),
    VaccineGroup(
      title: "6 Weeks",
      vaccines: [
        Vaccine(
          name: "OPV (1st dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.completed,
        ),
        Vaccine(
          name: "DTP (1st dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.missed,
        ),
      ],
    ),
    VaccineGroup(
      title: "10 Weeks",
      vaccines: [
        Vaccine(
          name: "OPV (2nd dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.upcoming,
        ),
        Vaccine(
          name: "DTP (2nd dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.upcoming,
        ),
      ],
    ),
    VaccineGroup(
      title: "14 Weeks",
      vaccines: [
        Vaccine(
          name: "OPV (3rd dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.upcoming,
        ),
        Vaccine(
          name: "DTP (3rd dose)",
          completedDate: "Completed on 15 July 2025",
          status: VaccineStatus.upcoming,
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    indicatorProgress = 0.4;

    if (widget.currentAlertIndex == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const DoseCompleteAlertDialog());
          },
        );
      });
    }
    if (widget.currentAlertIndex == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const DoseMissingAlertDialog());
          },
        );
      });
    }
    if (widget.currentAlertIndex == 2) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (dialogContext) {
            return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const DoseUpcomingAlertDialog());
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgProfileSetupBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              TopBar(
                this,
                appBarColor: CustomAppColor.of(context).transparent,
                title: Languages.of(context).txtVaccination,
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vaccinationProgressView(),
                        vaccinationListView(),
                      ],
                    ),
                  ),
                ),
              )
            ],
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

  Widget vaccinationProgressView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).roundBg,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 16.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtVaccinationProgress,
            fontFamily: Constant.fontFamilySemiBold600,
            fontSize: 18.setFontSize,
          ),
          CommonText(
            text: Languages.of(context).txtVaccinationProgressDesc,
            fontFamily: Constant.fontFamilySemiBold600,
            textColor: CustomAppColor.of(context).txtLightGrey,
            fontSize: 12.setFontSize,
          ),
          SizedBox(height: 15.setHeight),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: indicatorProgress),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return SizedBox(
                height: 6.setHeight,
                child: GradientProgressIndicator(
                  const [
                    Color(0xffF68270),
                    Color(0xffe89dbf),
                    Color(0xffF1C358),
                    Color(0xffEFDE62),
                    Color(0xffE5F3BE),
                    Color(0xffCDE8F1),
                    Color(0xffF2E0F9),
                  ],
                  value,
                ),
              );
            },
          ),
          SizedBox(height: 15.setHeight),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFF0FDF4),
                  ),
                  child: Column(
                    children: [
                      CommonText(
                        text: "3",
                        textColor: const Color(0xFF0FA251),
                        fontFamily: Constant.fontFamilySemiBold600,
                        fontSize: 24.setFontSize,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtCompleted,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: const Color(0xFF0FA251),
                        fontSize: 12.setFontSize,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFFFFEEB),
                  ),
                  child: Column(
                    children: [
                      CommonText(
                        text: "4",
                        textColor: const Color(0xFFE89C1B),
                        fontFamily: Constant.fontFamilySemiBold600,
                        fontSize: 24.setFontSize,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtUpcoming,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: const Color(0xFFE89C1B),
                        fontSize: 12.setFontSize,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFFFECEC),
                  ),
                  child: Column(
                    children: [
                      CommonText(
                        text: "1",
                        textColor: const Color(0xFFFF584E),
                        fontFamily: Constant.fontFamilySemiBold600,
                        fontSize: 24.setFontSize,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtMissed,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: const Color(0xFFFF584E),
                        fontSize: 12.setFontSize,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color _getStatusColor(VaccineStatus status) {
    switch (status) {
      case VaccineStatus.completed:
        return Colors.green;
      case VaccineStatus.missed:
        return Colors.red;
      case VaccineStatus.upcoming:
        return const Color(0xFFC88D28);
    }
  }

  String _getStatusText(VaccineStatus status) {
    switch (status) {
      case VaccineStatus.completed:
        return "Completed";
      case VaccineStatus.missed:
        return "Missed";
      case VaccineStatus.upcoming:
        return "Upcoming";
    }
  }

  IconData _getStatusIcon(VaccineStatus status) {
    switch (status) {
      case VaccineStatus.completed:
        return Icons.check_circle_outline;
      case VaccineStatus.missed:
        return Icons.block_flipped;
      case VaccineStatus.upcoming:
        return Icons.watch_later_outlined;
    }
  }

  Widget vaccinationListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vaccineSchedule.length,
      itemBuilder: (context, index) {
        final group = vaccineSchedule[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: CustomAppColor.of(context).border,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: CustomAppColor.of(context).secondary, size: 18),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: group.title,
                      fontFamily: Constant.fontFamilyMedium500,
                    ),
                  ],
                ),
                SizedBox(height: 8.setHeight),
                Column(
                  children: List.generate(
                    group.vaccines.length,
                    (i) {
                      final vaccine = group.vaccines[i];
                      final isLast = i == group.vaccines.length - 1;

                      return Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: isLast
                              ? null
                              : Border(
                                  bottom: BorderSide(
                                    color: CustomAppColor.of(context).border,
                                    width: 0.5,
                                  ),
                                ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: vaccine.name,
                                  fontFamily: Constant.fontFamilyMedium500,
                                  fontSize: 16.setFontSize,
                                ),
                                SizedBox(height: 4.setHeight),
                                CommonText(
                                  text: vaccine.completedDate,
                                  fontSize: 13.setFontSize,
                                  textColor: CustomAppColor.of(context).txtLightGrey,
                                ),
                              ],
                            ),
                            IgnorePointer(
                              ignoring: true,
                              child: GestureDetector(
                                onTap: () {
                                  if (vaccine.status == VaccineStatus.completed) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const DoseCompleteAlertDialog();
                                      },
                                    );
                                  } else if (vaccine.status == VaccineStatus.missed) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const DoseMissingAlertDialog();
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const DoseUpcomingAlertDialog();
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 5.setHeight),
                                  decoration: BoxDecoration(color: _getStatusColor(vaccine.status).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        _getStatusIcon(vaccine.status),
                                        color: _getStatusColor(vaccine.status),
                                        size: 16,
                                      ),
                                      SizedBox(width: 4.setWidth),
                                      CommonText(
                                        text: _getStatusText(vaccine.status),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        textColor: _getStatusColor(vaccine.status),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
