import 'package:flutter/material.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

import '../../choose_media/datamodel/choose_media_data.dart';

class EditorAdjustmentScreen extends StatefulWidget {
  final List<MediaModel> imageList;

  const EditorAdjustmentScreen({super.key, required this.imageList});

  @override
  State<EditorAdjustmentScreen> createState() => _EditorAdjustmentScreenState();
}

class _EditorAdjustmentScreenState extends State<EditorAdjustmentScreen> {
  int selectedImageIndex = 0;
  int selectedToolIndex = 0;
  double currentValue = 0;

  final List<String> tools = ['Brightness', 'Contrast', 'Saturation', 'Highlights', 'Shadows', 'Temperature'];

  final List<IconData> toolIcons = [
    Icons.wb_sunny_outlined,
    Icons.contrast_outlined,
    Icons.water_drop_outlined,
    Icons.blur_circular_outlined,
    Icons.circle_outlined,
    Icons.thermostat_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 48.setHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imageList.length,
              itemBuilder: (context, index) {
                final img = widget.imageList[index];
                final isSelected = index == selectedImageIndex;
                return GestureDetector(
                  onTap: () => setState(() => selectedImageIndex = index),
                  child: Container(
                    width: 48.setWidth,
                    height: 48.setHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.transparent,
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: AssetImage(img.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                    activeTrackColor: CustomAppColor.of(context).secondary,
                    inactiveTrackColor: Colors.white12,
                    thumbColor: CustomAppColor.of(context).secondary,
                  ),
                  child: Slider(
                    value: currentValue,
                    min: -20,
                    max: 20,
                    divisions: 40,
                    onChanged: (v) => setState(() => currentValue = v),
                  ),
                ),
                Text(
                  currentValue.toStringAsFixed(0),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          SizedBox(
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: tools.length,
              itemBuilder: (context, index) {
                final selected = selectedToolIndex == index;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => selectedToolIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                        width: 50.setWidth,
                        decoration: BoxDecoration(
                          color: selected ? CustomAppColor.of(context).secondary : const Color(0xFF1B1C22),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: selected ? CustomAppColor.of(context).secondary : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          toolIcons[index],
                          color: !selected ? CustomAppColor.of(context).secondary : Colors.black87,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.setHeight),
                    CommonText(
                      text: tools[index],
                      textAlign: TextAlign.center,
                      textColor: selected ? Colors.white : Colors.white70,
                      fontSize: 11.setFontSize,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
