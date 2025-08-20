import 'package:car_shop_screens_app_package/utils/debug.dart';
import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../search/view/search_screen.dart';
import '../../view_seller_detail/view/view_seller_detail_screen.dart';

class UsedCarDetailScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const UsedCarDetailScreen());
  }

  const UsedCarDetailScreen({super.key});

  @override
  State<UsedCarDetailScreen> createState() => _UsedCarDetailScreenState();
}

class _UsedCarDetailScreenState extends State<UsedCarDetailScreen> with TickerProviderStateMixin implements TopBarClickListener {
  final PageController _pageController = PageController();
  final ScrollController _nestedScrollController = ScrollController();

  late TabController _tabController;
  List<String> _tabs = [];
  int selectedIndex = 0;

  // Global keys for each section to track scroll positions
  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _specificationKey = GlobalKey();
  final GlobalKey _imagesKey = GlobalKey();
  final GlobalKey _emiKey = GlobalKey();
  final GlobalKey _view360Key = GlobalKey();

  // EMI Calculator state
  double _downPaymentValue = 10000.0;
  int _selectedDuration = 2;

  // Track section positions
  bool _isScrolling = false;
  bool _isTabBarSticky = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _tabs = [
        Languages.of(context).txtOverview,
        Languages.of(context).txtSpecificationFeatures,
        Languages.of(context).txtImages,
        Languages.of(context).txtEmiCal,
        Languages.of(context).txt360View,
      ];

      _setupScrollListener();

      setState(() {});

