import 'package:flutter/material.dart';
import 'package:grokit_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/utils/utils.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class EnterYourLocation extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EnterYourLocation());
  }

  const EnterYourLocation({super.key});

  @override
  State<EnterYourLocation> createState() => _EnterYourLocationState();
}

class _EnterYourLocationState extends State<EnterYourLocation> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> addressList = [];

  _fillData() {
    addressList = [
      {
        'title': "Lorem Ipsum",
        'description': "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      },
      {
        'title': "Lorem Ipsum",
        'description': "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgTopbar,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200.setHeight,
            ),
            Padding(
              padding: EdgeInsets.only(top: 55.setHeight, left: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtYourLocation.replaceAll(" ", "\n"),
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 24.setFontSize,
                    textAlign: TextAlign.start,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 165.setHeight,
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 0.setHeight,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).cardBgBlackWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.07),
                      blurRadius: 14,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtYourLocationDesc,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: searchController,
                        hintText: Languages.of(context).txtSearchYourLocation,
                        prefixIcon: AppAssets.icSearch,
                        prefixIconColor: CustomAppColor.of(context).icBlackWhite,
                        fillColor: CustomAppColor.of(context).unselectedCard,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonText(
                        text: Languages.of(context).txtSearchResult,
                        fontFamily: Constant.fontFamilyMedium500,
                        fontSize: 15.setFontSize,
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 15.setHeight),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = addressList[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.icLocation,
                                height: 20.setHeight,
                                width: 20.setWidth,
                                color: CustomAppColor.of(context).icBlackWhite,
                              ),
                              SizedBox(width: 16.setWidth),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: item['title'] ?? '',
                                      fontSize: 14.setFontSize,
                                      fontFamily: Constant.fontFamilySemiBold600,
                                    ),
                                    SizedBox(height: 5.setHeight),
                                    CommonText(
                                      text: item['description'] ?? '',
                                      maxLines: 2,
                                      fontSize: 12.setFontSize,
                                      textAlign: TextAlign.start,
                                      textColor: CustomAppColor.of(context).txtGray,
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 36,
                            color: CustomAppColor.of(context).border,
                          );
                        },
                        itemCount: addressList.length,
                      ),
                      SizedBox(height: 40.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          height: 40.setHeight,
                          onTap: () => Navigator.push(context, DashboardScreen.route()),
                          text: Languages.of(context).txtSetLocation,
                          borderColor: CustomAppColor.of(context).borderPrimary,
                          buttonColor: CustomAppColor.of(context).buttonPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
