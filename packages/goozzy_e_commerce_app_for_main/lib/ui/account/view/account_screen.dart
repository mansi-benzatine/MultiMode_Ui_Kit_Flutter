import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/bank_details/views/bank_details_screen.dart';
import '../../../../../../ui/my_catalogs/views/my_catalogs_screen.dart';
import '../../../../../../ui/notification_settings/views/notification_setting_screen.dart';
import '../../../../../../ui/profile/view/profile_screen.dart';
import '../../../../../../ui/settings/views/settings_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../widgets/common_richtext/common_richtext.dart';
import '../../../widgets/textfield/common_digit_textformfield.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../refer_and_earn/view/refer_and_earn_screen.dart';
import '../datamodel/account_data.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const AccountScreen());
  }

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> implements TopBarClickListener {
  bool isAccountCreated = false;

  void accountCreated() {
    setState(() {
      isAccountCreated = !isAccountCreated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgTopBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (!isAccountCreated) _profileDetail(),
            if (isAccountCreated) _profileDetailHorizontal(),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(15), bottom: isAccountCreated ? AppSizes.setHeight(0) : AppSizes.setHeight(5)),
              child: _accountActionList(isAccountCreated),
            ),
            _appVersionInfo(),
          ],
        ),
      ),
    );
  }

  _profileDetail() {
    return Container(
      width: AppSizes.fullWidth,
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(13)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                AppAssets.icAvatar,
                height: AppSizes.setHeight(74),
                width: AppSizes.setWidth(74),
                fit: BoxFit.contain,
              ),
            ),
          ),
          CommonButton(
            width: AppSizes.setWidth(93),
            height: AppSizes.setHeight(34),
            btnText: Languages.of(context).signUp,
            fontSize: AppSizes.setFontSize(14),
            radius: 4,
            onTap: () => signUpBottomSheet(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(10), bottom: AppSizes.setHeight(22)),
            child: CommonText(
              text: Languages.of(context).viewAndUpdateYourProfile,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtGrey,
              fontSize: AppSizes.setFontSize(15),
            ),
          )
        ],
      ),
    );
  }

  _profileDetailHorizontal() {
    return InkWell(
      onTap: () => Navigator.push(context, ProfileScreen.route()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(16)),
        width: AppSizes.fullWidth,
        color: CustomAppColor.of(context).bgScaffold,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppAssets.icAvatar,
              height: AppSizes.setHeight(74),
              width: AppSizes.setWidth(74),
              fit: BoxFit.contain,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  text: AppStrings.phoneNumber,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontSize: AppSizes.setFontSize(18),
                ),
                CommonText(
                  text: Languages.of(context).viewAndUpdateYourProfile,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontSize: AppSizes.setFontSize(12),
                ),
              ],
            ),
            Image.asset(
              AppAssets.icRightArrow,
              height: AppSizes.setHeight(24),
              width: AppSizes.setWidth(24),
            )
          ],
        ),
      ),
    );
  }

  _accountActionList(bool isAccountCreated) {
    int itemCount = isAccountCreated ? accountList.length : accountList.length - 1;

    return Container(
      color: CustomAppColor.of(context).txtWhite,
      width: AppSizes.setWidth(375),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount >= 0 ? itemCount : 0,
        itemBuilder: (context, index) {
          final accountData = accountList[index];

          return Container(
            height: AppSizes.setHeight(58),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgScaffold,
              border: Border(
                bottom: BorderSide(
                  color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.2),
                  width: 1.0,
                ),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16)),
              onTap: () {
                if (accountData.label == Languages.of(context).logout) {
                  logoutBottomSheet(context);
                } else if (accountData.label == Languages.of(context).myBankDetails) {
                  Navigator.push(context, BankDetailsScreen.route());
                } else if (accountData.label == Languages.of(context).mySharedCatalogs) {
                  Navigator.push(context, MyCatalogsScreen.route());
                } else if (accountData.label == Languages.of(context).referAndEarn) {
                  Navigator.push(context, ReferAndEarnScreen.route());
                } else if (accountData.label == Languages.of(context).referAndEarn) {
                  referralBottomSheet(context);
                } else if (accountData.label == Languages.of(context).settings) {
                  Navigator.push(context, SettingsScreen.route());
                } else if (accountData.label == Languages.of(context).notificationSettings) {
                  Navigator.push(context, NotificationSettingsScreen.route());
                } else {}
              },
              leading: Image.asset(
                accountData.leadingIcon,
                height: AppSizes.setHeight(22),
                width: AppSizes.setWidth(22),
                color: CustomAppColor.of(context).txtGrey,
              ),
              title: CommonText(
                text: accountData.label,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
                textAlign: TextAlign.start,
              ),
              trailing: accountData.isSuffixIcon ?? false
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(1)),
                      child: Image.asset(
                        AppAssets.icRightArrow,
                        height: AppSizes.setHeight(24),
                        width: AppSizes.setWidth(24),
                      ),
                    )
                  : accountData.isNavigate ?? false
                      ? const SizedBox()
                      : Container(
                          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(3)),
                          width: AppSizes.setWidth(45),
                          height: AppSizes.setHeight(25),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).btnPurple.withOpacityPercent(0.2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CommonText(
                            text: Languages.of(context).newFeature,
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.setFontSize(12),
                            textColor: CustomAppColor.of(context).txtPurple,
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }

  _appVersionInfo() {
    return Container(
      color: CustomAppColor.of(context).txtWhite,
      width: AppSizes.setWidth(375),
      height: AppSizes.setHeight(120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(
            text: Languages.of(context).goozzy,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(24),
            textColor: CustomAppColor.of(context).txtPurple,
          ),
          CommonText(
            text: "V1.0",
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(15),
            textColor: CustomAppColor.of(context).txtGrey,
          )
        ],
      ),
    );
  }

  void signUpBottomSheet(BuildContext context) {
    customBottomSheet(
      isDone: false,
      maxHeightRatio: 0.55,
      context: context,
      title: Languages.of(context).signUpToContinue,
      content: Padding(
        padding: EdgeInsets.only(top: AppSizes.setHeight(60)),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: CommonTextFormField(
                    isCountryLabelVisible: true,
                    isPhoneNumberField: true,
                    labelText: Languages.of(context).country,
                  ),
                ),
                SizedBox(width: AppSizes.setWidth(10)),
                Flexible(
                  flex: 6,
                  child: CommonTextFormField(
                    fillColor: CustomAppColor.of(context).bgScaffold,
                    labelText: Languages.of(context).phoneNumber,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(35)),
              child: CommonButton(
                  btnText: Languages.of(context).sendOtp,
                  onTap: () {
                    Navigator.pop(context);
                    sendOtpBottomSheet(context);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
              child: CommonText(
                text: Languages.of(context).byContinuingYouAgreeToGoozzy,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
                fontSize: AppSizes.setFontSize(15),
              ),
            ),
            CommonRichText(
              firstText: Languages.of(context).termsAndCondition,
              middleText: Languages.of(context).and,
              lastText: Languages.of(context).privacyPolicy,
            )
          ],
        ),
      ),
    );
  }

  void sendOtpBottomSheet(BuildContext context) {
    customBottomSheet(
      isDone: false,
      maxHeightRatio: 0.55,
      context: context,
      title: Languages.of(context).otpVerification,
      content: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: Languages.of(context).codeIsSentTo,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                CommonText(
                  text: AppStrings.phoneNumber,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppSizes.setWidth(58),
                  height: AppSizes.setHeight(60),
                  child: SingleDigitTextField(
                    controller: TextEditingController(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                  child: SizedBox(
                    width: AppSizes.setWidth(58),
                    height: AppSizes.setHeight(60),
                    child: SingleDigitTextField(
                      controller: TextEditingController(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                  child: SizedBox(
                    width: AppSizes.setWidth(58),
                    height: AppSizes.setHeight(60),
                    child: SingleDigitTextField(
                      controller: TextEditingController(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                  child: SizedBox(
                    width: AppSizes.setWidth(58),
                    height: AppSizes.setHeight(60),
                    child: SingleDigitTextField(
                      controller: TextEditingController(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonButton(
            btnText: Languages.of(context).proceed,
            onTap: () {
              Navigator.pop(context);
              accountCreatedBottomSheet(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(26)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: Languages.of(context).didntReceiveTheCode,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                CommonText(
                  text: Languages.of(context).resendOtp,
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtPurple,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(39), left: AppSizes.setWidth(41), right: AppSizes.setWidth(30)),
            child: CommonText(
              text: Languages.of(context).byContinuingYouAgreeToGoozzy,
              fontSize: AppSizes.setFontSize(15),
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
          ),
          CommonRichText(
            firstText: Languages.of(context).termsAndCondition,
            middleText: Languages.of(context).and,
            lastText: Languages.of(context).privacyPolicy,
          )
        ],
      ),
    );
  }

  void accountCreatedBottomSheet(BuildContext context) {
    customBottomSheet(
      isDone: false,
      context: context,
      maxHeightRatio: 0.68,
      title: Languages.of(context).accountCreated,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppSizes.setHeight(1),
                left: AppSizes.setWidth(22),
                right: AppSizes.setWidth(22),
              ),
              child: Image.asset(
                AppAssets.imgAccountCreated,
                width: AppSizes.setWidth(200),
                height: AppSizes.setHeight(200),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(25)),
              child: CommonText(
                text: Languages.of(context).yourAccountCreated,
                fontSize: AppSizes.setFontSize(15),
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(20), bottom: AppSizes.setHeight(20)),
              child: CommonButton(
                  btnText: Languages.of(context).txtContinue,
                  onTap: () {
                    accountCreated();
                    Navigator.pop(context);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(20), left: AppSizes.setWidth(41), right: AppSizes.setWidth(30)),
              child: CommonText(
                text: Languages.of(context).byContinuingYouAgreeToGoozzy,
                fontSize: AppSizes.setFontSize(15),
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ),
            CommonRichText(
              firstText: Languages.of(context).termsAndCondition,
              middleText: Languages.of(context).and,
              lastText: Languages.of(context).privacyPolicy,
            )
          ],
        ),
      ),
    );
  }

  void logoutBottomSheet(BuildContext context) {
    customBottomSheet(
      isPaddingRequired: false,
      isDone: false,
      maxHeightRatio: 0.4,
      context: context,
      title: Languages.of(context).logout,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: CommonText(
              text: Languages.of(context).areYouSureYouWantToLogout,
              fontSize: AppSizes.setFontSize(18),
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtGrey,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: AppSizes.setHeight(24)),
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).btnWhite,
              border: Border(
                top: BorderSide(
                  color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.4),
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)),
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(12)),
                  child: CommonButton(
                    height: AppSizes.setHeight(44),
                    btnText: Languages.of(context).cancel,
                    onTap: () {},
                    buttonColor: CustomAppColor.of(context).btnWhite,
                    isButtonShadow: false,
                    borderColor: CustomAppColor.of(context).borderPurple,
                    radius: 3,
                    child: CommonText(
                      text: Languages.of(context).cancel,
                      textColor: CustomAppColor.of(context).txtPurple,
                      fontSize: AppSizes.setFontSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
                  child: CommonButton(
                      radius: 3,
                      height: AppSizes.setHeight(44),
                      btnText: Languages.of(context).logout,
                      onTap: () {
                        accountCreated();
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void referralBottomSheet(BuildContext context) {
    customBottomSheet(
      isPaddingRequired: false,
      isDone: false,
      maxHeightRatio: 0.4,
      context: context,
      title: Languages.of(context).enterReferralCode.toUpperCase(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
            child: CommonText(
              text: AppStrings.getExtra,
              fontSize: AppSizes.setFontSize(18),
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(16)),
              child: CommonTextFormField(
                hintText: Languages.of(context).enterReferralCode,
                radius: 8,
              )),
          Padding(padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)), child: const Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
            child: CommonButton(
                radius: 3,
                btnText: Languages.of(context).submit,
                onTap: () {
                  accountCreated();
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {}
}
