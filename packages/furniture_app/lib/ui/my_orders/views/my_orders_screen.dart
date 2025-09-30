import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/checkout/view/checkout_screen.dart';
import 'package:furniture_app_package/ui/my_orders/datamodel/my_order_data.dart';
import 'package:furniture_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_app_package/ui/track_order/view/track_order_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/alert_dialog/review_alert_dialog.dart';
import '../../../widgets/bottom_sheet/cancel_order_bottom_sheet.dart';

class MyOrdersScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyOrdersScreen());
  }

  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> implements TopBarClickListener {
  final List<String> _tabs = ['Active', 'Completed', 'Cancelled'];
  String _selectedTab = 'Active';

  final List<OrderModel> _allOrders = [
    OrderModel(
      orderId: 'ORD001',
      productName: 'Lolita Sofa',
      price: 299.00,
      quantity: 1,
      color: 'Orange',
      imageUrl: AppAssets.imgDummyChair,
      status: 'Active',
      orderDate: DateTime.now().subtract(const Duration(days: 2)),
      isCancellable: true,
    ),
    OrderModel(
      orderId: 'ORD002',
      productName: 'Lolita Sofa',
      price: 299.00,
      quantity: 1,
      color: 'Orange',
      imageUrl: AppAssets.imgDummyPot,
      status: 'Active',
      orderDate: DateTime.now().subtract(const Duration(days: 1)),
      isCancellable: true,
    ),
    OrderModel(
      orderId: 'ORD003',
      productName: 'Lolita Sofa',
      price: 299.00,
      quantity: 1,
      color: 'Orange',
      imageUrl: AppAssets.imgDummySofa,
      status: 'Completed',
      orderDate: DateTime.now().subtract(const Duration(days: 10)),
    ),
    OrderModel(
      orderId: 'ORD004',
      productName: 'Lolita Sofa',
      price: 299.00,
      quantity: 1,
      color: 'Orange',
      imageUrl: AppAssets.imgDummySofa,
      status: 'Cancelled',
      orderDate: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<OrderModel> filteredOrders = _allOrders.where((order) => order.status == _selectedTab).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            textAlign: TextAlign.start,
            title: Languages.of(context).txtMyOrders,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _tabs.map((tab) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = tab;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.setWidth),
                      padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 24.setWidth),
                      decoration: BoxDecoration(
                          color: _selectedTab == tab ? CustomAppColor.of(context).btnPrimary : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: _selectedTab == tab ? CustomAppColor.of(context).transparent : CustomAppColor.of(context).dividerColor,
                          )),
                      child: CommonText(
                        text: tab,
                        textColor: _selectedTab == tab ? Colors.white : CustomAppColor.of(context).txtLightGrey,
                        fontFamily: Constant.fontFamilyBold700,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: filteredOrders.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 220.setHeight),
                      Image.asset(
                        AppAssets.imgEmptyOrder,
                        height: 120.setHeight,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonText(
                        text: "No Orders",
                        fontSize: 20.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "You Have Nothing On Your Order List.\n Go Find The Products You Like.",
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: filteredOrders.length,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 30.setHeight,
                        color: CustomAppColor.of(context).dividerColor,
                      );
                    },
                    itemBuilder: (context, index) {
                      final order = filteredOrders[index];
                      return Card(
                        elevation: 0,
                        color: CustomAppColor.of(context).transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                order.imageUrl,
                                width: 110.setHeight,
                                height: 110.setHeight,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 12.0.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonText(
                                        text: order.productName,
                                        fontSize: 18.setFontSize,
                                        fontFamily: Constant.fontFamilyBold700,
                                        height: 2,
                                      ),
                                      if (order.status == 'Active' && order.isCancellable)
                                        InkWell(
                                          onTap: () async {
                                            final shouldRemove = await showModalBottomSheet<bool>(
                                              context: context,
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                              ),
                                              builder: (_) => CancelOrderSheet(item: order),
                                            );

                                            if (shouldRemove == true) {
                                              setState(() {
                                                _allOrders.remove(order);
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                            AppAssets.icTrash,
                                            height: 22.setHeight,
                                            width: 22.setHeight,
                                          ),
                                        ),
                                    ],
                                  ),
                                  CommonText(
                                    text: '\$${order.price.toStringAsFixed(2)}',
                                    fontSize: 18.setFontSize,
                                    fontFamily: Constant.fontFamilyBold700,
                                  ),
                                  const SizedBox(height: 4.0),
                                  CommonText(
                                    text: '${order.quantity} : Qty',
                                    fontSize: 14.setFontSize,
                                    fontFamily: Constant.fontFamilyMedium500,
                                  ),
                                  const SizedBox(width: 8.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(radius: 4, backgroundColor: Colors.orange),
                                          SizedBox(width: 4.setWidth),
                                          CommonText(
                                            text: order.color,
                                            fontSize: 14.setFontSize,
                                            fontFamily: Constant.fontFamilyMedium500,
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (order.status == 'Active' && order.isCancellable) {
                                            Navigator.push(context, TrackOrderScreen.route());
                                          } else if (order.status == 'Completed') {
                                            showDialog(
                                              context: context,
                                              builder: (context) => const ReviewAlertDialog(),
                                            );
                                          } else if (order.status == 'Cancelled') {
                                            Navigator.push(context, CheckoutScreen.route());
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                                            border: Border.all(
                                              color: CustomAppColor.of(context).btnPrimary,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 4.setHeight),
                                          child: CommonText(
                                            text: order.status == 'Active' && order.isCancellable
                                                ? 'Track Order'
                                                : order.status == 'Completed'
                                                    ? 'Leave Review'
                                                    : 'Re-Order',
                                            textColor: CustomAppColor.of(context).txtPrimary,
                                            fontFamily: Constant.fontFamilyBold700,
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
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
