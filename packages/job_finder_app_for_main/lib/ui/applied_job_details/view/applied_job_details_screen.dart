import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/applied_job_details_data.dart';

class AppliedJobDetailsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AppliedJobDetailsScreen());
  }

  const AppliedJobDetailsScreen({super.key});

  @override
  State<AppliedJobDetailsScreen> createState() => _AppliedJobDetailsScreenState();
}

class _AppliedJobDetailsScreenState extends State<AppliedJobDetailsScreen> implements TopBarClickListener {
  List<TrackApplicationData> trackApplication = [];

  void fillData() {
    trackApplication = [
      TrackApplicationData(applicationStatus: "Offer Letter", isCheckedApplication: false, date: "Not yet", time: ""),
      TrackApplicationData(applicationStatus: "Team Matching", isCheckedApplication: true, date: "10/02/2023", time: "10:00 am"),
      TrackApplicationData(applicationStatus: "Final HR Interview", isCheckedApplication: true, date: "05/02/2023", time: "03:30 pm"),
      TrackApplicationData(applicationStatus: "Technical Interview", isCheckedApplication: true, date: "02/02/2023", time: "10:30 am"),
      TrackApplicationData(applicationStatus: "Screening Interview", isCheckedApplication: true, date: "28/01/2023", time: "11:30 am"),
      TrackApplicationData(applicationStatus: "Reviewed By Facebook Team", isCheckedApplication: true, date: "25/01/2023", time: "11:00 am"),
      TrackApplicationData(applicationStatus: "Application Submitted", isCheckedApplication: true, date: "20/01/2023", time: "10:00 am"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtAppliedJobDetails,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            isShowTitle: true,
            isShowBack: true,
            iconColor: CustomAppColor.of(context).bgDetailsCard,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.setHeight),
                  const _ProductDetailView(),
                  SizedBox(height: 15.setHeight),
                  _ApplicationTrackView(
                    trackApplicationList: trackApplication,
                  ),
                ],
              ),
            ),
          )),
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

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.setWidth,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.05),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: CustomAppColor.of(context).bgWhiteSecondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.icAvatarKickstarter,
            height: 44.setHeight,
            width: 44.setWidth,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CommonText(
                        text: "Product Designer",
                        textAlign: TextAlign.start,
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: "\$160,00/y",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtSecondaryGrey,
                    ),
                  ],
                ),
                SizedBox(height: 5.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "Kickstarter",
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 4.setWidth),
                    Row(
                      children: [
                        CommonText(
                          text: "California",
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                        CommonText(
                          text: ", USA",
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplicationTrackView extends StatelessWidget {
  final List<TrackApplicationData> trackApplicationList;
  const _ApplicationTrackView({required this.trackApplicationList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtTrackApplication.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtSecondaryWhite,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 15.setHeight),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 5.setWidth),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: trackApplicationList.length,
          itemBuilder: (context, index) {
            final data = trackApplicationList[index];
            final isFirst = index == 0;
            final isSecond = index == 1;
            final isLast = index == trackApplicationList.length - 1;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isFirst
                        ? Image.asset(
                            AppAssets.icTrophy,
                            width: 24.setWidth,
                            fit: BoxFit.fill,
                            color: CustomAppColor.of(context).icGreyWhite,
                            height: 24.setHeight,
                          )
                        : Container(
                            width: 22.setWidth,
                            height: 20.setHeight,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isFirst
                                  ? CustomAppColor.of(context).transparent
                                  : isSecond
                                      ? CustomAppColor.of(context).transparent
                                      : CustomAppColor.of(context).icPrimary,
                              border:
                                  Border.all(color: isSecond ? CustomAppColor.of(context).primary : CustomAppColor(context).transparent, width: 2),
                            ),
                            child: isSecond
                                ? Container(
                                    width: 6.setWidth,
                                    height: 6.setHeight,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomAppColor.of(context).icPrimary,
                                      border: Border.all(color: CustomAppColor.of(context).white, width: 2),
                                    ),
                                  )
                                : data.isCheckedApplication
                                    ? Icon(Icons.check, size: 16, color: CustomAppColor.of(context).bgScreenWhite)
                                    : null,
                          ),
                    if (!isLast)
                      SizedBox(
                        width: 2,
                        height: 52,
                        child: isFirst
                            ? CustomPaint(
                                size: const Size(2, 50),
                                painter: DashPainter(color: CustomAppColor.of(context).containerGrey),
                              )
                            : Container(
                                color: data.isCheckedApplication ? CustomAppColor.of(context).icPrimary : Colors.grey[300],
                              ),
                      ),
                  ],
                ),
                SizedBox(width: 15.setWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: data.applicationStatus,
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                    ),
                    SizedBox(height: 6.setHeight),
                    if (data.date.isNotEmpty)
                      CommonText(
                        text: "${data.date}    ${data.time}",
                        fontSize: 13.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                    SizedBox(height: 10.setHeight),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class DashPainter extends CustomPainter {
  final Color color;
  DashPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 5, startY = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    while (startY < size.height) {
      canvas.drawLine(Offset(size.width / 2, startY), Offset(size.width / 2, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
