import 'package:flutter/material.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class BackgroundView extends StatefulWidget {
  const BackgroundView({super.key});

  @override
  State<BackgroundView> createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  final List<String> backgrounds = [
    AppAssets.imgGetStart3,
    AppAssets.imgGetStart1,
    AppAssets.imgGetStart12,
    AppAssets.imgGetStart4,
    AppAssets.imgGetStart11,
    AppAssets.imgGetStart5,
    AppAssets.imgGetStart6,
    AppAssets.imgGetStart7,
    AppAssets.imgGetStart8,
    AppAssets.imgGetStart9,
  ];
  double brightnessValue = 0.5;
  int selectedBgIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Icon(Icons.brightness_6, color: Colors.white70, size: 20),
              Expanded(
                child: Slider(
                  value: brightnessValue,
                  min: 0,
                  max: 1,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white24,
                  onChanged: (value) {
                    setState(() => brightnessValue = value);
                  },
                ),
              ),
              CommonText(
                text: '${(brightnessValue * 100).round()}%',
                textColor: CustomAppColor.of(context).secondary,
                fontSize: 13.setFontSize,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: backgrounds.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 14,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              bool isSelected = selectedBgIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedBgIndex = index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2C2E38),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected ? CustomAppColor.of(context).secondary : Colors.transparent,
                      width: 2,
                    ),
                    image: backgrounds[index] != AppAssets.imgChooseImage2
                        ? DecorationImage(
                            image: AssetImage(backgrounds[index]),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: backgrounds[index] == AppAssets.imgChooseImage1 ? const Icon(Icons.block, color: Colors.white70) : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
