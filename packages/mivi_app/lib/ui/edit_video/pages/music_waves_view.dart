import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

class MusicWavesView extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const MusicWavesView({
    super.key,
    this.width = 300,
    this.height = 60,
    this.color = Colors.pinkAccent,
  });

  @override
  Widget build(BuildContext context) {
    final random = Random();

    // Generate random waveform heights
    final bars = List.generate(60, (_) => random.nextDouble());

    return Container(
      width: 0.screenWidth,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(11),
            child: Image.asset(
              AppAssets.icMusic,
              width: 18.setHeight,
              height: 18.setHeight,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final barWidth = constraints.maxWidth / bars.length;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: bars
                      .map((h) => Container(
                            width: barWidth * 0.4,
                            height: (height * 0.4) * (0.2 + h),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
