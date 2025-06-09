import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';
import 'package:widgets_easier/widgets_easier.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/text_field/text_form_field.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../successfully_job_applied/view/successfully_job_applied_screen.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ApplyJobScreen());
  }

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> implements TopBarClickListener {
  List<String> experienceList = [];
  List<String> eductionList = [];

  void fillData() {
    experienceList = [
      "0-1 years",
      "1-3 years",
      "3-5 years",
      "4-5 years",
      "5-7 years",
      "7+ years",
      "10+ years",
    ];

    eductionList = [
      "High School",
      "Bachelor's",
      "Master's",
      "Doctorate",
      "Arts",
      "Science",
      "Engineering",
      "others",
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              isShowTitle: true,
              backgroundColor: CustomAppColor.of(context).transparent,
              title: Languages.of(context).txtApplyJob,
              textColor: CustomAppColor.of(context).txtSecondary,
              isShowCancel: true,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: InputFieldsView(eductionList: eductionList, experienceList: experienceList),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _ContinueButtonView(
                onTap: () => Navigator.push(context, SuccessfullyJobAppliedScreen.route()),
                buttonText: "Apply Job",
              ),
            ),
          )
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

class InputFieldsView extends StatelessWidget {
  final List<String> experienceList;
  final List<String> eductionList;

  final String? selectedItem;
  InputFieldsView({super.key, required this.eductionList, required this.experienceList, this.selectedItem});

  final ValueNotifier<String?> selectedExperience = ValueNotifier<String?>(null);
  final ValueNotifier<String?> selectedEducation = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    if (selectedExperience.value == null && experienceList.isNotEmpty) {
      selectedExperience.value = experienceList.first;
    }
    if (selectedEducation.value == null && eductionList.isNotEmpty) {
      selectedEducation.value = eductionList.first;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterYouFullName,
            prefixIcon: AppAssets.icUser,
          ),
          SizedBox(height: 16.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterYourEmail,
            prefixIcon: AppAssets.icEmail,
          ),
          SizedBox(height: 16.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterYourMobileNumber,
            prefixIcon: AppAssets.icCall,
          ),
          SizedBox(height: 16.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterYourWebsiteOrPortfolio,
            prefixIcon: AppAssets.icDocument,
          ),
          SizedBox(height: 16.setHeight),
          Container(
            height: 75.setHeight,
            width: 327.setWidth,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              color: CustomAppColor.of(context).bgWhiteSecondary,
              shape: DashedBorder(
                borderRadius: BorderRadius.circular(10),
                color: CustomAppColor.of(context).grey,
                dashSize: 2.4,
                dashSpacing: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.icUpload,
                  width: 24.setWidth,
                  height: 24.setHeight,
                ),
                SizedBox(width: 10.setWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtUploadCVResume,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.setFontSize,
                    ),
                    CommonText(
                      text: Languages.of(context).txtFormatDocPdfJpgAccepted.toLowerCase(),
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.setFontSize,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5.setHeight),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: Languages.of(context).txtUploadYourCVResumeOrAnyOtherRelevant,
                textColor: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
                fontSize: 12.setFontSize,
                fontStyle: FontStyle.italic,
              ),
              CommonText(
                text: Languages.of(context).txtUploadLimit,
                textColor: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
                fontSize: 12.setFontSize,
                fontStyle: FontStyle.italic,
              )
            ],
          ),
          SizedBox(height: 16.setHeight),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgWhiteSecondary,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: CustomAppColor.of(context).containerGrey,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icExperience,
                      height: 20.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: Languages.of(context).txtChooseYourExperiences,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.setFontSize,
                    ),
                  ],
                ),
                SizedBox(height: 16.setHeight),
                ValueListenableBuilder<String?>(
                  valueListenable: selectedExperience,
                  builder: (context, selectedValue, _) {
                    return Wrap(
                      spacing: 4.setWidth,
                      children: experienceList.map((item) {
                        bool isSelected = item == selectedValue;
                        return GestureDetector(
                          onTap: () => selectedExperience.value = item,
                          child: Container(
                            height: 35.setHeight,
                            width: 91.setWidth,
                            margin: EdgeInsets.only(bottom: 6.setHeight),
                            padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 5.setHeight),
                            decoration: BoxDecoration(
                              color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).icPrimary,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: CommonText(
                                text: item,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).icPrimary,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.setHeight),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgWhiteSecondary,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: CustomAppColor.of(context).containerGrey,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icJobTitle,
                      height: 20.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: Languages.of(context).txtChooseYourEducations,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.setFontSize,
                    ),
                  ],
                ),
                SizedBox(height: 16.setHeight),
                ValueListenableBuilder<String?>(
                  valueListenable: selectedEducation,
                  builder: (context, selectedValue, _) {
                    return Wrap(
                      spacing: 4.setWidth,
                      children: eductionList.map((item) {
                        bool isSelected = item == selectedValue;
                        return GestureDetector(
                          onTap: () => selectedEducation.value = item,
                          child: Container(
                            height: 35.setHeight,
                            width: 91.setWidth,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(bottom: 6.setHeight),
                            decoration: BoxDecoration(
                              color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).icPrimary,
                                width: 1,
                              ),
                            ),
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).icPrimary,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.setHeight),
          Stack(
            children: [
              CommonTextFormFieldWithPrefix(
                prefixIcon: "",
                controller: TextEditingController(),
                maxLines: 5,
                hintText: Languages.of(context).txtWriteYourCoverLetter,
              ),
              Positioned(
                left: 20.setWidth,
                top: 18.setHeight,
                child: Image.asset(
                  AppAssets.icDocument,
                  height: 18.setHeight,
                  width: 18.setWidth,
                  gaplessPlayback: true,
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const _ContinueButtonView({required this.buttonText, this.onTap});

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
          onTap: onTap,
          text: buttonText,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).secondary,
        ),
      ),
    );
  }
}
