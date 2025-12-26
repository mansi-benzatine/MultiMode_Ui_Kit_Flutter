import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class DigitalSignaturePage extends StatefulWidget {
  const DigitalSignaturePage({super.key});

  @override
  State<DigitalSignaturePage> createState() => _DigitalSignaturePageState();
}

class _DigitalSignaturePageState extends State<DigitalSignaturePage> {
  List<List<Offset>> path = [];
  List<Color> colors = [];
  Color selectedColor = Colors.black;

  void _undo() {
    if (path.isNotEmpty) {
      setState(() {
        path.removeLast();
        colors.removeLast();
      });
    }
  }

  void _pickColor() async {
    Color? tempSelectedColor = selectedColor;

    Color? pickedColor = await showDialog<Color>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              alignment: Alignment.center,
              backgroundColor: CustomAppColor.of(context).bgScreen,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 20.setHeight),
              title: CommonText(
                text: "Pick a color",
                fontWeight: FontWeight.w600,
                fontSize: 18.setFontSize,
                textAlign: TextAlign.start,
              ),
              content: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.setWidth,
                runSpacing: 8.setHeight,
                children: [
                  Colors.black,
                  Colors.white,
                  Colors.red,
                  Colors.green,
                  Colors.blueAccent,
                  Colors.yellowAccent,
                  Colors.purpleAccent,
                  Colors.pink,
                ].map((color) {
                  return GestureDetector(
                    onTap: () {
                      setDialogState(() {
                        tempSelectedColor = color;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 50.setWidth,
                          height: 50.setHeight,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CustomAppColor.of(context).black,
                            ),
                          ),
                        ),
                        if (tempSelectedColor == color)
                          Icon(
                            Icons.check,
                            color: CustomAppColor.of(context).txtGray,
                            size: 28,
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              actions: [
                CommonButton(
                  text: "Done",
                  onTap: () => Navigator.pop(context, tempSelectedColor),
                )
              ],
            );
          },
        );
      },
    );

    if (pickedColor != null) {
      setState(() {
        selectedColor = pickedColor;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.setHeight),
            CommonText(
              text: "Your digital \nsignature".toUpperCase(),
              fontWeight: FontWeight.w600,
              fontSize: 26.setFontSize,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: Languages.of(context).txtLoremIpsumShort,
              textAlign: TextAlign.start,
              textColor: CustomAppColor.of(context).txtGray,
              fontSize: 13.setFontSize,
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: _undo,
                  icon: Icon(
                    Icons.undo,
                    size: 30.setHeight,
                  ),
                ),
                IconButton(
                  onPressed: _pickColor,
                  icon: Icon(
                    Icons.color_lens_outlined,
                    size: 26.setHeight,
                  ),
                )
              ],
            ),
            SizedBox(height: 10.setHeight),
            GestureDetector(
              onPanStart: (details) {
                setState(() {
                  path.add([details.localPosition]);
                  colors.add(selectedColor);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  path.last.add(details.localPosition);
                });
              },
              child: Container(
                width: 0.screenWidth,
                height: 0.screenHeight / 2.6,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomAppColor.of(context).primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color: CustomAppColor.of(context).bgScreen,
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: CustomPaint(
                  painter: DrawingPainter(path, colors),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<List<Offset>> paths;
  final List<Color> colors;

  DrawingPainter(this.paths, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    for (int i = 0; i < paths.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round;

      for (int j = 0; j < paths[i].length - 1; j++) {
        canvas.drawLine(paths[i][j], paths[i][j + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
