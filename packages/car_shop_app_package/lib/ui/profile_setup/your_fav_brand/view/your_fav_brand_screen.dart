import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../../interfaces/top_bar_click_listener.dart';
import '../../../../localization/language/languages.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/button/common_button.dart';
import '../../../../widgets/text/common_text.dart';
import '../../../../widgets/top_bar/topbar.dart';
import '../../your_profile/view/your_profile_screen.dart';

class YourFavBrandScreen extends StatefulWidget {
  const YourFavBrandScreen({super.key});

  @override
  State<YourFavBrandScreen> createState() => _YourFavBrandScreenState();
}

class _YourFavBrandScreenState extends State<YourFavBrandScreen> implements TopBarClickListener {
  List<YourFavBrandItem> yourFavBrandList = [
    YourFavBrandItem(brandName: "Mercedes", brandImage: AppAssets.icMercedes, isSelected: true),
    YourFavBrandItem(brandName: "Toyota", brandImage: AppAssets.icToyota, isSelected: false),
    YourFavBrandItem(brandName: "Audi", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "BMW", brandImage: AppAssets.icBmw, isSelected: false),
    YourFavBrandItem(brandName: "Tesla", brandImage: AppAssets.icTesla, isSelected: false),
    YourFavBrandItem(brandName: "Jaguar", brandImage: AppAssets.icJaguar, isSelected: false),
    YourFavBrandItem(brandName: "Ferrari", brandImage: AppAssets.icFerrari, isSelected: false),
    YourFavBrandItem(brandName: "Lamborghini", brandImage: AppAssets.icLamborghini, isSelected: false),
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
              title: Languages.of(context).txtYourFavBrand,
              isShowBack: true,
            ),
            SizedBox(height: 20.setHeight),
            Expanded(
              child: GridView.builder(
                itemCount: yourFavBrandList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      yourFavBrandList[index].isSelected = !yourFavBrandList[index].isSelected;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).txtWhite,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          color: yourFavBrandList[index].isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                          width: 1.setWidth),
                    ),
                    margin: EdgeInsets.only(left: 7.setWidth, right: 7.setWidth, bottom: 15.setHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          yourFavBrandList[index].brandImage,
                          width: 50.setWidth,
                          height: 50.setHeight,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20.setHeight),
                        CommonText(
                            text: yourFavBrandList[index].brandName,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: yourFavBrandList[index].isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            CommonButton(
              text: Languages.of(context).txtContinue,
              buttonGradient: CustomAppColor.of(context).primaryGradient,
              mLeft: 25.setWidth,
              mRight: 25.setWidth,
              mBottom: 10.setHeight,
              mTop: 20.setHeight,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const YourProfileScreen()));
              },
            ),
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

class YourFavBrandItem {
  final String brandName;
  final String brandImage;
  bool isSelected;

  YourFavBrandItem({required this.brandName, required this.brandImage, this.isSelected = false});
}
