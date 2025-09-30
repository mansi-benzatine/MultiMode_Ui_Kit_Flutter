import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/add_new_address/views/add_new_address_screen.dart';
import 'package:furniture_app_package/ui/edit_address/view/edit_address_screen.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';

class EditAddressListScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAddressListScreen());
  }

  const EditAddressListScreen({super.key});

  @override
  State<EditAddressListScreen> createState() => _EditAddressListScreenState();
}

class _EditAddressListScreenState extends State<EditAddressListScreen> implements TopBarClickListener {
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtEditAddress,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 12),
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final item = addresses[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 20.setWidth),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(22)),
                        border: Border.all(
                          color: CustomAppColor.of(context).dividerColor,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(14),
                            margin: EdgeInsets.only(bottom: 8.setHeight),
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
                          SizedBox(width: 12.setWidth),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: item["title"]!,
                                  fontSize: 18.setFontSize,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  height: 0,
                                ),
                                SizedBox(height: 2.setHeight),
                                CommonText(
                                  text: item["subtitle"]!,
                                  fontSize: 14.setFontSize,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  textColor: CustomAppColor.of(context).txtLightGrey,
                                  height: 0,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(context, EditAddressScreen.route()),
                            child: Image.asset(
                              AppAssets.icEdit,
                              height: 22.setHeight,
                              width: 22.setWidth,
                              color: CustomAppColor.of(context).icBlackWhite,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: GestureDetector(
                onTap: () => Navigator.push(context, AddNewAddressScreen.route()),
                child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: const Radius.circular(40),
                      dashPattern: [5, 5],
                      strokeWidth: 0.5,
                      padding: const EdgeInsets.all(14),
                      color: CustomAppColor.of(context).primary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: CustomAppColor.of(context).txtPrimary,
                        ),
                        SizedBox(width: 12.setWidth),
                        CommonText(
                          text: Languages.of(context).txtAddNewAddress,
                          textColor: CustomAppColor.of(context).txtPrimary,
                          fontFamily: Constant.fontFamilyBold700,
                          fontSize: 18.setFontSize,
                          height: 0,
                        )
                      ],
                    )),
              ),
            )
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
