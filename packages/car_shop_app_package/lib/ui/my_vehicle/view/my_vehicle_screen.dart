import 'dart:io';

import 'package:flutter/material.dart';
import 'package:car_shop_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../car_detail/view/car_detail_screen.dart';
import '../../home/view/home_screen.dart';

class MyVehicleScreen extends StatefulWidget {
  const MyVehicleScreen({super.key});

  @override
  State<MyVehicleScreen> createState() => _MyVehicleScreenState();
}

class _MyVehicleScreenState extends State<MyVehicleScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;

  // Sample vehicle data
  List<VehicleItem> activeVehicles = [
    VehicleItem(
      carName: "Toyota Innova Crysta",
      year: "2020",
      kmsDriven: "10,000 Km",
      fuelType: "Diesel",
      location: "New York",
      price: "₹20.00 Lakh",
      uploadDate: "Upload On 18 July 2025",
      image: AppAssets.imgToyota,
    ),
    VehicleItem(
      carName: "BMW X3",
      year: "2019",
      kmsDriven: "25,000 Km",
      fuelType: "Petrol",
      location: "California",
      price: "₹45.00 Lakh",
      uploadDate: "Upload On 15 July 2025",
      image: AppAssets.imgMercedes,
    ),
  ];

  List<VehicleItem> inactiveVehicles = [
    VehicleItem(
      carName: "Tesla Model Y",
      year: "2021",
      kmsDriven: "5,000 Km",
      fuelType: "Electric",
      location: "Texas",
      price: "₹55.00 Lakh",
      uploadDate: "Upload On 10 July 2025",
      image: AppAssets.imgTesla,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              title: Languages.of(context).txtMyVehicle,
              isShowBack: true,
            ),
            // Tab Bar
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: CustomAppColor.of(context).tabSelectedTxtColor2,
              unselectedLabelColor: CustomAppColor.of(context).tabTxtColor2,
              labelStyle: TextStyle(
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: Constant.fontFamily,
                color: CustomAppColor.of(context).tabSelectedTxtColor2,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamily,
                color: CustomAppColor.of(context).tabTxtColor2,
              ),
              indicatorWeight: 2,

              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              indicatorColor: CustomAppColor.of(context).primary,
              indicatorPadding: EdgeInsets.only(
                top: Platform.isAndroid ? 35.setHeight : 40.setHeight,
              ),

              // labelPadding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth),
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                gradient: CustomAppColor.of(context).primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: const [
                Tab(text: "Active"),
                Tab(text: "In Active"),
              ],
            ),
            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildVehicleList(activeVehicles),
                  _buildVehicleList(inactiveVehicles),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleList(List<VehicleItem> vehicles) {
    if (vehicles.isEmpty) {
      return Center(
        child: CommonText(
          text: "No vehicles found",
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGray,
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        return _buildVehicleCard(vehicles[index]);
      },
    );
  }

  Widget _buildVehicleCard(VehicleItem vehicle) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailScreen(
              car: PopularCarItem(
                carName: vehicle.carName,
                carImage: vehicle.image,
                carPrice: vehicle.price,
                carDescription: vehicle.kmsDriven,
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).transparent,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: CustomAppColor.of(context).containerBorder,
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.setWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Image
              Container(
                width: 80.setWidth,
                height: 80.setHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: CustomAppColor.of(context).bgSearchBar,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    vehicle.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 15.setWidth),
              // Car Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car Name
                    CommonText(
                      text: vehicle.carName,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    // Car Details Row
                    CommonText(
                      text: "${vehicle.year} | ${vehicle.kmsDriven} | ${vehicle.fuelType} | ${vehicle.location}",
                      fontSize: 10.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 8.setHeight),
                    // Price
                    CommonText(
                      text: vehicle.price,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.setHeight),
                    // Upload Date
                    Align(
                      alignment: Alignment.centerRight,
                      child: CommonText(
                        text: vehicle.uploadDate,
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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

// Vehicle data model
class VehicleItem {
  final String carName;
  final String year;
  final String kmsDriven;
  final String fuelType;
  final String location;
  final String price;
  final String uploadDate;
  final String image;

  VehicleItem({
    required this.carName,
    required this.year,
    required this.kmsDriven,
    required this.fuelType,
    required this.location,
    required this.price,
    required this.uploadDate,
    required this.image,
  });
}
