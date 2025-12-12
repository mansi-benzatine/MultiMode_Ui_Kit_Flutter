import 'package:flutter/material.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../widget/diagonal_stripe_pattern_view.dart';

class TextTrackView extends StatelessWidget {
  final List<String> labels;
  const TextTrackView({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(left: 10.setWidth),
      child: Row(
        children: labels.map((text) {
          return text == ""
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Container(
                        width: 80.setWidth,
                        height: 45.setHeight,
                        margin: EdgeInsets.only(right: 6.setWidth),
                        decoration: BoxDecoration(
                          color: const Color(0xFF040510),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Container(
                        width: 80.setWidth,
                        height: 45.setHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const DiagonalStripePatternView(),
                      ),
                    ],
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2C34),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 4.setHeight),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          AppAssets.icText,
                          color: Colors.white,
                          width: 16.setHeight,
                          height: 16.setHeight,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: text,
                        textColor: Colors.white,
                        fontSize: 14.setFontSize,
                      ),
                    ],
                  ),
                );
        }).toList(),
      ),
    );
  }
}
