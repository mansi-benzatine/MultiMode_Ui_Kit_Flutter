import 'package:flutter/cupertino.dart';
import 'package:mivi_screens_app/ui/edit_video/widget/timeline_view.dart';

class RotationLineView extends StatelessWidget {
  final double totalDuration;
  final double pixelsPerSecond;

  const RotationLineView({
    super.key,
    this.totalDuration = 20,
    this.pixelsPerSecond = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalDuration.toInt() + 1,
        itemBuilder: (context, index) {
          return CustomPaint(
            painter: RulerPainter(
              second: index,
              pixelsPerSecond: pixelsPerSecond,
            ),
            size: Size(pixelsPerSecond * 5, 50),
          );
        },
      ),
    );
  }
}
