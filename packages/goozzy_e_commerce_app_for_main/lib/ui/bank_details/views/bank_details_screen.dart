import 'package:flutter/material.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/app/my_app.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../utils/string_constant.dart';

class BankDetailsScreen extends StatelessWidget implements TopBarClickListener {
  const BankDetailsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const BankDetailsScreen());
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
              isShowBack: true,
              title: Languages.of(context).myBankDetails,
              textColor: CustomAppColor.of(context).txtBlack,
              topBarColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _detailsFields(context),
                    Container(
                      color: CustomAppColor.of(context).bgTopBar,
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(18)),
                      child: CommonText(
                        text: Languages.of(context).pleaseEnterCorrectBankDetail,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgBlackWhiteScaffold,
                border: Border(
                  top: BorderSide(color: CustomAppColor.of(context).dividerGrey, width: 2),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18), horizontal: AppSizes.setWidth(22)),
              child: CommonButton(
                radius: 4,
                height: AppSizes.setHeight(44),
                onTap: () => Navigator.pop(context),
                child: CommonText(
                  text: Languages.of(context).submit,
                  fontSize: AppSizes.setFontSize(14),
                  textColor: CustomAppColor.of(context).white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _detailsFields(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(20)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        children: [
          CommonTextFormField(
            hintText: Languages.of(context).addPassbookOrUploadPhoto,
            maxLines: 3,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            radius: 6,
            leadingIcon: Padding(
              padding: EdgeInsets.only(left: AppSizes.setWidth(26), right: AppSizes.setWidth(17)),
              child: Image.asset(
                AppAssets.icCamera,
                height: AppSizes.setHeight(24),
                width: AppSizes.setWidth(36),
              ),
            ),
            hintStyle: TextStyle(
              height: AppSizes.setHeight(6),
              color: CustomAppColor.of(context).txtGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
            child: CommonTextFormField(
              radius: 6,
              hintText: Languages.of(context).accountNumber,
            ),
          ),
          CommonTextFormField(
            radius: 6,
            hintText: Languages.of(context).confirmAccountNumber,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
            child: CommonTextFormField(
              radius: 6,
              hintText: Languages.of(context).accountHolderName,
            ),
          ),
          CommonTextFormField(
            radius: 6,
            hintText: Languages.of(context).ifscCode,
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceMyApp.navigatorKey.currentState!.context);
    }
  }
}