      // Give extra time for widgets to be rendered
      Future.delayed(const Duration(milliseconds: 500), () {
        Debug.printLog('Layout should be complete, scroll controller attached: ${_nestedScrollController.hasClients}');
      });
    });
  }

  void _setupScrollListener() {
    _nestedScrollController.addListener(() {
      if (_isScrolling) return; // Prevent conflicts during programmatic scrolling

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _updateActiveTab();
        _updateAppBarColor();
      });
    });
  }

  void _updateAppBarColor() {
    if (!mounted) return;

    try {
      // Check if we've scrolled past the car image section (making tabs sticky)
      const carImageHeight = 250.0; // Approximate car image section height
      final currentOffset = _nestedScrollController.offset;
      final shouldBeSticky = currentOffset > carImageHeight;

      if (shouldBeSticky != _isTabBarSticky) {
        setState(() {
          _isTabBarSticky = shouldBeSticky;
        });
      }
    } catch (e) {
      // Handle any errors silently
    }
  }

  void _updateActiveTab() {
    if (!mounted) return;

    try {
      final keys = [_overviewKey, _specificationKey, _imagesKey, _emiKey, _view360Key];
      const stickyHeaderHeight = 160.0; // App bar + tab bar height

      int activeIndex = 0;
      double closestDistance = double.infinity;

      for (int i = 0; i < keys.length; i++) {
        final context = keys[i].currentContext;
        if (context != null) {
          final renderBox = context.findRenderObject() as RenderBox?;
          if (renderBox != null) {
            final position = renderBox.localToGlobal(Offset.zero);
            final distanceFromTop = (position.dy - stickyHeaderHeight).abs();

            // Find the section closest to the sticky header position
            if (position.dy <= stickyHeaderHeight + 50 && distanceFromTop < closestDistance) {
              closestDistance = distanceFromTop;
              activeIndex = i;
            }
          }
        }
      }

      if (activeIndex != selectedIndex) {
        setState(() {
          selectedIndex = activeIndex;
          _tabController.animateTo(activeIndex);
        });
      }
    } catch (e) {
      // Handle any errors silently
    }
  }

  void _scrollToSection(int index) {
    if (!mounted) return;

    Debug.printLog('Scrolling to section: $index'); // Debug print

    _isScrolling = true; // Prevent listener conflicts

    final keys = [_overviewKey, _specificationKey, _imagesKey, _emiKey, _view360Key];
    final targetKey = keys[index];

    if (targetKey.currentContext != null) {
      Debug.printLog('Found context for section: $index'); // Debug print

      // Use a more aggressive approach for NestedScrollView
      if (index == 0) {
        // For overview, scroll to absolute top
        try {
          _nestedScrollController
              .animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          )
              .then((_) {
            _isScrolling = false;
            Debug.printLog('Scrolled to overview complete'); // Debug print
          });
        } catch (e) {
          Debug.printLog('Error scrolling to overview: $e'); // Debug print
          _isScrolling = false;
        }
      } else {
        // For other sections, use ensureVisible with different settings
        try {
          Scrollable.ensureVisible(
            targetKey.currentContext!,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            alignment: 0.0, // Align to start
            alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
          ).then((_) {
            _isScrolling = false;
            Debug.printLog('Scrolled to section $index complete'); // Debug print
          }).catchError((error) {
            Debug.printLog('Error in ensureVisible: $error'); // Debug print
            _isScrolling = false;
          });
        } catch (e) {
          Debug.printLog('Exception in scrollToSection: $e'); // Debug print
          _isScrolling = false;
        }
      }
    } else {
      Debug.printLog('No context found for section: $index'); // Debug print
      _isScrolling = false;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nestedScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: NestedScrollView(
        controller: _nestedScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // Custom App Bar
            SliverAppBar(
              expandedHeight: 60.setHeight,
              floating: false,
              pinned: true,
              elevation: 0,
              actionsPadding: EdgeInsets.only(right: 20.setWidth),
              backgroundColor: _isTabBarSticky ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).bgScreen,
              leading: Padding(
                padding: EdgeInsets.only(left: 15.setWidth),
                child: IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 24.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                ),
              ),
              title: CommonText(
                text: Languages.of(context).txtUsedCar,
                fontWeight: FontWeight.w600,
                fontSize: 20.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
                height: 1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              actions: [
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                    },
                    child: Image.asset(
                      AppAssets.icSearch,
                      width: 20.setWidth,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                ),
              ],
            ),

            // Car Image Section
            SliverToBoxAdapter(
              child: _buildCarImageTop(),
            ),

            // Car Description Section
            SliverToBoxAdapter(
              child: _buildCarDescription(),
            ),

            // Sticky Tab Bar
            if (_tabs.isNotEmpty)
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: CustomAppColor.of(context).tabSelectedTxtColor2,
                    unselectedLabelColor: CustomAppColor.of(context).tabTxtColor2,
                    labelPadding: EdgeInsets.only(
                      right: 16.setWidth,
                    ),
                    padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth),
                    labelStyle: TextStyle(
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamily,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamily,
                    ),
                    indicatorColor: CustomAppColor.of(context).primary,
                    indicatorWeight: 1,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabAlignment: TabAlignment.start,
                    dividerColor: CustomAppColor.of(context).containerBorder,
                    onTap: _scrollToSection,
                    tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
                  ),
                ),
              ),
          ];
        },
        body: _tabs.isNotEmpty
            ? ColoredBox(
                color: CustomAppColor.of(context).bgUsedCarOverview,
                child: CustomScrollView(
                  slivers: [
                    // Overview Section
                    SliverToBoxAdapter(
                      child: Container(
                        key: _overviewKey,
                        margin: EdgeInsets.only(top: 10.setHeight),
                        child: _buildOverviewContent(),
                      ),
                    ),

                    // Specification Section
                    SliverToBoxAdapter(
                      child: Container(
                        key: _specificationKey,
                        margin: EdgeInsets.only(top: 5.setHeight),
                        child: _buildSpecificationContent(),
                      ),
                    ),

                    // Images Section
                    SliverToBoxAdapter(
                      child: Container(
                        key: _imagesKey,
                        margin: EdgeInsets.only(top: 5.setHeight),
                        child: _buildImagesContent(),
                      ),
                    ),

                    // EMI Calculator Section
                    SliverToBoxAdapter(
                      child: Container(
                        key: _emiKey,
                        margin: EdgeInsets.only(top: 5.setHeight),
                        child: _buildEMICalculatorContent(),
                      ),
                    ),

                    // 360 View Section
                    SliverToBoxAdapter(
                      child: Container(
                        key: _view360Key,
                        margin: EdgeInsets.only(top: 5.setHeight),
                        child: _build360ViewContent(),
                      ),
                    ),

                    // Bottom Button as Sliver
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(16.setWidth),
                        margin: EdgeInsets.only(bottom: 20.setHeight, left: 16.setWidth, right: 16.setWidth),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgUsedCarOverview,
                        ),
                        child: IgnorePointer(
                          ignoring: true,
                          child: CommonButton(
                            text: Languages.of(context).txtViewSellerDetails,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewSellerDetailScreen()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }

  Widget _buildCarImageTop() {
    return SizedBox(
      height: 250.setHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 220.setHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250.setHeight,
                    color: CustomAppColor.of(context).bgSearchBar,
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                    child: Image.asset(
                      AppAssets.imgTeslaFull,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: InkWell(
              onTap: () {
                _pageController.animateToPage(
                  (_pageController.page!.toInt() - 1).clamp(0, 9),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).black.withOpacityPercent(0.5),
                  shape: BoxShape.circle,
                ),
                height: 30.setHeight,
                width: 30.setWidth,
                margin: EdgeInsets.only(left: 10.setWidth, bottom: 25.setHeight),
                alignment: Alignment.center,
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 24.setFontSize,
                  color: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                _pageController.animateToPage(
                  (_pageController.page!.toInt() + 1).clamp(0, 9),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).black.withOpacityPercent(0.5),
                  shape: BoxShape.circle,
                ),
                height: 30.setHeight,
                width: 30.setWidth,
                margin: EdgeInsets.only(right: 10.setWidth, bottom: 25.setHeight),
                alignment: Alignment.center,
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 24.setFontSize,
                  color: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 20,
            child: Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.imgTesla,
                      fit: BoxFit.contain,
                      height: 45.setHeight,
                      width: 45.setWidth,
                    ),
                    Container(
                      height: 45.setHeight,
                      width: 45.setWidth,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).black.withOpacityPercent(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "10+", style: TextStyle(fontSize: 12.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, color: CustomAppColor.of(context).white)),
                            TextSpan(text: "\nImages", style: TextStyle(fontSize: 8.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, color: CustomAppColor.of(context).white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarDescription() {
    return Padding(
      padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 5.setHeight, bottom: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CommonText(
                  text: "Tesla Model Y",
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 5.setWidth),
              CommonText(
                text: "⭐ 4.9",
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
              SizedBox(width: 5.setWidth),
            ],
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: "\$32,340",
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: "90,000 kms | petrol | 2018 | 1st owner",
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 8.setHeight),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 12.setFontSize,
                color: CustomAppColor.of(context).txtGray,
              ),
              SizedBox(width: 4.setWidth),
              Expanded(
                child: CommonText(
                  text: "47 W 13th St, New York, NY 10011, USA",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      margin: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgUsedCarCardg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtCarOverview,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          // Overview Grid
          Row(
            children: [
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtRegYear, "June 2015"),
              ),
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtInsurance, "NA"),
              ),
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtFuel, "Petrol"),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            thickness: 0.5,
          ),
          SizedBox(height: 8.setHeight),
          Row(
            children: [
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtSeats, "4 Seats"),
              ),
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtKmDriven, "90,000 Km"),
              ),
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtMakeYear, "June 2026"),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            thickness: 0.5,
          ),
          SizedBox(height: 8.setHeight),
          Row(
            children: [
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtSpareKey, "Yes"),
              ),
              Expanded(
                child: _buildOverviewItem(Languages.of(context).txtOwnership, "1st"),
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 10.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGray,
        ),
        SizedBox(height: 3.setHeight),
        CommonText(
          text: value,
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
      ],
    );
  }

  Widget _buildSpecificationContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      margin: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgUsedCarCardg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtSpecification,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),
          _buildSpecItem(Languages.of(context).txtEngine, "1248 cc"),
          _buildSpecItem(Languages.of(context).txtPower, "88.5 bhp"),
          _buildSpecItem(Languages.of(context).txtMileage, "24.95 kmpl"),
          _buildSpecItem(Languages.of(context).txtTransmission, "manual", isLast: true),
        ],
      ),
    );
  }

  Widget _buildSpecItem(String label, String value, {bool isLast = false}) {
    return Container(
      padding: EdgeInsets.only(top: 12.setHeight, bottom: isLast ? 0 : 12.setHeight),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(color: CustomAppColor.of(context).containerBorder, width: 0.5),
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: label,
            fontSize: 10.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          CommonText(
            text: value,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ],
      ),
    );
  }

  Widget _buildImagesContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      margin: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgUsedCarCardg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtImages,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),

          // Main Image
          Container(
            height: 200.setHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgUsedCarOverview,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppAssets.imgTeslaFull,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 12.setHeight),

          // Bottom Images Row
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100.setHeight,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgUsedCarOverview,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imgTesla,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.setWidth),
              Expanded(
                child: Container(
                  height: 100.setHeight,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgUsedCarOverview,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppAssets.imgTesla2,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).black.withOpacityPercent(0.6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: CommonText(
                            text: "+10 Images",
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEMICalculatorContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      margin: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgUsedCarCardg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtEmiCal,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),

          // EMI Estimate
          Center(
            child: Column(
              children: [
                CommonText(
                  text: Languages.of(context).txtEmiEstimate,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
                SizedBox(height: 8.setHeight),
                CommonText(
                  text: "\$1,338.4/Month",
                  fontSize: 24.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                CommonText(
                  text: "for 24 month @12%p.a",
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.setHeight),

          // Down Payment
          CommonText(
            text: Languages.of(context).txtDownPayment,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 16.setHeight),

          // Slider with value
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3.setHeight,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveTrackColor: CustomAppColor.of(context).bgUsedCarOverview,
              thumbColor: CustomAppColor.of(context).primary,
              valueIndicatorColor: CustomAppColor.of(context).black,
              valueIndicatorStrokeColor: CustomAppColor.of(context).black,
              overlayColor: CustomAppColor.of(context).primary.withValues(alpha: 0.1),
              valueIndicatorTextStyle: TextStyle(
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                color: CustomAppColor.of(context).txtWhite,
              ),
              showValueIndicator: ShowValueIndicator.always,
            ),
            child: Slider(
              value: _downPaymentValue,
              onChanged: (value) {
                setState(() {
                  _downPaymentValue = value;
                });
              },
              min: 0,
              max: 200000,
              thumbColor: CustomAppColor.of(context).primary,
              label: "  \$${_downPaymentValue.toInt()}  ",
            ),
          ),

          // Min and Max labels
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "\$0",
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
                CommonText(
                  text: "\$200,000",
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),

          SizedBox(height: 30.setHeight),

          // Duration
          CommonText(
            text: Languages.of(context).txtDurationInYear,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 16.setHeight),
          Row(
            children: [1, 2, 3, 4, 5].map((year) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDuration = year;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8.setWidth),
                  width: 32.setWidth,
                  height: 32.setHeight,
                  decoration: BoxDecoration(
                    color: year == _selectedDuration ? CustomAppColor.of(context).primary : Colors.transparent,
                    gradient: year == _selectedDuration ? CustomAppColor.of(context).primaryGradient : null,
                    border: Border.all(
                      color: year == _selectedDuration ? CustomAppColor.of(context).transparent : CustomAppColor.of(context).containerBorder,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: CommonText(
                      text: year.toString(),
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: year == _selectedDuration ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20.setHeight),

          // Customer info
          Center(
            child: CommonText(
              text: Languages.of(context).txt500PlusCustomersAvailedTheFacility,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ),
          SizedBox(height: 16.setHeight),

          // Loan Request Button
          Container(
            width: double.infinity,
            height: 40.setHeight,
            decoration: BoxDecoration(
              border: Border.all(color: CustomAppColor.of(context).compareBtnBorder),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: CommonText(
                text: Languages.of(context).txtLoanRequest,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).compareBtnText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _build360ViewContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      margin: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 20.setHeight, bottom: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgUsedCarCardg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txt360View,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),
          Container(
            height: 300.setHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSearchBar,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.threed_rotation,
                    size: 48.setFontSize,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "360° Car View",
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                ],
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
    if (name == Constant.strSearch) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
    }
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: CustomAppColor.of(context).bgScreen,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
