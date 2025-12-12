import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/bottom_sheet/select_option_bottom_sheet.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class AddressScreen extends StatefulWidget {
  final bool isShowSelectOptionBs;

  static Route<void> route({bool isShowSelectOptionBs = false}) {
    return MaterialPageRoute(
      builder: (_) => AddressScreen(isShowSelectOptionBs: isShowSelectOptionBs),
    );
  }

  const AddressScreen({super.key, this.isShowSelectOptionBs = false});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> implements TopBarClickListener {
  final List<Map<String, String>> addresses = [
    {
      'title': 'Square Building',
      'subtitle': '47 W 13th St, New York, NY 10011, USA',
    },
    {
      'title': 'Aurga Flats',
      'subtitle': '47 W 13th St, New York, NY 10011, USA',
    },
  ];

  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowSelectOptionBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        Utils.showBottomSheetDialog(
          context,
          isDismissible: true,
          widgets: const SelectOptionBottomSheet(),
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtAddress,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: addresses.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.setHeight),
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: CustomAppColor.of(context).border),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4.setHeight),
                                    child: Image.asset(
                                      AppAssets.icLocation,
                                      width: 18.setWidth,
                                      height: 18.setHeight,
                                      color: CustomAppColor.of(context).icBlackWhite,
                                    ),
                                  ),
                                  SizedBox(width: 6.setWidth),
                                  CommonText(
                                    text: address['title']!,
                                    fontSize: 16.setFontSize,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.setHeight),
                              CommonText(
                                text: address['subtitle']!,
                                fontSize: 13.setFontSize,
                                textColor: CustomAppColor.of(context).txtGray,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.more_vert,
                            color: CustomAppColor.of(context).icGray,
                          ),
                          onTap: () {
                            Utils.showBottomSheetDialog(context, widgets: const SelectOptionBottomSheet());
                          },
                        )
                      ],
                    ),
                  );
                },
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
