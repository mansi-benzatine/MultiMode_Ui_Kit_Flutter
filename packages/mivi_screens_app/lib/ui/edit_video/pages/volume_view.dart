import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/choose_media/datamodel/choose_media_data.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

class VolumeSelectorView extends StatefulWidget {
  final List<MediaModel> imageList;

  const VolumeSelectorView({super.key, required this.imageList});

  @override
  State<VolumeSelectorView> createState() => _VolumeSelectorViewState();
}

class _VolumeSelectorViewState extends State<VolumeSelectorView> {
  double _sliderValue = 0.58;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 48.setHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imageList.length,
              itemBuilder: (context, index) {
                final img = widget.imageList[index];
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF2B2C34),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.brightness_6,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.cyanAccent,
                    inactiveTrackColor: Colors.white24,
                    thumbColor: Colors.white,
                    trackHeight: 1,
                  ),
                  child: Slider(
                    value: _sliderValue,
                    onChanged: (val) => setState(() => _sliderValue = val),
                  ),
                ),
              ),
              CommonText(
                text: "${(_sliderValue * 100).toInt()}%",
                textColor: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "Fade In",
                    height: 42.setHeight,
                  ),
                ),
                SizedBox(width: 20.setWidth),
                Expanded(
                  child: CommonButton(
                    text: "Fade Out",
                    height: 42.setHeight,
                    buttonFontFamily: Constant.fontFamilyMedium500,
                    buttonTextColor: CustomAppColor.of(context).white,
                    borderColor: const Color(0xFF2B2C34),
                    buttonColor: const Color(0xFF2B2C34),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
