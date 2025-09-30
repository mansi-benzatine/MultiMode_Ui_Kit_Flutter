import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

class SpecialOffersScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SpecialOffersScreen());
  }

  const SpecialOffersScreen({super.key});

  @override
  State<SpecialOffersScreen> createState() => _SpecialOffersScreenState();
}

class _SpecialOffersScreenState extends State<SpecialOffersScreen> implements TopBarClickListener {
  final List<String> offerImages = [
    AppAssets.imgHomeBanner,
    AppAssets.imgHomeBanner,
    AppAssets.imgHomeBanner,
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
              isShowBack: true,
              title: Languages.of(context).txtSpecialOffers,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: ListView.separated(
                  itemCount: offerImages.length,
                  separatorBuilder: (_, __) => SizedBox(height: 20.setHeight),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        offerImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
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
