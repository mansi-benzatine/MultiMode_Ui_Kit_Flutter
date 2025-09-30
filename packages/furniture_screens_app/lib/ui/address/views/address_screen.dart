import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

class AddressScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddressScreen());
  }

  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> implements TopBarClickListener {
  int selectedIndex = 0;

  final List<Map<String, String>> addresses = [
    {
      "title": "Home",
      "subtitle": "201 Washingtone Ave, Kentucky \n39495",
      "icon": AppAssets.icHome,
    },
    {
      "title": "Office",
      "subtitle": "201 Washingtone Ave, Kentucky \n39495",
      "icon": AppAssets.icOffice,
    },
    {
      "title": "Apartment",
      "subtitle": "201 Washingtone Ave, Kentucky \n39495",
      "icon": AppAssets.icBuilding,
    },
    {
      "title": "Parent's House",
      "subtitle": "201 Washingtone Ave, Kentucky \n39495",
      "icon": AppAssets.icHome,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: "Address",
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 12),
              itemCount: addresses.length,
              separatorBuilder: (_, __) => Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                final item = addresses[index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).containerBg,
                          ),
                          child: Image.asset(
                            item["icon"]!,
                            height: 20.setHeight,
                            width: 20.setWidth,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                        SizedBox(width: 16.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: item["title"]!,
                                fontSize: 18.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                              ),
                              SizedBox(height: 4.setHeight),
                              CommonText(
                                text: item["subtitle"]!,
                                fontSize: 14.setFontSize,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 26.setHeight,
                            width: 26.setWidth,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedIndex == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.2),
                                width: 1,
                              ),
                              color: selectedIndex == index ? CustomAppColor.of(context).primary : Colors.transparent,
                            ),
                            child: selectedIndex == index
                                ? const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
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
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
