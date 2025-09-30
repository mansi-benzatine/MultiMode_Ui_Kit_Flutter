import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../datamodel/add_promo_data.dart';

class AddPromoScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddPromoScreen());
  }

  const AddPromoScreen({super.key});

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> implements TopBarClickListener {
  final List<PromoModel> promoList = [
    PromoModel(
      title: "Users First Order 20% Off",
      description: "Only New Users First Order Valid!",
      code: "FIRSTORDER025",
      discount: 20,
    ),
    PromoModel(
      title: "30% Discount",
      description: "Today’s Special Offer",
      code: "SAVE30OFF",
      discount: 30,
    ),
    PromoModel(
      title: "50% Discount",
      description: "Get 50% via Shopping Festival",
      code: "UP50OFF",
      discount: 50,
    ),
    PromoModel(
      title: "8% Off",
      description: "Get 8% Cashback",
      code: "UP8OFF",
      discount: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtAddPromo,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonText(
              text: Languages.of(context).txtPromoCodesAndOffersForYou,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
              textAlign: TextAlign.start,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
          ),
          SizedBox(height: 20.setHeight),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              itemCount: promoList.length,
              itemBuilder: (context, index) {
                return promoCardView(promo: promoList[index]);
              },
            ),
          ),
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

  Widget promoCardView({required PromoModel promo}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.setHeight),
      child: CustomPaint(
        painter: DashedBorderPainter(
          right: 80,
          holeRadius: 30,
          strokeWidth: 1,
          dashPattern: [5, 3],
          color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.5),
          cornerRadius: 24,
          showMiddleLine: true,
        ),
        child: ClipPath(
          clipper: DolDurmaClipper(
            right: 80,
            holeRadius: 30,
            cornerRadius: 24,
          ),
          child: Container(
            width: 388.setWidth,
            height: 140.setHeight,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            color: CustomAppColor.of(context).bgScreen,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: promo.title,
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 18.setFontSize,
                      ),
                      CommonText(
                        text: promo.description,
                        fontSize: 16.setFontSize,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                      ),
                      SizedBox(height: 12.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 10.setWidth),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).dividerColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CommonText(
                              text: promo.code,
                              fontFamily: Constant.fontFamilyBold700,
                              fontSize: 14.setFontSize,
                            ),
                            SizedBox(width: 20.setWidth),
                            Image.asset(
                              AppAssets.icDocument,
                              height: 18.setHeight,
                              width: 18.setWidth,
                              color: CustomAppColor.of(context).icBlackWhite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: Column(
                    children: List.generate(10, (index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 3.setHeight),
                        child: Container(
                          height: 5.setHeight,
                          width: 0.5.setWidth,
                          color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.5),
                        ),
                      );
                    }),
                  ),
                ),
                // Right side discount circle
                Padding(
                  padding: EdgeInsets.only(left: 20.setWidth),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: CustomAppColor.of(context).btnPrimary,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: Constant.fontFamilyBold700,
                          fontSize: 22.setFontSize,
                          package: 'furniture_app_package',
                        ),
                        children: [
                          TextSpan(
                            text: "${promo.discount}%\n",
                          ),
                          TextSpan(
                            text: "Off",
                            style: TextStyle(
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 12.setFontSize,
                              package: 'furniture_app_package',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({
    required this.right,
    required this.holeRadius,
    this.cornerRadius = 0,
  });

  final double right;
  final double holeRadius;
  final double cornerRadius;

  @override
  Path getClip(Size size) {
    final path = Path();

    // Top-left corner
    path.moveTo(cornerRadius, 0);
    path.lineTo(size.width - right - holeRadius, 0);

    // Top cutout arc
    path.arcToPoint(
      Offset(size.width - right, 0),
      clockwise: false,
      radius: const Radius.circular(15),
    );

    // Top-right corner
    path.lineTo(size.width - cornerRadius, 0);
    path.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    // Right side down
    path.lineTo(size.width, size.height - cornerRadius);

    // Bottom-right corner
    path.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: Radius.circular(cornerRadius),
    );

    // Bottom cutout arc
    path.lineTo(size.width - right, size.height);
    path.arcToPoint(
      Offset(size.width - right - holeRadius, size.height),
      clockwise: false,
      radius: const Radius.circular(15),
    );

    // Bottom-left corner
    path.lineTo(cornerRadius, size.height);
    path.arcToPoint(
      Offset(0, size.height - cornerRadius),
      radius: Radius.circular(cornerRadius),
    );

    // Left side up
    path.lineTo(0, cornerRadius);

    // Top-left corner close
    path.arcToPoint(
      Offset(cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}

class DashedBorderPainter extends CustomPainter {
  DashedBorderPainter({
    required this.right,
    required this.holeRadius,
    required this.strokeWidth,
    required this.dashPattern,
    required this.color,
    required this.cornerRadius,
    this.showMiddleLine = true,
  });

  final double right;
  final double holeRadius;
  final double strokeWidth;
  final List<double> dashPattern;
  final Color color;
  final double cornerRadius;
  final bool showMiddleLine;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Outer border
    final path = DolDurmaClipper(
      right: right,
      holeRadius: holeRadius,
      cornerRadius: cornerRadius,
    ).getClip(size);

    canvas.drawPath(_dashPath(path, dashPattern), paint);

    // Middle vertical dotted line
    if (showMiddleLine) {
      final midX = size.width - right; // position before the cutout
      final midLine = Path()
        ..moveTo(midX, 0)
        ..lineTo(midX, size.height);

      canvas.drawPath(_dashPath(midLine, dashPattern), paint);
    }
  }

  Path _dashPath(Path source, List<double> dashPattern) {
    final dashedPath = Path();
    for (final metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final len = dashPattern[draw ? 0 : 1];
        if (draw) {
          dashedPath.addPath(
            metric.extractPath(distance, distance + len),
            Offset.zero,
          );
        }
        distance += len;
        draw = !draw;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(DashedBorderPainter oldPainter) => true;
}
