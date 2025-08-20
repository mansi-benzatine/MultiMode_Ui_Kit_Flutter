import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final List<CarImageSection> imageSections = [
    CarImageSection(
      title: "Exterior",
      images: [
        AppAssets.imgTeslaFull,
        AppAssets.imgCarExterior1,
        AppAssets.imgCarExterior2,
        AppAssets.imgCarExterior3,
        AppAssets.imgCarExterior4,
      ],
    ),
    CarImageSection(
      title: "Interior",
      images: [
        AppAssets.imgCarInterior1,
        AppAssets.imgCarInterior2,
        AppAssets.imgCarInterior3,
        AppAssets.imgCarInterior4,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...imageSections.map((section) => _buildImageSection(section)),
        ],
      ),
    );
  }

  Widget _buildImageSection(CarImageSection section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.setWidth, bottom: 16.setHeight),
          child: CommonText(
            text: section.title,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        ...section.images.map((image) => _buildImageItem(image)),
      ],
    );
  }

  Widget _buildImageItem(String imagePath) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.setHeight),
      height: 160.setHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgSearchBar,
        borderRadius: BorderRadius.circular(12.setWidth),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.setWidth),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: CustomAppColor.of(context).bgSearchBar,
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 48.setWidth,
                  color: CustomAppColor.of(context).txtGray,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CarImageSection {
  final String title;
  final List<String> images;

  CarImageSection({
    required this.title,
    required this.images,
  });
}
