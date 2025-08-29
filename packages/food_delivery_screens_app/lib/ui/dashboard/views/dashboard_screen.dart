import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/ui/account/views/account_screen.dart';
import 'package:food_delivery_screens_app_package/ui/view_cart/views/view_cart_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../home/views/home_screen.dart';
import '../datamodels/dashboard_data.dart';

class DashboardScreen extends StatefulWidget {
  final int currentIndex;
  final bool isFromEmptyCart;
  final bool isForChangeAddressBsInHome;
  final bool isForLogoutBs;

  static Route<void> route({required int currentIndex, required bool isFromEmptyCart, bool isForChangeAddressBsInHome = false, bool isForLogoutBs = false}) {
    return MaterialPageRoute(
        builder: (_) => DashboardScreen(
              currentIndex: currentIndex,
              isFromEmptyCart: isFromEmptyCart,
              isForChangeAddressBsInHome: isForChangeAddressBsInHome,
              isForLogoutBs: isForLogoutBs,
            ));
  }

  const DashboardScreen({super.key, required this.currentIndex, required this.isFromEmptyCart, this.isForChangeAddressBsInHome = false, this.isForLogoutBs = false});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _tabController;
  List<BottomNavigationBarData> bottomNavigationBarList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fillDataAndInitController();
    });

    _selectedIndex = widget.currentIndex;
  }

  void fillDataAndInitController() {
    setState(() {
      bottomNavigationBarList = [
        BottomNavigationBarData(
          title: Languages.of(context).txtHome,
          image: AppAssets.icHome,
          screen: HomeScreen(
            isForChangeLocationBs: widget.isForChangeAddressBsInHome,
          ),
        ),
        BottomNavigationBarData(
          title: Languages.of(context).txtCart,
          image: AppAssets.icCart,
          screen: ViewCartScreen(
            isFromDashBoard: true,
            isFromEmptyCart: widget.isFromEmptyCart,
          ),
        ),
        BottomNavigationBarData(
          title: Languages.of(context).txtAccount,
          image: AppAssets.icAccount,
          screen: AccountScreen(
            isForLogoutBs: widget.isForLogoutBs,
          ),
        ),
      ];

      _tabController = TabController(
        length: bottomNavigationBarList.length,
        vsync: this,
        initialIndex: widget.currentIndex,
      );

      _selectedIndex = widget.currentIndex;

      _tabController!.addListener(() {
        if (!_tabController!.indexIsChanging) {
          setState(() {
            _selectedIndex = _tabController!.index;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: bottomNavigationBarList.map((item) => item.screen ?? const SizedBox()).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: IgnorePointer(
        ignoring: true,
        child: SafeArea(
          top: false,
          bottom: true,
          child: Container(
            decoration: BoxDecoration(
              color: _tabController?.index == 2 ? CustomAppColor.of(context).bgScaffold : CustomAppColor.of(context).btNavigation,
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: TabBar(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              indicatorWeight: 4,
              indicator: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: CustomAppColor.of(context).primary,
                  width: 4,
                )),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 50.setWidth),
              labelColor: CustomAppColor.of(context).primary,
              unselectedLabelColor: CustomAppColor.of(context).txtGrey,
              tabs: bottomNavigationBarList.map((item) {
                int i = bottomNavigationBarList.indexOf(item);
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.setHeight),
                  child: Tab(
                    height: 65.setHeight,
                    icon: Padding(
                      padding: EdgeInsets.only(top: 5.setHeight),
                      child: Image.asset(
                        item.image!,
                        height: 24.setHeight,
                        width: 24.setWidth,
                        color: _selectedIndex == i ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGrey,
                      ),
                    ),
                    text: item.title,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
