import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/ui/offers/datamodels/offers_data.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/top_bar/topbar.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OffersScreen());
  }

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> implements TopBarClickListener {
  List<OfferData> offersList = [];
  void fillData() {
    offersList = [
      OfferData(offerImageUrl: AppAssets.imgHomeBanner1),
      OfferData(offerImageUrl: AppAssets.imgOfferBanner),
      OfferData(offerImageUrl: AppAssets.imgHomeBanner3),
      OfferData(offerImageUrl: AppAssets.imgHomeBanner2),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtOffers,
              isShowBack: true,
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              itemCount: offersList.length,
              itemBuilder: (context, index) {
                final image = offersList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(image.offerImageUrl)),
                );
              },
            )
          ],
        ),
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
