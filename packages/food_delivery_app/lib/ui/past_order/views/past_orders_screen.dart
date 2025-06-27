import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/ui/feedback/views/feedback_screen.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/dotted_divider/dotted_diveder.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../re_order/views/re_order_screen.dart';
import '../datamodels/past_order_data.dart';

class PastOrdersScreen extends StatefulWidget {
  const PastOrdersScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PastOrdersScreen());
  }

  @override
  State<PastOrdersScreen> createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> implements TopBarClickListener {
  List<PastOrder> pastOrderList = [];
  final PageController _pageController = PageController();
  int _currentPage = 0; // 0 for Delivered, 1 for Cancelled

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void fillData() {
    pastOrderList = [
      PastOrder(
        restaurantName: "The Modern Restaurant",
        location: "New York",
        imageUrl: AppAssets.imgChickenSpeghetti,
        totalAmount: 330,
        items: [OrderItem(name: "Testy Burger", quantity: 2)],
        orderDateTime: "February 26, 12:10 PM",
        isDelivered: true,
      ),
      PastOrder(
        restaurantName: "The Modern Restaurant",
        location: "New York",
        imageUrl: AppAssets.imgChickenSpeghetti,
        totalAmount: 330,
        items: [OrderItem(name: "Testy Burger", quantity: 2)],
        orderDateTime: "February 26, 12:10 PM",
        isDelivered: true,
      ),
      PastOrder(
        restaurantName: "The Modern Restaurant",
        location: "New York",
        imageUrl: AppAssets.imgChickenSpeghetti,
        totalAmount: 330,
        items: [OrderItem(name: "Testy Burger", quantity: 2)],
        orderDateTime: "February 26, 12:10 PM",
        isDelivered: true,
      ),
      PastOrder(
        restaurantName: "The Modern Restaurant",
        location: "New York",
        imageUrl: AppAssets.imgChickenSpeghetti,
        totalAmount: 330,
        items: [OrderItem(name: "Testy Burger", quantity: 2)],
        orderDateTime: "February 26, 12:10 PM",
        isDelivered: false,
      ),
      PastOrder(
        restaurantName: "The Modern Restaurant",
        location: "New York",
        imageUrl: AppAssets.imgChickenSpeghetti,
        totalAmount: 330,
        items: [OrderItem(name: "Testy Burger", quantity: 2)],
        orderDateTime: "February 26, 12:10 PM",
        isDelivered: false,
      ),
      PastOrder(
        restaurantName: "The Modern Restaurant",
        location: "New York",
        imageUrl: AppAssets.imgChickenSpeghetti,
        totalAmount: 330,
        items: [OrderItem(name: "Testy Burger", quantity: 2)],
        orderDateTime: "February 26, 12:10 PM",
        isDelivered: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final deliveredOrders = pastOrderList.where((order) => order.isDelivered).toList();
    final cancelledOrders = pastOrderList.where((order) => !order.isDelivered).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtPastOrder),
            Container(
              color: CustomAppColor.of(context).bgScaffold,
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentPage = 0;
                        });
                        _pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 12.setWidth),
                        decoration: BoxDecoration(
                          color: _currentPage == 0 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScaffold,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: CustomAppColor.of(context).primary,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Languages.of(context).txtDelivered.toUpperCase(),
                            style: TextStyle(
                              color: _currentPage == 0 ? Colors.white : CustomAppColor.of(context).primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.setFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentPage = 1;
                        });
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 12.setWidth),
                        decoration: BoxDecoration(
                          color: _currentPage == 1 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScaffold,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: CustomAppColor.of(context).primary,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Languages.of(context).txtCancelled.toUpperCase(),
                            style: TextStyle(
                              color: _currentPage == 1 ? Colors.white : CustomAppColor.of(context).primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.setFontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  PastOrderListView(pastOrderList: deliveredOrders),
                  PastOrderListView(pastOrderList: cancelledOrders),
                ],
              ),
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

class PastOrderListView extends StatelessWidget {
  final List<PastOrder> pastOrderList;
  const PastOrderListView({super.key, required this.pastOrderList});

  @override
  Widget build(BuildContext context) {
    if (pastOrderList.isEmpty) {
      return Center(
        child: CommonText(
          text: Languages.of(context).txtCancelled,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: pastOrderList.length,
      separatorBuilder: (context, index) {
        return Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight);
      },
      itemBuilder: (context, index) {
        final item = pastOrderList[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 16.setHeight),
          color: CustomAppColor.of(context).bgScaffold,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: item.restaurantName,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.setFontSize,
                        letterSpacing: -0.3,
                      ),
                      CommonText(
                        text: item.location,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      CommonText(
                        text: "\$${item.totalAmount}",
                        fontWeight: FontWeight.w700,
                        fontSize: 14.setFontSize,
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    child: Image.asset(
                      item.imageUrl,
                      width: 70.setWidth,
                      height: 70.setHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.setHeight),
              DottedDivider(
                color: CustomAppColor.of(context).containerBorder,
                height: 2,
                dotWidth: 2,
                spacing: 2,
              ),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: "${item.items.first.name} x ${item.items.first.quantity}",
                fontWeight: FontWeight.w600,
                fontSize: 13.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              CommonText(
                text: item.orderDateTime,
                fontSize: 13.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(height: 16.setHeight),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      height: 44.setHeight,
                      text: Languages.of(context).txtReOrder.toUpperCase(),
                      onTap: () => Navigator.push(context, ReOrderScreen.route()),
                    ),
                  ),
                  if (item.isDelivered) SizedBox(width: 20.setWidth),
                  if (item.isDelivered)
                    Expanded(
                      child: CommonButton(
                        buttonColor: CustomAppColor.of(context).reviewButton,
                        borderColor: CustomAppColor.of(context).txtBlack,
                        height: 44.setHeight,
                        text: Languages.of(context).txtReview.toUpperCase(),
                        onTap: () => Navigator.push(context, FeedbackScreen.route()),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
