import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class ServiceHighlight {
  final String text;
  final String? subText;
  final String imagePath;
  final Color backgroundColor;
  final Color? subTextColor;

  ServiceHighlight({
    required this.text,
    required this.imagePath,
    required this.backgroundColor,
    this.subText,
    this.subTextColor,
  });
}

class ServiceHighlightsWidget extends StatelessWidget {
  final List<ServiceHighlight> highlights;

  const ServiceHighlightsWidget({
    super.key,
    required this.highlights,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: highlights.map((highlight) {
        return Container(
          height: AppSizes.setHeight(175),
          width: AppSizes.setWidth(125),
          decoration: BoxDecoration(
            color: highlight.backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Circular Icon Background
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(22)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.setHeight(21),
                    horizontal: AppSizes.setWidth(21),
                  ),
                  height: AppSizes.setHeight(66),
                  width: AppSizes.setWidth(66),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: CustomAppColor.of(context).white,
                    boxShadow: [
                      BoxShadow(
                        color: CustomAppColor.of(context).black.withOpacityPercent(0.1),
                        blurRadius: AppSizes.setHeight(10),
                        offset: Offset(0, AppSizes.setHeight(4)),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    highlight.imagePath,
                    height: AppSizes.setHeight(12),
                    width: AppSizes.setWidth(12),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.setHeight(7)),

              // Main Text
              CommonText(
                text: highlight.text,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
                textColor: CustomAppColor.of(context).black,
              ),

              // Sub Text
              if (highlight.subText != null)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(7)),
                  child: CommonText(
                    text: highlight.subText!.toUpperCase(),
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(13),
                    textColor: highlight.subTextColor ?? CustomAppColor.of(context).txtGrey,
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
