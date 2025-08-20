import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';

class ColourPage extends StatefulWidget {
  const ColourPage({super.key});

  @override
  State<ColourPage> createState() => _ColourPageState();
}

class _ColourPageState extends State<ColourPage> {
  int selectedColorIndex = 0;

  final List<CarColor> carColors = [
    CarColor(
      name: "Yellow",
      color: Colors.yellow.shade700,
      carImage: AppAssets.imgTeslaFull,
    ),
    CarColor(
      name: "Black",
      color: Colors.black,
      carImage: AppAssets.imgMercedes,
    ),
    CarColor(
      name: "White",
      color: Colors.white,
      carImage: AppAssets.imgMercedes2,
    ),
    CarColor(
      name: "Blue",
      color: Colors.blue.shade700,
      carImage: AppAssets.imgTesla2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Tesla Model Y Total ${carColors.length} Colours",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 30.setHeight),
          _buildCarImageSection(),
          SizedBox(height: 30.setHeight),
          _buildColorName(),
          SizedBox(height: 20.setHeight),
          _buildColorSelector(),
        ],
      ),
    );
  }

  Widget _buildCarImageSection() {
    return SizedBox(
      height: 200.setHeight,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.setWidth),
        child: Image.asset(
          carColors[selectedColorIndex].carImage,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildColorName() {
    return Center(
      child: CommonText(
        text: carColors[selectedColorIndex].name,
        fontSize: 18.setFontSize,
        fontWeight: FontWeight.w700,
        textColor: CustomAppColor.of(context).txtBlack,
      ),
    );
  }

  Widget _buildColorSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(carColors.length, (index) {
        final isSelected = selectedColorIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColorIndex = index;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.setWidth),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(
                      color: CustomAppColor.of(context).black,
                      width: 2,
                    )
                  : null,
            ),
            child: Container(
              width: 40.setWidth,
              height: 40.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: carColors[index].color,
                border: carColors[index].color == Colors.white
                    ? Border.all(
                        color: CustomAppColor.of(context).containerBorder,
                        width: 1,
                      )
                    : null,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class CarColor {
  final String name;
  final Color color;
  final String carImage;

  CarColor({
    required this.name,
    required this.color,
    required this.carImage,
  });
}
