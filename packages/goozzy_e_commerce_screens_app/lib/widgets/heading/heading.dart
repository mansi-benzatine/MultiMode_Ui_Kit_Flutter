import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class Heading extends StatelessWidget {
  final String title;
  final String navigationTitle;
  final Function()? onTap;
  const Heading({super.key, required this.title, required this.navigationTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontWeight: FontWeight.w800,
            fontSize: AppSizes.setFontSize(18),
          ),
          InkWell(
            onTap: onTap,
            child: CommonText(
              text: navigationTitle,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(14),
              textColor: CustomAppColor.of(context).txtPurple,
            ),
          ),
        ],
      ),
    );
  }
}
