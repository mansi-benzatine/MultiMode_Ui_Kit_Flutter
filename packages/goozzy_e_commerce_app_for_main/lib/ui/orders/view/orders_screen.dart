import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../ui/track_order/views/track_order_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../datamodel/orders_data.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const OrdersScreen());
  }

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<String> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).allOrder,
      Languages.of(context).pending,
      Languages.of(context).processing,
      Languages.of(context).delivered,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgTopBar,
      body: Column(
        children: [
          _tabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabList.map((tab) {
                if (tab == Languages.of(context).allOrder) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return _buildOrderCard(order, context);
                    },
                  );
                } else if (tab == Languages.of(context).pending) {
                  final pendingOrders = orders.where((order) => order.status == Languages.of(context).orderPending).toList();

                  if (pendingOrders.isEmpty) {
                    return Center(
                      child: _emptyHistory(context),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: pendingOrders.length,
                    itemBuilder: (context, index) {
                      final order = pendingOrders[index];
                      return _buildOrderCard(order, context);
                    },
                  );
                } else if (tab == Languages.of(context).processing) {
                  final pendingOrders = orders.where((order) => order.status == Languages.of(context).orderProcessing).toList();

                  if (pendingOrders.isEmpty) {
                    return Center(
                      child: _emptyHistory(context),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: pendingOrders.length,
                    itemBuilder: (context, index) {
                      final order = pendingOrders[index];
                      return _buildOrderCard(order, context);
                    },
                  );
                } else if (tab == Languages.of(context).delivered) {
                  final deliveredOrder = orders.where((order) => order.status == Languages.of(context).orderDelivered).toList();

                  if (deliveredOrder.isNotEmpty) {
                    return Center(
                      child: _emptyHistory(context),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: deliveredOrder.length,
                    itemBuilder: (context, index) {
                      final order = deliveredOrder[index];
                      return _buildOrderCard(order, context);
                    },
                  );
                } else {
                  return Center(
                    child: SingleChildScrollView(
                      child: _emptyHistory(context),
                    ),
                  );
                }
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _tabBar() {
    return Container(
      color: CustomAppColor.of(context).icWhite,
      child: TabBar(
        padding: EdgeInsets.zero,
        controller: _tabController,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14)),
        isScrollable: true,
        unselectedLabelColor: AppColor.txtGrey,
        labelStyle: TextStyle(
          fontFamily: Constant.fontFamilyUrbanist,
          fontSize: AppSizes.setFontSize(18),
          fontWeight: FontWeight.w500,
        ),
        labelColor: AppColor.txtPurple,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
          insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(26)),
        ),
        tabs: tabList.map((tab) {
          return Tab(
            text: tab,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrderCard(OrderModel order, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.setHeight(16)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(14), horizontal: AppSizes.setWidth(5)),
        color: CustomAppColor.of(context).bgScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(38)),
                  child: Image.asset(
                    order.iconUrl,
                    height: AppSizes.setHeight(32),
                    width: AppSizes.setWidth(32),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: order.status,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(15),
                      textColor: _getStatusColor(order.status),
                    ),
                    SizedBox(height: AppSizes.setWidth(4)),
                    CommonText(
                      text: order.date,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(15),
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    SizedBox(height: AppSizes.setWidth(4)),
                    Row(
                      children: [
                        CommonText(
                          text: Languages.of(context).orderId,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.setFontSize(15),
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                        SizedBox(width: AppSizes.setWidth(6)),
                        CommonText(
                          text: order.orderId,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.setFontSize(15),
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppSizes.setHeight(23)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
              child: Row(
                children: [
                  Image.asset(
                    order.imageUrl,
                    height: AppSizes.setHeight(89),
                    width: AppSizes.setWidth(89),
                  ),
                  SizedBox(width: AppSizes.setWidth(10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: order.productName,
                          fontSize: AppSizes.setFontSize(15),
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: AppSizes.setHeight(8)),
                        Row(
                          children: [
                            CommonText(
                              text: Languages.of(context).price,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                            SizedBox(width: AppSizes.setWidth(8)),
                            CommonText(
                              text: "\$${order.price}",
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.setHeight(6)),
                        Row(
                          children: [
                            CommonText(
                              text: Languages.of(context).paymentMode,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                            SizedBox(width: AppSizes.setWidth(8)),
                            CommonText(
                              text: order.paymentMode,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.setHeight(6)),
                        Row(
                          children: [
                            CommonText(
                              text: Languages.of(context).size,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                            SizedBox(width: AppSizes.setWidth(8)),
                            CommonText(
                              text: order.size,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: AppSizes.setWidth(14)),
                            CommonText(
                              text: Languages.of(context).qty,
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                            SizedBox(width: AppSizes.setWidth(8)),
                            CommonText(
                              text: order.quantity.toString(),
                              fontSize: AppSizes.setFontSize(15),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.setHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: (order.actions ?? []).isNotEmpty
                  ? order.actions!
                      .map((action) => Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(15), vertical: AppSizes.setHeight(10)),
                              child: CommonButton(
                                height: AppSizes.setHeight(30),
                                width: AppSizes.setWidth(158),
                                radius: 2,
                                borderColor: action == (Languages.of(context).track) || action == (Languages.of(context).reviewNow)
                                    ? CustomAppColor.of(context).btnPurple
                                    : CustomAppColor.of(context).btnPurple,
                                buttonColor: action == (Languages.of(context).track) || action == (Languages.of(context).reviewNow)
                                    ? CustomAppColor.of(context).btnPurple
                                    : CustomAppColor.of(context).bgScaffold,
                                isButtonShadow: action == (Languages.of(context).track) || action == (Languages.of(context).reviewNow) ? true : false,
                                child: CommonText(
                                  text: action.toUpperCase(),
                                  textColor: action == (Languages.of(context).track) || action == (Languages.of(context).reviewNow)
                                      ? CustomAppColor.of(context).white
                                      : CustomAppColor.of(context).btnPurple,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppSizes.setFontSize(12),
                                ),
                                onTap: () => action == Languages.of(context).cancel
                                    ? reasonOfCancellation(context)
                                    : Navigator.push(context, TrackOrderScreen.route()),
                              ),
                            ),
                          ))
                      .toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Order Confirmed":
        return CustomAppColor.of(context).green;
      case "Order Cancelled":
        return CustomAppColor.of(context).red;
      case "Order Processing":
        return AppColor.containerLightBlue;
      case "Order Delivered":
        return CustomAppColor.of(context).green;
      case "Order Pending":
        return AppColor.orange;
      case "Order Dispatched":
        return AppColor.txtDarkBlue;
      default:
        return Colors.black;
    }
  }

  void reasonOfCancellation(BuildContext context) {
    String? selectedReason;

    customBottomSheet(
      isPaddingRequired: false,
      isDone: false,
      context: context,
      title: Languages.of(context).reasonOfCancellation.toUpperCase(),
      content: StatefulBuilder(
        builder: (context, setState) {
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
                child: CommonText(
                  text: Languages.of(context).pleaseTellUsCorrectReasonOfCancellation,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: AppSizes.setHeight(10)),
              Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.grey,
                  radioTheme: RadioThemeData(
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        return states.contains(WidgetState.selected) ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).txtGrey;
                      },
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
                  child: Column(
                    children: reasons.map((reason) {
                      return RadioListTile<String>(
                        title: CommonText(
                          text: reason.reason,
                          textColor: CustomAppColor.of(context).txtGrey,
                          textAlign: TextAlign.start,
                        ),
                        value: reason.reason,
                        groupValue: selectedReason,
                        onChanged: (String? value) {
                          setState(() {
                            // This updates the state inside the bottom sheet
                            selectedReason = value;
                          });
                        },
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.setHeight(10)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
                child: CommonTextFormField(
                  radius: 6,
                  hintText: Languages.of(context).enterAdditionalCommentsHere,
                  hintStyle: TextStyle(
                    color: CustomAppColor.of(context).txtGrey,
                    fontSize: AppSizes.setFontSize(15),
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 4,
                ),
              ),
              SizedBox(height: AppSizes.setHeight(10)),
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgBlackWhiteScaffold,
                  border: Border(
                    top: BorderSide(color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5)),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(18)),
                child: CommonButton(
                  height: AppSizes.setHeight(44),
                  radius: 3,
                  btnText: Languages.of(context).cancelNow,
                  onTap: () {
                    // Navigator.pop(context);
                    orderCancelled(context);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void orderCancelled(BuildContext context) {
    customBottomSheet(
      isPaddingRequired: false,
      maxHeightRatio: 0.50,
      isDone: false,
      context: context,
      title: Languages.of(context).orderCancelled.toUpperCase(),
      content: Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                child: Image.asset(
                  AppAssets.imgOrderCancelled,
                  width: AppSizes.setWidth(200),
                  height: AppSizes.setHeight(146),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.setHeight(20)),
                child: CommonText(
                  text: Languages.of(context).yourOrderCancelledNow,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: AppSizes.setFontSize(15),
                ),
              ),
              SizedBox(height: AppSizes.setHeight(10)),
              Container(
                decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgBlackWhiteScaffold,
                    border: Border(top: BorderSide(color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5)))),
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(10)),
                child: CommonButton(
                  height: AppSizes.setHeight(44),
                  radius: 3,
                  btnText: Languages.of(context).done,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _emptyHistory(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgEmptyOrder,
          height: AppSizes.setHeight(208),
          width: AppSizes.setWidth(250),
        ),
        SizedBox(height: AppSizes.setHeight(24)),
        CommonText(
          text: Languages.of(context).orderHistoryIsEmpty,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(15),
        ),
        SizedBox(height: AppSizes.setHeight(10)),
        CommonText(
          text: Languages.of(context).addTheItemsToYourCart,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.setFontSize(12),
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        SizedBox(height: AppSizes.setHeight(24)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
          child: CommonButton(
            radius: 3,
            height: AppSizes.setHeight(44),
            btnText: Languages.of(context).goToShopping,
          ),
        )
      ],
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    // TODO: implement onTopBarClick
  }
}
