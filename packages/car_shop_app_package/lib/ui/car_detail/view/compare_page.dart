import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
  final List<CarComparison> comparisons = [
    CarComparison(
      car1: CarCompareItem(
        name: "Tesla Model Y",
        price: "\$45,340",
        image: AppAssets.imgTeslaFull,
        color: Colors.yellow.shade700,
      ),
      car2: CarCompareItem(
        name: "Tesla Model 3",
        price: "\$42,260",
        image: AppAssets.imgTesla2,
        color: Colors.black,
      ),
      comparisonText: "Model Y vs Model 3",
    ),
    CarComparison(
      car1: CarCompareItem(
        name: "Tesla Model Y",
        price: "\$45,340",
        image: AppAssets.imgTeslaFull,
        color: Colors.yellow.shade700,
      ),
      car2: CarCompareItem(
        name: "Tesla Model 3",
        price: "\$42,260",
        image: AppAssets.imgMercedes,
        color: Colors.grey.shade300,
      ),
      comparisonText: "Model Y vs Model 3",
    ),
    CarComparison(
      car1: CarCompareItem(
        name: "Tesla Model Y",
        price: "\$45,340",
        image: AppAssets.imgTeslaFull,
        color: Colors.yellow.shade700,
      ),
      car2: CarCompareItem(
        name: "Tesla Model 3",
        price: "\$42,260",
        image: AppAssets.imgMercedes2,
        color: Colors.red.shade700,
      ),
      comparisonText: "Model Y vs Model 3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.setWidth),
      child: Column(
        children: [
          ...comparisons.map((comparison) => _buildComparisonCard(comparison)),
        ],
      ),
    );
  }

  Widget _buildComparisonCard(CarComparison comparison) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.setHeight),
      padding: EdgeInsets.all(15.setWidth),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16.setWidth),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Left car
              Expanded(
                child: _buildCarItem(comparison.car1),
              ),
              // VS divider
              Image.asset(
                AppAssets.icVs,
                width: 50.setWidth,
                color: CustomAppColor.of(context).txtBlack,
              ),
              /* Container(
                margin: EdgeInsets.symmetric(horizontal: 12.setWidth),
                child: Column(
                  children: [
                    Container(
                      width: 1,
                      height: 60.setHeight,
                      color: CustomAppColor.of(context).containerBorder,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.setHeight),
                      padding: EdgeInsets.all(8.setWidth),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        shape: BoxShape.circle,
                      ),
                      child: CommonText(
                        text: "VS",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 60.setHeight,
                      color: CustomAppColor.of(context).containerBorder,
                    ),
                  ],
                ),
              ), */
              // Right car
              Expanded(
                child: _buildCarItem(comparison.car2),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          // Compare button
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8.setHeight),
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomAppColor.of(context).compareBtnBorder,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12.setWidth),
            ),
            child: Center(
              child: CommonText(
                text: comparison.comparisonText,
                fontSize: 13.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).compareBtnText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarItem(CarCompareItem car) {
    return Column(
      children: [
        // Car image container
        SizedBox(
          height: 70.setHeight,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.setWidth),
            child: Image.asset(
              car.image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: CustomAppColor.of(context).bgScreen,
                  child: Center(
                    child: Icon(
                      Icons.directions_car,
                      size: 48.setWidth,
                      color: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 20.setHeight),
        // Car name
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: car.name,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 4.setHeight),
            // Car price
            CommonText(
              text: car.price,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}

class CarComparison {
  final CarCompareItem car1;
  final CarCompareItem car2;
  final String comparisonText;

  CarComparison({
    required this.car1,
    required this.car2,
    required this.comparisonText,
  });
}

class CarCompareItem {
  final String name;
  final String price;
  final String image;
  final Color color;

  CarCompareItem({
    required this.name,
    required this.price,
    required this.image,
    required this.color,
  });
}
