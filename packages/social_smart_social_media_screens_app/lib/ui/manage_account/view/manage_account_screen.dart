import 'package:flutter/material.dart';

import '../../../../../../../../../utils/app_assets.dart';
import '../../../localization/language/languages.dart';
import '../../../ui/edit_profile/datamodel/edit_profile_data.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../change_password/view/change_password_screen.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});
  static Route route({bool? isFromPost}) {
    return MaterialPageRoute(
      builder: (context) => const ManageAccountScreen(),
    );
  }

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  List<EditProfileData> manageAccountList = [];
  List<EditProfileData> accountControlList = [];
  void fillData() {
    manageAccountList = [
      EditProfileData(
        icon: AppAssets.icCall,
        label: Languages.of(context).phoneNumber,
        detail: "+1 0123456789",
        isTrailingIcon: true,
        isTrailingIconWithLabel: true,
      ),
      EditProfileData(
        icon: AppAssets.icMail,
        label: Languages.of(context).email,
        isTrailingIcon: true,
        detail: AppStrings.john.replaceAll("@", ""),
        isTrailingIconWithLabel: true,
      ),
      EditProfileData(
        icon: AppAssets.icCalender,
        label: Languages.of(context).dateOfBirth,
        isTrailingIcon: false,
        isTrailingIconWithLabel: true,
        detail: "12/06/1991",
      ),
    ];
    accountControlList = [
      EditProfileData(
        icon: AppAssets.icPassword,
        label: Languages.of(context).changePassword,
        isTrailingIcon: true,
        route: (context) => ChangePasswordScreen.route(),
      ),
      EditProfileData(icon: AppAssets.icDelete, label: Languages.of(context).deleteAccount, isTrailingIcon: false),
      EditProfileData(icon: AppAssets.icLogout, label: Languages.of(context).logout, isTrailingIcon: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        leading: IgnorePointer(
            ignoring: true,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            )),
        centerTitle: false,
        titleSpacing: 0,
        title: CommonText(
          text: "${Languages.of(context).manageAccount}s",
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24), vertical: AppSizes.setHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            accountInformation(context),
            accountControl(context),
          ],
        ),
      ),
    );
  }

  Widget accountInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)),
          child: CommonText(
            text: Languages.of(context).accountInformation,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
        ),
        Column(
          children: List.generate(
            manageAccountList.length,
            (index) {
              final socialData = manageAccountList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                child: GestureDetector(
                  onTap: () {
                    if (socialData.route != null) {
                      Navigator.push(context, socialData.route!(context));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(3)),
                        child: Image.asset(
                          socialData.icon ?? '',
                          color: CustomAppColor.of(context).icBlack,
                          height: AppSizes.setHeight(25),
                          width: AppSizes.setWidth(25),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: AppSizes.setWidth(20)),
                      CommonText(
                        text: socialData.label ?? '',
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.setFontSize(16),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      CommonText(
                        text: socialData.detail ?? '',
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.setFontSize(16),
                      ),
                      SizedBox(width: AppSizes.setWidth(3)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(6)),
                        child: socialData.isTrailingIcon ?? false
                            ? const Icon(Icons.navigate_next_sharp)
                            : Image.asset(
                                AppAssets.icCalender,
                                scale: 5.5,
                                color: CustomAppColor.of(context).icBlack,
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
    );
  }

  Widget accountControl(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(13)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8)),
            child: CommonText(
              text: Languages.of(context).accountControl,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
          ),
          Column(
            children: List.generate(
              manageAccountList.length,
              (index) {
                final accountControl = accountControlList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                  child: GestureDetector(
                    onTap: () {
                      if (accountControl.route != null) {
                        // Navigator.push(context, accountControl.route!(context));
                      }
                      if (index == 2) {
                        _showViewersBottomSheet(context: context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(6)),
                          child: Image.asset(
                            accountControl.icon ?? '',
                            height: AppSizes.setHeight(25),
                            width: AppSizes.setWidth(25),
                            color: accountControl.isTrailingIcon ?? false ? CustomAppColor.of(context).icBlack : CustomAppColor.of(context).txtRed,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: AppSizes.setWidth(15)),
                        CommonText(
                          text: accountControl.label ?? '',
                          fontWeight: FontWeight.w600,
                          fontSize: AppSizes.setFontSize(16),
                          textAlign: TextAlign.start,
                          textColor: accountControl.isTrailingIcon ?? false ? CustomAppColor.of(context).icBlack : CustomAppColor.of(context).txtRed,
                        ),
                        const Spacer(),
                        CommonText(
                          text: accountControl.detail ?? '',
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizes.setFontSize(14),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(6)),
                          child: accountControl.isTrailingIcon ?? false ? const Icon(Icons.navigate_next_sharp) : null,
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

  void _showViewersBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.6,
      showDragHandle: true,
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: Languages.of(context).logout,
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(22),
                textAlign: TextAlign.center,
                textColor: AppColor.txtPurple,
              ),
              const Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                child: CommonText(
                  text: Languages.of(context).areYouSureToLogout,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(16),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18)),
                child: Row(
                  children: [
                    Flexible(
                      child: CommonButton(
                        useSimpleStyle: true,
                        radius: 20,
                        child: CommonText(
                          text: Languages.of(context).cancel,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtPurple,
                          fontSize: AppSizes.setFontSize(14),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.setWidth(12)),
                    Expanded(
                      child: CommonButton(
                        btnText: Languages.of(context).logout,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
