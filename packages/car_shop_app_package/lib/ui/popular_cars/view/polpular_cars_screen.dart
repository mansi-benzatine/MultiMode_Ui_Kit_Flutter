import 'package:car_shop_app_package/localization/language/languages.dart';
import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_screen.dart';
import '../../search/view/search_screen.dart';

class PolpularCarsScreen extends StatefulWidget {
  final List<PopularCarItem> cars;
  const PolpularCarsScreen({super.key, required this.cars});

  @override
  State<PolpularCarsScreen> createState() => _PolpularCarsScreenState();
}

class _PolpularCarsScreenState extends State<PolpularCarsScreen> implements TopBarClickListener {
  final Set<int> favoriteIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPopularCars,
              isShowBack: true,
              isShowSearch: true,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cars.length,
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.setHeight),
                    child: CarItemWidget(
                      car: widget.cars[index],
                      width: 0.screenWidth,
                      height: 240.setHeight,
                      favTop: 5.setHeight,
                      favRight: 25.setWidth,
                      isFavorite: favoriteIndexes.contains(index),
                      onFavoriteToggle: () {
                        setState(() {
                          if (favoriteIndexes.contains(index)) {
                            favoriteIndexes.remove(index);
                          } else {
                            favoriteIndexes.add(index);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = false}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
    }
  }
}
