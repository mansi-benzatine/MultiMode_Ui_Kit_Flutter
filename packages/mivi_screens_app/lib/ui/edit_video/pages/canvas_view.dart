import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

class CanvasView extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CanvasView());
  }

  const CanvasView({super.key});

  @override
  State<CanvasView> createState() => _CanvasViewState();
}

class _CanvasViewState extends State<CanvasView> {
  final List<Map<String, dynamic>> ratios = [
    {
      'label': 'Original',
      'ratio': 1.0,
      'isSelected': true,
    },
    {
      'label': '1:1',
      'ratio': 1.0,
      'isSelected': false,
    },
    {
      'label': '4:5',
      'ratio': 0.8,
      'isSelected': false,
    },
    {
      'label': '16:9',
      'ratio': 1.2,
      'isSelected': false,
    },
    {
      'label': '9:16',
      'ratio': 0.8,
      'isSelected': false,
    },
    {
      'label': '3:4',
      'ratio': 0.75,
      'isSelected': false,
    },
    {
      'label': '4:3',
      'ratio': 1.28,
      'isSelected': false,
    },
    {
      'label': '2:3',
      'ratio': 0.66,
      'isSelected': false,
    },
    {
      'label': '3:2',
      'ratio': 1.2,
      'isSelected': false,
    },
    {
      'label': '1:2',
      'ratio': 0.7,
      'isSelected': false,
    },
    {
      'label': '2:1',
      'ratio': 1.0,
      'isSelected': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: ratios.map((item) {
              String label = item['label'];
              double aspectRatio = item['ratio'];

              double baseHeight = 40.0;
              double width = baseHeight * aspectRatio;
              double height = baseHeight / aspectRatio;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var r in ratios) {
                      r['isSelected'] = false;
                    }
                    item['isSelected'] = true;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(8),
                  width: width + 30.setWidth,
                  height: height + 30.setHeight,
                  decoration: BoxDecoration(
                    color: item['isSelected'] ? CustomAppColor.of(context).secondary : const Color(0xFF2C2E38),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: item['isSelected'] ? CustomAppColor.of(context).secondary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.aspect_ratio,
                        size: 20,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                      const SizedBox(height: 6),
                      CommonText(
                        text: label,
                        textColor: item['isSelected'] ? null : CustomAppColor.of(context).secondary,
                        fontSize: 10.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 15.setHeight,
          ),
          Row(
            children: ratios.reversed.map((item) {
              String label = item['label'];
              double aspectRatio = item['ratio'];

              double baseHeight = 40.0;
              double width = baseHeight * aspectRatio;
              double height = baseHeight / aspectRatio;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var r in ratios) {
                      r['isSelected'] = false;
                    }
                    item['isSelected'] = true;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(8),
                  width: width + 30.setWidth,
                  height: height + 30.setHeight,
                  decoration: BoxDecoration(
                    color: item['isSelected'] ? CustomAppColor.of(context).secondary : const Color(0xFF2C2E38),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: item['isSelected'] ? CustomAppColor.of(context).secondary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: label,
                        textColor: item['isSelected'] ? null : CustomAppColor.of(context).secondary,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
