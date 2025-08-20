import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class SimilarOfferScreen extends StatefulWidget {
  const SimilarOfferScreen({super.key});

  @override
  State<SimilarOfferScreen> createState() => _SimilarOfferScreenState();
}

class _SimilarOfferScreenState extends State<SimilarOfferScreen> implements TopBarClickListener {
  final List<CarOfferData> _carOffers = [
    CarOfferData(
      name: "Tesla Model 3",
      price: "\$28,260",
      imageUrl: AppAssets.imgTeslaFull,
    ),
    CarOfferData(
      name: "Tesla Model 3",
      price: "\$28,260",
      imageUrl: AppAssets.imgTeslaFull,
    ),
    CarOfferData(
      name: "Tesla Model 3",
      price: "\$28,260",
      imageUrl: AppAssets.imgTeslaFull,
    ),
    CarOfferData(
      name: "Tesla Model 3",
      price: "\$28,260",
      imageUrl: AppAssets.imgTeslaFull,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtViewSimilarOffers,
              isShowBack: true,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
                itemCount: _carOffers.length,
                itemBuilder: (context, index) {
                  return _buildCarOfferCard(_carOffers[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarOfferCard(CarOfferData carOffer) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.setHeight),
      padding: EdgeInsets.all(16.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Image
          Row(
            children: [
              SizedBox(
                height: 70.setHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    carOffer.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: CustomAppColor.of(context).bgScreen,
                        child: Icon(
                          Icons.directions_car,
                          size: 60.setWidth,
                          color: CustomAppColor.of(context).txtGray,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 16.setWidth),

              // Car Name and Price Row
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Car Name
                  CommonText(
                    text: carOffer.name,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.left,
                  ),

                  // Price
                  CommonText(
                    text: carOffer.price,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16.setHeight),

          // View Offers Button
          Container(
            width: double.infinity,
            height: 35.setHeight,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomAppColor.of(context).compareBtnBorder,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  // Handle view offers tap
                },
                child: Center(
                  child: CommonText(
                    text: Languages.of(context).txtViewOffers,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).compareBtnText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class CarOfferData {
  final String name;
  final String price;
  final String imageUrl;

  CarOfferData({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}
