import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/live_tracking/views/live_tracking_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/text/common_text.dart';
import '../datamodel/track_order_data.dart';

class TrackOrderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TrackOrderScreen());
  }

  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> implements TopBarClickListener {
  final List<DeliveryStatusModel> deliveryStatusList = [
    DeliveryStatusModel(
      dateTime: DateTime(2025, 1, 1, 9, 25),
      title: "Pick-Up",
      location: "Washingtone, UAS",
      stage: DeliveryStage.pickup,
    ),
    DeliveryStatusModel(
      dateTime: DateTime(2025, 1, 4, 0, 0),
      title: "Shipped",
      location: "Washingtone, UAS",
      stage: DeliveryStage.shipped,
    ),
    DeliveryStatusModel(
      dateTime: DateTime(2025, 1, 6, 10, 0),
      title: "Delivered",
      location: "Washingtone, UAS",
      stage: DeliveryStage.delivered,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtTrackOrder,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderedItem(),
                      SizedBox(height: 20.setHeight),
                      currentStatusView(deliveryStatusList),
                      SizedBox(height: 20.setHeight),
                      deliverStatusView(deliveryStatusList),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtLiveTracking,
                image: AppAssets.icGps,
                onTap: () => Navigator.push(context, LiveTrackingScreen.route()),
              ),
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

  Widget orderedItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(12),
          child: Image.asset(
            AppAssets.imgDummySofa,
            width: 110.setHeight,
            height: 110.setHeight,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: "Lolita Sofa",
                fontFamily: Constant.fontFamilySemiBold600,
                fontSize: 18.setFontSize,
              ),
              CommonText(
                text: "\$299.00",
                fontFamily: Constant.fontFamilyBold700,
                fontSize: 18.setFontSize,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: "1 : Qty",
                fontFamily: Constant.fontFamilyMedium500,
                fontSize: 14.setFontSize,
              ),
              SizedBox(height: 5.setHeight),
              Row(
                children: [
                  Container(
                    height: 10.setHeight,
                    width: 10.setWidth,
                    decoration: const BoxDecoration(color: Color(0xFFF19E5B), shape: BoxShape.circle),
                  ),
                  SizedBox(width: 8.setWidth),
                  CommonText(
                    text: "Orange",
                    fontFamily: Constant.fontFamilyMedium500,
                    fontSize: 14.setFontSize,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget currentStatusView(List<DeliveryStatusModel> statusList) {
    final currentIndex = statusList.lastIndexWhere(
      (s) => DateTime.now().isAfter(s.dateTime),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtCurrentStatus,
          fontFamily: Constant.fontFamilyBold700,
          fontSize: 20.setFontSize,
        ),
        SizedBox(height: 12.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(statusList.length, (index) {
            final isCompleted = index <= currentIndex - 1;
            return Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).transparent,
                    border: Border.all(
                      color: isCompleted ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).txtGray,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    _getIconForStage(statusList[index].stage),
                    height: 24.setHeight,
                    width: 24.setHeight,
                  ),
                ),
                if (index != statusList.length - 1)
                  SizedBox(
                    width: 110.setWidth,
                    child: CustomPaint(
                      painter: ConnectorLinePainter(
                        isCompleted: index < currentIndex - 1,
                        isCurrent: index == currentIndex - 1,
                        color: CustomAppColor.of(context).primary,
                        dashColor: CustomAppColor.of(context).txtGray,
                        axis: Axis.horizontal,
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
        SizedBox(height: 10.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(statusList.length, (index) {
            return CommonText(
              text: statusList[index].title,
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              textColor: currentIndex == index ? CustomAppColor.of(context).txtGray : CustomAppColor.of(context).txtPrimary,
            );
          }),
        )
      ],
    );
  }

  String _getIconForStage(DeliveryStage stage) {
    switch (stage) {
      case DeliveryStage.pickup:
        return AppAssets.icBox;
      case DeliveryStage.shipped:
        return AppAssets.icTruck;
      case DeliveryStage.delivered:
        return AppAssets.icBoxTick;
    }
  }

  Widget deliverStatusView(List<DeliveryStatusModel> statusList) {
    final currentIndex = statusList.lastIndexWhere(
      (s) => DateTime.now().isAfter(s.dateTime),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtDeliveryStatus,
          fontFamily: Constant.fontFamilyBold700,
          fontSize: 20.setFontSize,
        ),
        SizedBox(height: 20.setHeight),
        Column(
          children: List.generate(statusList.length, (index) {
            final item = statusList[index];
            final isLast = index == statusList.length - 1;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonText(
                        text: "${item.dateTime.day}, "
                            "${_monthName(item.dateTime.month)} "
                            "${item.dateTime.year}",
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 18.setFontSize,
                      ),
                      CommonText(
                        text: _formatTime(item.dateTime),
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      SizedBox(height: 50.setHeight),
                    ],
                  ),
                ),
                SizedBox(width: 20.setWidth),
                Column(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == statusList.length - 1 ? CustomAppColor.of(context).txtGray : CustomAppColor.of(context).primary,
                      ),
                    ),
                    if (!isLast)
                      SizedBox(
                        height: 90.setHeight,
                        child: CustomPaint(
                          painter: ConnectorLinePainter(
                            isCompleted: index < currentIndex - 1,
                            isCurrent: index == currentIndex - 1,
                            color: CustomAppColor.of(context).primary,
                            dashColor: CustomAppColor.of(context).txtGray,
                            axis: Axis.vertical,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 16.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: item.title,
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 18.setFontSize,
                      ),
                      CommonText(
                        text: item.location,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return months[month - 1];
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final amPm = dateTime.hour >= 12 ? "pm" : "am";
    return "$hour:${dateTime.minute.toString().padLeft(2, '0')} $amPm";
  }
}

class ConnectorLinePainter extends CustomPainter {
  final bool isCompleted;
  final bool isCurrent;
  final Color color;
  final Color dashColor;
  final Axis axis; // <-- new param (vertical/horizontal)

  ConnectorLinePainter({
    required this.isCompleted,
    required this.isCurrent,
    required this.color,
    required this.dashColor,
    this.axis = Axis.vertical, // default vertical
  });

  @override
  void paint(Canvas canvas, Size size) {
    final solidPaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = color;

    final dashPaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = dashColor;

    if (axis == Axis.vertical) {
      _drawVertical(canvas, size, solidPaint, dashPaint);
    } else {
      _drawHorizontal(canvas, size, solidPaint, dashPaint);
    }
  }

  void _drawVertical(Canvas canvas, Size size, Paint solid, Paint dash) {
    const startY = 0.0;
    final endY = size.height;
    final x = size.width / 2;

    if (isCompleted) {
      canvas.drawLine(Offset(x, startY), Offset(x, endY), solid);
    } else if (isCurrent) {
      // top half solid
      canvas.drawLine(Offset(x, startY), Offset(x, size.height / 2), solid);
      // bottom half dashed
      _drawDashedLine(canvas, Offset(x, size.height / 2), Offset(x, endY), dash, vertical: true);
    } else {
      // fully dashed
      _drawDashedLine(canvas, Offset(x, startY), Offset(x, endY), dash, vertical: true);
    }
  }

  void _drawHorizontal(Canvas canvas, Size size, Paint solid, Paint dash) {
    const startX = 0.0;
    final endX = size.width;
    final y = size.height / 2;

    if (isCompleted) {
      canvas.drawLine(Offset(startX, y), Offset(endX, y), solid);
    } else if (isCurrent) {
      // left half solid
      canvas.drawLine(Offset(startX, y), Offset(size.width / 2, y), solid);
      // right half dashed
      _drawDashedLine(canvas, Offset(size.width / 2, y), Offset(endX, y), dash, vertical: false);
    } else {
      // fully dashed
      _drawDashedLine(canvas, Offset(startX, y), Offset(endX, y), dash, vertical: false);
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint, {required bool vertical}) {
    const dashLength = 6.0;
    const dashSpace = 4.0;

    if (vertical) {
      double currentY = start.dy;
      while (currentY < end.dy) {
        final nextY = (currentY + dashLength).clamp(currentY, end.dy);
        canvas.drawLine(Offset(start.dx, currentY), Offset(start.dx, nextY), paint);
        currentY += dashLength + dashSpace;
      }
    } else {
      double currentX = start.dx;
      while (currentX < end.dx) {
        final nextX = (currentX + dashLength).clamp(currentX, end.dx);
        canvas.drawLine(Offset(currentX, start.dy), Offset(nextX, start.dy), paint);
        currentX += dashLength + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
