import 'package:flutter/material.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../app/my_app.dart';
import '../datamodel/notification_data.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const NotificationsScreen());
  }

  @override
  NotificationsScreenState createState() => NotificationsScreenState();
}

class NotificationsScreenState extends State<NotificationsScreen> with TickerProviderStateMixin implements TopBarClickListener {
  String selectedTab = "All";
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
      Languages.of(context).all,
      Languages.of(context).orderInfo,
      Languages.of(context).offers,
      Languages.of(context).payment,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            TopBar(
              this,
              isShowShadow: false,
              title: Languages.of(context).notification,
              textColor: CustomAppColor.of(context).txtBlack,
              topBarColor: CustomAppColor.of(context).bgScaffold,
              isShowBack: true,
            ),
            Expanded(
              child: Column(
                children: [
                  _tabBar(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: tabList.map((tab) {
                        if (tab == Languages.of(context).allOrder) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              final notification = notifications[index];
                              return _buildNotificationCard(notification);
                            },
                          );
                        } else if (tab == Languages.of(context).orderInfo) {
                          final orderInfo = notifications.where((notifications) => notifications.type == Languages.of(context).orderInfo).toList();

                          if (orderInfo.isEmpty) {
                            return Center(
                              child: _emptyHistory(context),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: orderInfo.length,
                            itemBuilder: (context, index) {
                              final order = orderInfo[index];
                              return _buildNotificationCard(order);
                            },
                          );
                        } else if (tab == Languages.of(context).offers) {
                          final offers = notifications.where((notifications) => notifications.type == Languages.of(context).offers).toList();

                          if (offers.isEmpty) {
                            return Center(
                              child: _emptyHistory(context),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: offers.length,
                            itemBuilder: (context, index) {
                              final order = offers[index];
                              return _buildNotificationCard(order);
                            },
                          );
                        } else if (tab == Languages.of(context).payment) {
                          final payments = notifications.where((notifications) => notifications.type == Languages.of(context).payment).toList();

                          if (payments.isNotEmpty) {
                            return Center(
                              child: _emptyHistory(context),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: payments.length,
                            itemBuilder: (context, index) {
                              final payment = payments[index];
                              return _buildNotificationCard(payment);
                            },
                          );
                        } else {
                          return ListView.builder(
                            padding: const EdgeInsets.all(8.0),
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              return _buildNotificationCard(notifications[index]);
                            },
                          );
                        }
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tabBar() {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(25)),
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
          insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
        ),
        tabs: tabList.map((tab) {
          return Tab(
            text: tab,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNotificationCard(OrderNotification notification) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(8)),
        color: CustomAppColor.of(context).bgContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                notification.imageUrl,
                width: AppSizes.setWidth(69),
                height: AppSizes.setHeight(62),
                fit: BoxFit.cover,
              ),
              SizedBox(width: AppSizes.setWidth(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: notification.title,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(15),
                    ),
                    const SizedBox(height: 5),
                    CommonText(
                      text: "${notification.date}  ${notification.time}",
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontSize: AppSizes.setFontSize(12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _emptyHistory(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              AppAssets.imgEmptyNotification,
              height: AppSizes.setHeight(208),
              width: AppSizes.setWidth(250),
            ),
            Positioned(
              right: AppSizes.setWidth(60),
              bottom: AppSizes.setHeight(40),
              child: Container(
                padding: EdgeInsets.all(AppSizes.setHeight(14)),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).green,
                  shape: BoxShape.circle,
                ),
                child: CommonText(
                  text: "0",
                  fontSize: AppSizes.setFontSize(16),
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.setHeight(24)),
        CommonText(
          text: Languages.of(context).noNotification,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
          textColor: CustomAppColor.of(context).txtPurple,
        ),
        SizedBox(height: AppSizes.setHeight(10)),
        CommonText(
          text: Languages.of(context).youDontHaveAnyNotificationAtThisTime,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.setFontSize(16),
          textColor: CustomAppColor.of(context).txtGrey,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceMyApp.navigatorKey.currentState!.context);
    }
  }
}
