import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../types_of_job_roles/view/type_of_job_roles_screen.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SetUpProfileScreen());
  }

  @override
  State<SetUpProfileScreen> createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  ValueNotifier<bool> isGender = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        body: Column(
          children: [
            const IgnorePointer(ignoring: true, child: _TopBarWithImageView()),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: _InputFieldsView(isGender: isGender),
              ),
            ),
            const IgnorePointer(ignoring: true, child: _ContinueButtonView()),
          ],
        ),
      ),
    );
  }
}

class _TopBarWithImageView extends StatefulWidget {
  const _TopBarWithImageView();

  @override
  State<_TopBarWithImageView> createState() => _TopBarWithImageViewState();
}

class _TopBarWithImageViewState extends State<_TopBarWithImageView> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgSecondary,
      child: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSetUpProfile,
            iconColor: CustomAppColor.of(context).bgBackIcon,
            textColor: CustomAppColor.of(context).txtWhite,
            isShowTitle: true,
          ),
          SizedBox(height: 30.setHeight),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100.setHeight,
                width: 0.screenWidth,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreenWhite,
                  border: Border(
                    bottom: BorderSide(
                      color: CustomAppColor.of(context).bgScreenWhite,
                      width: 0,
                    ),
                  ),
                ),
              ),
              Container(
                height: 200.setHeight,
                width: 200.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreenWhite,
                  borderRadius: BorderRadius.circular(500),
                ),
                padding: EdgeInsets.all(10.setHeight),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        AppAssets.imgDummyProfile,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.setHeight),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: CustomAppColor.of(context).bgScreenWhite, width: 3),
                        color: CustomAppColor.of(context).icPrimary,
                      ),
                      child: Image.asset(
                        AppAssets.icEditPencil,
                        height: 20.setHeight,
                        width: 20.setHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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

class _InputFieldsView extends StatelessWidget {
  final ValueNotifier<bool> isGender;

  const _InputFieldsView({required this.isGender});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYouFullName,
          prefixIcon: AppAssets.icUser,
        ),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYourJobTitle,
          prefixIcon: AppAssets.icJobTitle,
        ),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYourEmail,
          prefixIcon: AppAssets.icEmail,
        ),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefixAndSuffix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtSelectYourDateOfBirth,
          prefixIcon: AppAssets.icCalender,
          readOnly: true,
          suffixIcon: AppAssets.icArrowDown,
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
            valueListenable: isGender,
            builder: (context, value, widget) {
              return Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        isGender.value = true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgWhiteSecondary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: CustomAppColor.of(context).black.withOpacityPercent(0.08),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                        child: Row(
                          children: [
                            Image.asset(
                              value ? AppAssets.icRadioSelected : AppAssets.icRadioUnSelected,
                              height: 18.setHeight,
                              width: 18.setHeight,
                              gaplessPlayback: true,
                            ),
                            SizedBox(width: 10.setWidth),
                            CommonText(
                              text: Languages.of(context).txtMale,
                              fontSize: 14.setFontSize,
                              textColor: CustomAppColor.of(context).txtHintGrey,
                              fontWeight: FontWeight.w500,
                              fontFamily: Constant.fontFamily,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        isGender.value = false;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgWhiteSecondary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: CustomAppColor.of(context).black.withOpacityPercent(0.08),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                        child: Row(
                          children: [
                            Image.asset(
                              !value ? AppAssets.icRadioSelected : AppAssets.icRadioUnSelected,
                              height: 18.setHeight,
                              width: 18.setHeight,
                              gaplessPlayback: true,
                            ),
                            SizedBox(width: 10.setWidth),
                            CommonText(
                              text: Languages.of(context).txtFemale,
                              fontSize: 14.setFontSize,
                              textColor: CustomAppColor.of(context).txtHintGrey,
                              fontWeight: FontWeight.w500,
                              fontFamily: Constant.fontFamily,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYourMobileNumber,
          prefixIcon: AppAssets.icCall,
        ),
        SizedBox(height: 15.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterYourLocation,
          prefixIcon: AppAssets.icLocation,
        ),
      ],
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  const _ContinueButtonView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: CommonButton(
          text: Languages.of(context).txtContinue,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, TypeJobRolesScreen.route());
          },
        ),
      ),
    );
  }
}
