import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

import '../../../utils/constant.dart';
import '../widget/diagonal_stripe_pattern_view.dart';

class EffectView extends StatelessWidget {
  final List<Map<String, dynamic>> effects;
  const EffectView({super.key, required this.effects});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 10.setWidth),
        child: Row(
          children: effects.map((effect) {
            if (effect["label"] == null || effect["label"] == "") {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Container(
                      width: effect["width"],
                      height: 50,
                      margin: EdgeInsets.only(right: 3.setWidth),
                      decoration: BoxDecoration(
                        color: effect['color'],
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    Container(
                      width: effect["width"],
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const DiagonalStripePatternView(),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: effect["width"],
                height: 50.setHeight,
                margin: EdgeInsets.only(right: 3.setWidth),
                decoration: BoxDecoration(
                  color: effect['color'],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
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
                        effect['icon'],
                        color: Colors.white,
                        width: 16.setHeight,
                        height: 16.setHeight,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: effect['label'],
                      fontFamily: Constant.fontFamilyBold700,
                    ),
                  ],
                ),
              );
            }
          }).toList(),
        ),
      ),
    );
  }
}
