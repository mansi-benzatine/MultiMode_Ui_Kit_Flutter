import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/account/datamodels/account_data.dart';
import 'package:food_delivery_app_package/ui/app_settings/views/app_settings_screen.dart';
import 'package:food_delivery_app_package/ui/favourites/views/favourites_screen.dart';
import 'package:food_delivery_app_package/ui/manage_address/views/manage_address_screen.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

import '../../offers/views/offers_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> implements TopBarClickListener {
  List<AccountNavigationList> navigationList = [];
  void fillData() {
    navigationList = [
      AccountNavigationList(
        iconString: AppAssets.icManageAddress,
        title: Languages.of(context).txtManageAddress,
        screen: const ManageAddressScreen(),
      ),
      AccountNavigationList(
        iconString: AppAssets.icFavorite,
        title: Languages.of(context).txtFavourites,
        screen: const FavouritesScreen(),
      ),
      AccountNavigationList(
        iconString: AppAssets.icSell,
        title: Languages.of(context).txtOffers,
        screen: const OffersScreen(),
      ),
      AccountNavigationList(
        iconString: AppAssets.icSetting,
        title: Languages.of(context).txtAppSettings,
        screen: const AppSettingsScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMyAccount,
          ),
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              itemBuilder: (context, index) {
                final item = navigationList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => item.screen),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              item.iconString ?? '',
                              width: 24.setWidth,
                              height: 24.setHeight,
                              color: CustomAppColor.of(context).icBlack,
                            ),
                            SizedBox(width: 20.setWidth),
                            CommonText(
                              text: item.title,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.setFontSize,
                            )
                          ],
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: CustomAppColor.of(context).txtGrey,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: CustomAppColor.of(context).containerBorder);
              },
              itemCount: navigationList.length)
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
