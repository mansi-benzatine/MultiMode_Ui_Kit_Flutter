import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../dashboard/views/dashboard_screen.dart';

class SetDeliveryLocationScreen extends StatefulWidget {
  final bool isShowChangeLocationBs;
  const SetDeliveryLocationScreen({super.key, this.isShowChangeLocationBs = false});
  static Route<void> route({bool isShowChangeLoacationBs = false}) {
    return MaterialPageRoute(
      builder: (_) => SetDeliveryLocationScreen(
        isShowChangeLocationBs: isShowChangeLoacationBs,
      ),
    );
  }

  @override
  State<SetDeliveryLocationScreen> createState() => _SetDeliveryLocationScreenState();
}

class _SetDeliveryLocationScreenState extends State<SetDeliveryLocationScreen> {
  bool _isBottomSheetOpen = false;

  void showChangeLocationBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: false,
      scrollControlDisabledMaxHeightRatio: 0.7,
      backgroundColor: CustomAppColor.of(context).black.withValues(alpha: 0.3),
      barrierColor: CustomAppColor.of(context).black.withValues(alpha: 0.3),
      builder: (context) => const SearchLocationView(),
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isShowChangeLocationBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showChangeLocationBS();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                AppAssets.imgSetAddressLocation,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 22.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScaffold,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtSelectDeliveryLocation.toUpperCase(),
                          textColor: CustomAppColor.of(context).txtGrey,
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                        IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                scrollControlDisabledMaxHeightRatio: 0.7,
                                backgroundColor: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                                barrierColor: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                                builder: (context) => const SearchLocationView(),
                              );
                            },
                            child: CommonText(
                              text: Languages.of(context).txtCHANGE.toUpperCase(),
                              textColor: CustomAppColor.of(context).primary,
                              fontSize: 15.setFontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 29.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets.icSetDeliveryLocation,
                          height: 23.setHeight,
                          width: 23.setWidth,
                        ),
                        SizedBox(width: 7.setWidth),
                        CommonText(
                          text: "Cooper Square",
                          textColor: CustomAppColor.of(context).txtBlack,
                          fontSize: 22.setFontSize,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: "47 W 13th St, New York, NY 10011, USA",
                      textColor: CustomAppColor.of(context).txtBlack,
                      fontSize: 15.setFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 51.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtConfirmLocation.toUpperCase(),
                        onTap: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isFromEmptyCart: false)),
                      ),
                    ),
                    SizedBox(height: 5.setHeight),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20.setWidth,
              top: 64.setHeight,
              child: IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0, isFromEmptyCart: false)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 13.setWidth, vertical: 12.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.asset(
                      AppAssets.icClose,
                      height: 13.setHeight,
                      width: 13.setWidth,
                      color: const Color(0xFF021713),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchLocationView extends StatelessWidget {
  const SearchLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.setHeight, horizontal: 24.setWidth),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtSearchLocation.toUpperCase(),
                fontWeight: FontWeight.w700,
              ),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    AppAssets.icClose,
                    width: 16.setWidth,
                    height: 16.setHeight,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 26.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: searchController,
            hintText: Languages.of(context).txtSearchForYourLocation,
            prefixIcon: AppAssets.icSearch,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.icCurrentLocation,
                height: 22.setHeight,
                width: 22.setWidth,
              ),
              SizedBox(width: 12.setWidth),
              CommonText(
                text: Languages.of(context).txtUseCurrentLocation,
                textColor: CustomAppColor.of(context).primary,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          SizedBox(height: 22.setHeight),
          CommonText(
            text: Languages.of(context).txtRecentLocations,
            textColor: CustomAppColor.of(context).txtBlack,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
