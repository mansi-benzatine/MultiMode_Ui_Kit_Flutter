import 'package:flutter/material.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/notification/views/notification_screen.dart';
import '../../../../../../ui/search/view/search_screen.dart';
import '../../../../../../ui/wishlist/view/wishlist_screen.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../account/view/account_screen.dart';
import '../../cart/views/cart_screen.dart';
import '../../category/view/category_screen.dart';
import '../../home_screen/view/home_screen.dart';
import '../../orders/view/orders_screen.dart';
import '../datamodel/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final bool isFromHome;
  final bool isFromCategory;
  final bool isFromOrders;
  final bool isFromAccount;
  const DashboardScreen({
    super.key,
    required this.isFromHome,
    required this.isFromCategory,
    required this.isFromOrders,
    required this.isFromAccount,
  });

  static Route route({required bool isFromHome, required bool isFromCategory, required bool isFromOrders, required bool isFromAccount}) {
    return MaterialPageRoute(
        builder: (context) => DashboardScreen(
              isFromHome: isFromHome,
              isFromAccount: isFromAccount,
              isFromCategory: isFromCategory,
              isFromOrders: isFromOrders,
            ));
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin implements TopBarClickListener {
  int selectedBottomIndex = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    // Determine which tab to show initially
    if (widget.isFromHome) {
      selectedBottomIndex = 0;
    } else if (widget.isFromCategory) {
      selectedBottomIndex = 1;
    } else if (widget.isFromOrders) {
      selectedBottomIndex = 2;
    } else if (widget.isFromAccount) {
      selectedBottomIndex = 3;
    }

    _tabController = TabController(
      length: bottomNavigationBarList.length,
      vsync: this,
      initialIndex: selectedBottomIndex,
    );

    // Update selectedBottomIndex when the tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          selectedBottomIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarData> bottomNavigationBarList = [
      BottomNavigationBarData(
        title: Languages.of(context).home,
        image: AppAssets.icHome,
        screen: const HomeScreen(),
      ),
      BottomNavigationBarData(
        title: Languages.of(context).category,
        image: AppAssets.icCategory,
        screen: const CategoryScreen(),
      ),
      BottomNavigationBarData(
        title: Languages.of(context).orders,
        image: AppAssets.icBag,
        screen: const OrdersScreen(),
      ),
      BottomNavigationBarData(
        title: Languages.of(context).account,
        image: AppAssets.icProfile,
        screen: const AccountScreen(),
      ),
    ];

    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                title: selectedBottomIndex == 0
                    ? Languages.of(context).goozzy
                    : selectedBottomIndex == 1
                        ? Languages.of(context).categories
                        : selectedBottomIndex == 2
                            ? Languages.of(context).order
                            : selectedBottomIndex == 3
                                ? Languages.of(context).account
                                : "",
                isShowProfile: selectedBottomIndex == 0,
                isShowNotification: selectedBottomIndex == 0,
                isShowLike: selectedBottomIndex == 0 || selectedBottomIndex == 1,
                isShowSearchField: selectedBottomIndex == 1 ? true : false,
                height: 120,
                isShowCart: selectedBottomIndex == 0 || selectedBottomIndex == 1 || selectedBottomIndex == 3,
                topBarColor: selectedBottomIndex == 0
                    ? CustomAppColor(context).bgTopBar
                    : selectedBottomIndex == 1
                        ? CustomAppColor(context).bgScaffold
                        : CustomAppColor(context).bgBlackWhiteScaffold,
                isShowShadow: selectedBottomIndex == 0 || selectedBottomIndex == 1 || selectedBottomIndex == 3 ? false : true,
                textColor: selectedBottomIndex == 0 ? CustomAppColor.of(context).txtAppBar : CustomAppColor.of(context).txtBlack,
                isShowCartCount: selectedBottomIndex == 0 ? true : false,
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: bottomNavigationBarList.map((item) => item.screen ?? const SizedBox()).toList(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgNavBar,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.setWidth(20)),
              topRight: Radius.circular(AppSizes.setWidth(20)),
            ),
          ),
          child: IgnorePointer(
            ignoring: true,
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              indicatorWeight: 4,
              indicator: const BoxDecoration(border: Border(top: BorderSide(color: AppColor.icPurple, width: 4))),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
              labelColor: CustomAppColor.of(context).icPurple,
              unselectedLabelColor: CustomAppColor.of(context).txtGrey,
              tabs: bottomNavigationBarList.map((item) {
                int i = bottomNavigationBarList.indexOf(item);
                return Tab(
                  height: AppSizes.setHeight(65),
                  icon: Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(12), bottom: AppSizes.setHeight(4)),
                    child: Image.asset(
                      item.image!,
                      height: AppSizes.setHeight(24),
                      width: AppSizes.setWidth(24),
                      color: selectedBottomIndex == i ? CustomAppColor.of(context).icPurple : CustomAppColor.of(context).txtGrey,
                    ),
                  ),
                  text: item.title,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.cart) {
      Navigator.push(context, CartScreen.route());
    }
    if (name == AppStrings.notification) {
      Navigator.push(context, NotificationsScreen.route());
    }
    if (name == AppStrings.search) {
      Navigator.push(context, SearchScreen.route());
    }
    if (name == AppStrings.wishlist) {
      Navigator.push(context, WishlistScreen.route());
    }
  }
}
