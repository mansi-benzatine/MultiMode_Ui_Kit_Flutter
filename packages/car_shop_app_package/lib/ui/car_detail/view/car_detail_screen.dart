import 'dart:io';

import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:car_shop_app_package/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/bottom_sheet/write_review_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_screen.dart';
import '../../search/view/search_screen.dart';
import '../../view_offer/view/view_offer_screen.dart';
import 'car_360_view_page.dart';
import 'colour_page.dart';
import 'compare_page.dart';
import 'images_page.dart';
import 'overview_page.dart';
import 'review_page.dart';

class CarDetailScreen extends StatefulWidget {
  final PopularCarItem car;

  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<String> _tabs = [];
  int selectedIndex = 0;
  final List<Widget> _pages = [
    const OverviewPage(),
    const OverviewPage(isShowPriceList: true),
    const ColourPage(),
    const ImagesPage(),
    const ComparePage(),
    const Car360ViewPage(),
    const ReviewPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _tabs = [
        Languages.of(context).txtOverview,
        Languages.of(context).txtPrice,
        Languages.of(context).txtColuors,
        Languages.of(context).txtImages,
        Languages.of(context).txtCompare,
        Languages.of(context).txt360View,
        Languages.of(context).txtReviews,
      ];
      _tabController.addListener(() {
        // print("index: ${_tabController.index}");
        selectedIndex = _tabController.index;
        setState(() {});
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: widget.car.carName,
              isShowBack: true,
              isShowSearch: true,
            ),
            if (_tabs.isNotEmpty) ...[
              AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  return TabBar(
                    controller: _tabController,
                    indicatorColor: CustomAppColor.of(context).primary,
                    indicatorWeight: 1,
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    tabAlignment: TabAlignment.start,
                    indicator: BoxDecoration(
                      gradient: CustomAppColor.of(context).primaryGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    indicatorPadding: EdgeInsets.only(
                      top: Platform.isAndroid ? 40.setHeight : 41.setHeight,
                    ),
                    tabs: List.generate(
                      _tabs.length,
                      (index) {
                        final isSelected = _tabController.index == index;
                        return Tab(
                          child: CommonText(
                            text: _tabs[index],
                            fontSize: 12.setFontSize,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                            textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                    _tabs.length,
                    (index) => (_pages.length > index)
                        ? _pages[index]
                        : InkWell(
                            onTap: () {
                              _tabController.animateTo(index, duration: const Duration(milliseconds: 300));
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10.setWidth, right: 10.setWidth, top: 10.setHeight),
                              child: CommonText(
                                text: _tabs[index],
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: selectedIndex == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              if (selectedIndex != 6) ...[
                CommonButton(
                  text: Languages.of(context).txtViewOffer,
                  mLeft: 16.setWidth,
                  mRight: 16.setWidth,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewOfferScreen()));
                  },
                ),
              ],
              if (selectedIndex == 6) ...[
                CommonButton(
                  text: Languages.of(context).txtWriteReview,
                  mLeft: 16.setWidth,
                  mRight: 16.setWidth,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.setWidth),
                          topRight: Radius.circular(16.setWidth),
                        ),
                      ),
                      builder: (context) => const WriteReviewBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: CustomAppColor.of(context).bgScreen,
                    );
                  },
                ),
              ],
              SizedBox(height: 16.setHeight)
            ],
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
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
    }
  }
}
