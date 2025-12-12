import 'package:flutter/cupertino.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class ToolButton extends StatelessWidget {
  final String icon;
  final String label;
  final void Function() onTap;

  const ToolButton({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 12.setHeight),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              icon,
              color: CustomAppColor.of(context).white,
              height: 18.setHeight,
              width: 18.setWidth,
            ),
            const SizedBox(height: 6),
            CommonText(
              text: label,
              textColor: CustomAppColor.of(context).white,
              fontSize: 11.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
            ),
          ],
        ),
      ),
    );
  }
}
