import 'package:flutter/material.dart';
import 'package:mivi_app/ui/choose_media/datamodel/choose_media_data.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

class FilterSelectorView extends StatefulWidget {
  final List<MediaModel> imageList;

  const FilterSelectorView({super.key, required this.imageList});

  @override
  State<FilterSelectorView> createState() => _FilterSelectorViewState();
}

class _FilterSelectorViewState extends State<FilterSelectorView> {
  double _sliderValue = 0.58;
  int _selectedIndex = 0;
  int _selectedFilter = 0;

  final List<Map<String, String>> _filters = [
    {"name": "Original", "image": AppAssets.imgChooseImage1},
    {"name": "Vivid", "image": AppAssets.imgChooseImage1},
    {"name": "Noir", "image": AppAssets.imgChooseImage1},
    {"name": "Mellow", "image": AppAssets.imgChooseImage1},
    {"name": "Mood", "image": AppAssets.imgChooseImage1},
  ];

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

          // ---------- FILTER OPTIONS ----------
          SizedBox(
            height: 75.setHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final selected = _selectedFilter == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedFilter = index),
                  child: Container(
                    width: 55.setWidth,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Container(
                          height: 54.setHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected ? Colors.white : Colors.transparent,
                              width: 2,
                            ),
                            image: DecorationImage(
                              image: AssetImage(filter["image"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.setHeight),
                        CommonText(
                          text: filter["name"]!,
                          textColor: selected ? Colors.white : Colors.white70,
                          fontSize: 12.setFontSize,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
