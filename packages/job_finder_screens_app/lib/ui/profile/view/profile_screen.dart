import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';
import 'package:widgets_easier/widgets_easier.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/text_field/text_form_field.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../datamodel/profile_data.dart';

class ProfileScreen extends StatefulWidget {
  final bool isShowAboutMeBs;
  final bool isShowContactInfoBs;
  final bool isShowWorkExperienceBs;
  final bool isShowEducationQualificationBs;
  final bool isShowTechnicalSkillBs;
  final bool isShowAddTechnicalSkillsBs;
  final bool isShowLanguagesBs;
  final bool isShowAddLanguageBs;
  final bool isShowResumeBs;

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ProfileScreen());
  }

  const ProfileScreen({
    super.key,
    this.isShowAboutMeBs = false,
    this.isShowAddLanguageBs = false,
    this.isShowAddTechnicalSkillsBs = false,
    this.isShowContactInfoBs = false,
    this.isShowEducationQualificationBs = false,
    this.isShowLanguagesBs = false,
    this.isShowResumeBs = false,
    this.isShowTechnicalSkillBs = false,
    this.isShowWorkExperienceBs = false,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileDetails profile;
  bool _isBottomSheetOpen = false;

  void fillData() {
    profile = ProfileDetails(
      name: "Zack Stevens",
      designation: "Product Designer",
      jobsApplied: 42,
      memberSince: "25/02/2019",
      interviews: 18,
      aboutMe:
          "Expertise in Web Design UI/UX Design and Front End - Development. Extensive experience in creating initial web concepts and solutions using wireframes and rapid to high fidelity prototypes, integrating user-centered design, technologies, and business strategy.",
      dob: "September 06, 1990",
      location: "New Yourk, United States",
      mail: "zackstevens@yourdomain.com",
      mobileNumber: "+91 - 0123456789",
      workExperience: [ExperienceData(previousCompany: "Amazon Inc", previousDuration: "March - 2016 to Present (7 Years)", previousExperience: "Product Designer")],
      educationQualification: [
        EducationQualificationData(
          degreeName: "Information Technology",
          universityName: "University of Oxford",
          duration: "Jul 2010 - April 2015 (5 Years)",
        ),
      ],
      languages: [
        "English(US)",
        "Hindi",
        "Gujarati",
      ],
      technicalSkill: ["App Design", "Web Design", "UI/UX", "Graphics Design", "Wireframe Design", "Adobe Xd", "Figma", "Prototyping", "HTML/CSS", "Bootstrap", "Icons"],
    );
  }

  @override
  void initState() {
    super.initState();
    fillData();
    if (widget.isShowAboutMeBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showAboutMeBS();
      });
    }
    if (widget.isShowContactInfoBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showContactInfoBS();
      });
    }
    if (widget.isShowWorkExperienceBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showWorkExperienceBS();
      });
    }
    if (widget.isShowEducationQualificationBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showEducationQualificationsBS();
      });
    }
    if (widget.isShowTechnicalSkillBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showTechnicalSkillBS();
      });
    }
    if (widget.isShowAddTechnicalSkillsBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showAddTechnicalSkillBS();
      });
    }
    if (widget.isShowLanguagesBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showLanguageSkillBS();
      });
    }
    if (widget.isShowAddLanguageBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showAddLanguageSkillBS();
      });
    }
    if (widget.isShowResumeBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showResumeBS();
      });
    }
  }

  void showAboutMeBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                child: Container(
                  width: 60.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icFilledDocument,
                      color: CustomAppColor.of(context).icPrimary,
                      height: 22.setHeight,
                      width: 22.setWidth,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: Languages.of(context).txtAboutMe,
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Divider(color: CustomAppColor.of(context).containerGrey),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    CommonTextFormField(
                      hintText: "",
                      fillColor: CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
                      maxLines: 8,
                      controller: TextEditingController(
                        text:
                            "Expertise in Web Design UI/UX Design and Front End - Development. Extensive experience in creating initial web concepts and solutions using wireframes and rapid to high fidelity prototypes, integrating user-centered design, technologies, and business strategy.",
                      ),
                    ),
                    SizedBox(height: 28.setHeight),
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: _ContinueButtonView(
                  secondButtonText: Languages.of(context).txtUpdate,
                  firstButtonText: Languages.of(context).txtCancel,
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showContactInfoBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                child: Container(
                  width: 60.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icProfile,
                      color: CustomAppColor.of(context).icPrimary,
                      height: 25.setHeight,
                      width: 20.setWidth,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: Languages.of(context).txtContactInfo,
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Divider(color: CustomAppColor.of(context).containerGrey),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icLocation,
                      hintText: "",
                      controller: TextEditingController(text: "New Yourk, United States"),
                      prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                    ),
                    SizedBox(height: 28.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: TextEditingController(text: "+91-0123456789"),
                      prefixIcon: AppAssets.icCall,
                      hintText: "",
                      prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                    ),
                    SizedBox(height: 28.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: TextEditingController(text: "zackstevens@yourdomain.com"),
                      prefixIcon: AppAssets.icEmail,
                      hintText: "",
                      prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormFieldWithPrefixAndSuffix(
                      suffixIcon: AppAssets.icDownArrow,
                      suffixIconColor: CustomAppColor.of(context).icGreyWhite,
                      controller: TextEditingController(text: "September 06,1990"),
                      prefixIcon: AppAssets.icCalender,
                      hintText: "",
                      prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
              _ContinueButtonView(
                secondButtonText: Languages.of(context).txtUpdate,
                firstButtonText: Languages.of(context).txtCancel,
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showWorkExperienceBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                child: Container(
                  width: 60.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icWorkExperience,
                      color: CustomAppColor.of(context).icPrimary,
                      height: 25.setHeight,
                      width: 25.setWidth,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: Languages.of(context).txtWorkExperience,
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Divider(color: CustomAppColor.of(context).containerGrey),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icJobTitle,
                      hintText: Languages.of(context).txtEnterYourJobTitle,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 28.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: TextEditingController(),
                      prefixIcon: AppAssets.icLocation,
                      hintText: Languages.of(context).txtEnterCompanyName,
                    ),
                    SizedBox(height: 28.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: TextEditingController(),
                      prefixIcon: AppAssets.icCalender,
                      hintText: Languages.of(context).txtEnterWorkDuration,
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
              _ContinueButtonView(
                secondButtonText: Languages.of(context).txtAdd,
                firstButtonText: Languages.of(context).txtCancel,
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showEducationQualificationsBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                child: Container(
                  width: 60.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icEducationQualification,
                      color: CustomAppColor.of(context).icPrimary,
                      height: 23.setHeight,
                      width: 28.setWidth,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: Languages.of(context).txtEducationQualification,
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Divider(color: CustomAppColor.of(context).containerGrey),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icEducationQualification,
                      hintText: Languages.of(context).txtEnterYourField,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 28.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: TextEditingController(),
                      prefixIcon: AppAssets.icUniversity,
                      hintText: Languages.of(context).txtEnterUniversityName,
                    ),
                    SizedBox(height: 28.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: TextEditingController(),
                      prefixIcon: AppAssets.icCalender,
                      prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                      hintText: Languages.of(context).txtEnterDuration,
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
              _ContinueButtonView(
                secondButtonText: Languages.of(context).txtAdd,
                firstButtonText: Languages.of(context).txtCancel,
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showTechnicalSkillBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                  child: Container(
                    width: 60.setWidth,
                    height: 4.setHeight,
                    decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icTechnicalSkills,
                        color: CustomAppColor.of(context).icPrimary,
                        height: 30.setHeight,
                        width: 30.setWidth,
                      ),
                      SizedBox(width: 5.setWidth),
                      CommonText(
                        text: Languages.of(context).txtTechnicalSkills,
                        fontSize: 22.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Divider(color: CustomAppColor.of(context).containerGrey),
                ),
                SizedBox(height: 20.setHeight),
                Wrap(
                  spacing: 8.setWidth,
                  runSpacing: 8.setHeight,
                  children: profile.technicalSkill.map((skill) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 8.setWidth),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).icPrimary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonText(
                            text: skill,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).white,
                          ),
                          SizedBox(width: 5.setWidth),
                          Image.asset(
                            AppAssets.icCloseSquare,
                            width: 20.setWidth,
                            height: 20.setHeight,
                            color: CustomAppColor.of(context).bgContainerPrimary,
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 28.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  child: IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                        decoration: BoxDecoration(border: Border.all(color: CustomAppColor.of(context).icPrimary), borderRadius: BorderRadius.circular(100)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.icAdd,
                              height: 20.setHeight,
                              width: 20.setWidth,
                            ),
                            SizedBox(width: 5.setWidth),
                            CommonText(
                              text: Languages.of(context).txtAddNewSkill,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtPrimaryWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.setHeight),
                _ContinueButtonView(
                  secondButtonText: Languages.of(context).txtUpdate,
                  firstButtonText: Languages.of(context).txtCancel,
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showAddTechnicalSkillBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                  child: Container(
                    width: 60.setWidth,
                    height: 4.setHeight,
                    decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icTechnicalSkills,
                        color: CustomAppColor.of(context).icPrimary,
                        height: 30.setHeight,
                        width: 30.setWidth,
                      ),
                      SizedBox(width: 5.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAddNewSkill,
                        fontSize: 22.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Divider(color: CustomAppColor.of(context).containerGrey),
                ),
                SizedBox(height: 20.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: CommonTextFormField(controller: TextEditingController(), hintText: Languages.of(context).txtAddLanguage),
                ),
                SizedBox(height: 40.setHeight),
                _ContinueButtonView(
                  secondButtonText: Languages.of(context).txtAdd,
                  firstButtonText: Languages.of(context).txtCancel,
                ),
              ],
            ),
          );
        }).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showLanguageSkillBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icLanguages,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 23.setHeight,
                    width: 27.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtLanguages,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Wrap(
              spacing: 8.setWidth,
              runSpacing: 8.setHeight,
              children: profile.languages.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 8.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).icPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: skill,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icCloseSquare,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).bgContainerPrimary,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 28.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  decoration: BoxDecoration(border: Border.all(color: CustomAppColor.of(context).icPrimary), borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icAdd,
                        height: 20.setHeight,
                        width: 20.setWidth,
                      ),
                      SizedBox(width: 5.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAddNewLanguage,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtPrimaryWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showAddLanguageSkillBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      clipBehavior: Clip.none,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                child: Container(
                  width: 60.setWidth,
                  height: 4.setHeight,
                  decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icLanguages,
                      color: CustomAppColor.of(context).icPrimary,
                      height: 23.setHeight,
                      width: 27.setWidth,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: Languages.of(context).txtLanguages,
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Divider(color: CustomAppColor.of(context).containerGrey),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: CommonTextFormField(controller: TextEditingController(), hintText: Languages.of(context).txtAddLanguage),
              ),
              SizedBox(height: 40.setHeight),
              _ContinueButtonView(
                secondButtonText: Languages.of(context).txtAdd,
                firstButtonText: Languages.of(context).txtCancel,
              ),
            ],
          ),
        );
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  void showResumeBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      enableDrag: false,
      isDismissible: false,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icCV,
                    color: CustomAppColor.of(context).icPrimary,
                    width: 20.setWidth,
                    height: 26.setHeight,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: "My Resume / CV",
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 20.setHeight),
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
            SizedBox(height: 28.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtSubmit,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          const IgnorePointer(ignoring: true, child: _TopBarWithImageView()),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 18.setHeight),
                  ProfileDetailsCardView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  AboutMeCardView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  ContactInfoCardView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  WorkExperienceView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  EducationQualificationView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  TechnicalSkillCardView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  LanguageCardView(profileDetails: profile),
                  SizedBox(height: 18.setHeight),
                  const MyResumeCvCardView(),
                  SizedBox(height: 18.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBarWithImageView extends StatelessWidget {
  const _TopBarWithImageView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgSecondary,
        border: Border(
          top: BorderSide(
            color: CustomAppColor.of(context).bgSecondary,
          ),
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 100.setHeight,
                width: 0.screenWidth,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: CustomAppColor.of(context).bgScreenWhite)),
                  color: CustomAppColor.of(context).bgScreenWhite,
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
                        border: Border(bottom: BorderSide(color: CustomAppColor.of(context).bgScreenWhite)),
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
}

class ProfileDetailsCardView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const ProfileDetailsCardView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23.setWidth, vertical: 20.setHeight),
        decoration: BoxDecoration(color: CustomAppColor.of(context).bgDetailsCard, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            CommonText(
              text: profileDetails.name,
              fontWeight: FontWeight.w700,
              fontSize: 20.setFontSize,
              textColor: CustomAppColor.of(context).white,
            ),
            CommonText(
              text: profileDetails.designation,
              fontWeight: FontWeight.w500,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.setHeight),
              child: Divider(color: CustomAppColor.of(context).borderWhite),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CommonText(
                      text: profileDetails.jobsApplied.toString(),
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: "Job Applied",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.setHeight,
                  child: VerticalDivider(
                    color: CustomAppColor.of(context).borderWhite,
                    thickness: 1,
                    width: 20,
                  ),
                ),
                Column(
                  children: [
                    CommonText(
                      text: profileDetails.memberSince,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: "Member Since",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.setHeight,
                  child: VerticalDivider(
                    color: CustomAppColor.of(context).borderWhite,
                    thickness: 1,
                    width: 20,
                  ),
                ),
                Column(
                  children: [
                    CommonText(
                      text: profileDetails.interviews.toString(),
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: "Interview",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AboutMeCardView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const AboutMeCardView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icAboutMe,
                        width: 22.setWidth,
                        height: 22.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAboutMe,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => _showAboutMeBottomSheet(context),
                  child: Image.asset(
                    AppAssets.icUpdate,
                    width: 22.setWidth,
                    height: 22.setHeight,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: profileDetails.aboutMe,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtGrey,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }

  void _showAboutMeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icFilledDocument,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 22.setHeight,
                    width: 22.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtAboutMe,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  CommonTextFormField(
                    hintText: "",
                    fillColor: CustomAppColor.of(context).bgTextFormFieldWhiteSecondary,
                    maxLines: 8,
                    controller: TextEditingController(
                      text:
                          "Expertise in Web Design UI/UX Design and Front End - Development. Extensive experience in creating initial web concepts and solutions using wireframes and rapid to high fidelity prototypes, integrating user-centered design, technologies, and business strategy.",
                    ),
                  ),
                  SizedBox(height: 28.setHeight),
                ],
              ),
            ),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class ContactInfoCardView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const ContactInfoCardView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icProfile,
                        color: CustomAppColor.of(context).icPrimary,
                        width: 22.setWidth,
                        height: 22.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtContactInfo,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => _showContactInfoBottomSheet(context),
                    child: Image.asset(
                      AppAssets.icUpdate,
                      width: 22.setWidth,
                      height: 22.setHeight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 8.setHeight),
            Row(
              children: [
                Image.asset(
                  AppAssets.icLocation,
                  color: CustomAppColor.of(context).icPrimary,
                  height: 20.setHeight,
                  width: 20.setWidth,
                ),
                SizedBox(width: 11.setWidth),
                CommonText(
                  text: profileDetails.location,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            Row(
              children: [
                Image.asset(
                  AppAssets.icCall,
                  color: CustomAppColor.of(context).icPrimary,
                  height: 20.setHeight,
                  width: 20.setWidth,
                ),
                SizedBox(width: 11.setWidth),
                CommonText(
                  text: profileDetails.mobileNumber,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            Row(
              children: [
                Image.asset(
                  AppAssets.icEmail,
                  color: CustomAppColor.of(context).icPrimary,
                  height: 20.setHeight,
                  width: 20.setWidth,
                ),
                SizedBox(width: 11.setWidth),
                CommonText(
                  text: profileDetails.mail,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: 10.setHeight),
            Row(
              children: [
                Image.asset(
                  AppAssets.icCalender,
                  color: CustomAppColor.of(context).icPrimary,
                  height: 20.setHeight,
                  width: 20.setWidth,
                ),
                SizedBox(width: 11.setWidth),
                CommonText(
                  text: profileDetails.dob,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showContactInfoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icProfile,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 25.setHeight,
                    width: 20.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtContactInfo,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  CommonTextFormFieldWithPrefix(
                    prefixIcon: AppAssets.icLocation,
                    hintText: "",
                    controller: TextEditingController(text: "New Yourk, United States"),
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "+91-0123456789"),
                    prefixIcon: AppAssets.icCall,
                    hintText: "",
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "zackstevens@yourdomain.com"),
                    prefixIcon: AppAssets.icEmail,
                    hintText: "",
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonTextFormFieldWithPrefixAndSuffix(
                    suffixIcon: AppAssets.icDownArrow,
                    suffixIconColor: CustomAppColor.of(context).icGreyWhite,
                    controller: TextEditingController(text: "September 06,1990"),
                    prefixIcon: AppAssets.icCalender,
                    hintText: "",
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 20.setHeight),
                ],
              ),
            ),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class WorkExperienceView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const WorkExperienceView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icWorkExperience,
                        width: 18.setWidth,
                        height: 18.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtWorkExperience,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => _showAddWorkExperienceBottomSheet(context),
                    child: Image.asset(
                      AppAssets.icAdd,
                      width: 22.setWidth,
                      height: 22.setHeight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 10.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: profileDetails.workExperience.first.previousExperience,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: profileDetails.workExperience.first.previousCompany,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: profileDetails.workExperience.first.previousDuration,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => _showWorkExperienceBottomSheet(context),
                  child: Image.asset(
                    AppAssets.icUpdate,
                    width: 22.setWidth,
                    height: 22.setHeight,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showWorkExperienceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icWorkExperience,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 25.setHeight,
                    width: 25.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtWorkExperience,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  CommonTextFormFieldWithPrefix(
                    prefixIcon: AppAssets.icJobTitle,
                    hintText: "",
                    controller: TextEditingController(text: "Product Designer"),
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "Amazon Inc"),
                    prefixIcon: AppAssets.icLocation,
                    hintText: "",
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "March - 2016 to Present (7 Years)"),
                    prefixIcon: AppAssets.icCalender,
                    hintText: "",
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                  ),
                  SizedBox(height: 20.setHeight),
                ],
              ),
            ),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }

  void _showAddWorkExperienceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icWorkExperience,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 25.setHeight,
                    width: 25.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtWorkExperience,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  CommonTextFormFieldWithPrefix(
                    prefixIcon: AppAssets.icJobTitle,
                    hintText: Languages.of(context).txtEnterYourJobTitle,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(),
                    prefixIcon: AppAssets.icLocation,
                    hintText: Languages.of(context).txtEnterCompanyName,
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(),
                    prefixIcon: AppAssets.icCalender,
                    hintText: Languages.of(context).txtEnterWorkDuration,
                  ),
                  SizedBox(height: 20.setHeight),
                ],
              ),
            ),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtAdd,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class EducationQualificationView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const EducationQualificationView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icEducationQualification,
                        width: 18.setWidth,
                        height: 18.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtEducationQualification,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => _showAddEductionBottomSheet(context),
                    child: Image.asset(
                      AppAssets.icAdd,
                      width: 22.setWidth,
                      height: 22.setHeight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 10.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: profileDetails.educationQualification.first.degreeName,
                      fontSize: 14.setFontSize,
                      textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: profileDetails.educationQualification.first.universityName,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: profileDetails.educationQualification.first.duration,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => _showEductionBottomSheet(context),
                  child: Image.asset(
                    AppAssets.icUpdate,
                    width: 22.setWidth,
                    height: 22.setHeight,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showEductionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icEducationQualification,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 23.setHeight,
                    width: 28.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtEducationQualification,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(
                      text: "Information Technology",
                    ),
                    prefixIcon: AppAssets.icEducationQualification,
                    hintText: "",
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(
                      text: "University Of Oxford",
                    ),
                    prefixIcon: AppAssets.icUniversity,
                    hintText: "",
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(
                      text: "Jul 2010 - April 2015 (5 Years)",
                    ),
                    prefixIcon: AppAssets.icCalender,
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                    hintText: "",
                  ),
                  SizedBox(height: 20.setHeight),
                ],
              ),
            ),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }

  void _showAddEductionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icEducationQualification,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 23.setHeight,
                    width: 28.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtEducationQualification,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Column(
                children: [
                  CommonTextFormFieldWithPrefix(
                    prefixIcon: AppAssets.icEducationQualification,
                    hintText: Languages.of(context).txtEnterYourField,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(),
                    prefixIcon: AppAssets.icUniversity,
                    hintText: Languages.of(context).txtEnterUniversityName,
                  ),
                  SizedBox(height: 28.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(),
                    prefixIcon: AppAssets.icCalender,
                    prefixIconColor: CustomAppColor.of(context).icPrimaryWhite,
                    hintText: Languages.of(context).txtEnterDuration,
                  ),
                  SizedBox(height: 20.setHeight),
                ],
              ),
            ),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtAdd,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class TechnicalSkillCardView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const TechnicalSkillCardView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icTechnicalSkills,
                        width: 18.setWidth,
                        height: 18.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtTechnicalSkills,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => _showTechnicalSkillBottomSheet(context),
                    child: Image.asset(
                      AppAssets.icUpdate,
                      width: 22.setWidth,
                      height: 22.setHeight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 10.setHeight),
            Wrap(
              spacing: 8.setWidth,
              runSpacing: 8.setHeight,
              children: profileDetails.technicalSkill.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 12.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).icPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CommonText(
                    text: skill,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).white,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showTechnicalSkillBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icTechnicalSkills,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 30.setHeight,
                    width: 30.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtTechnicalSkills,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Wrap(
              spacing: 8.setWidth,
              runSpacing: 8.setHeight,
              children: profileDetails.technicalSkill.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 8.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).icPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: skill,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icCloseSquare,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).bgContainerPrimary,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 28.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  _showAddTechnicalBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  decoration: BoxDecoration(border: Border.all(color: CustomAppColor.of(context).icPrimary), borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icAdd,
                        height: 20.setHeight,
                        width: 20.setWidth,
                      ),
                      SizedBox(width: 5.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAddNewSkill,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtPrimaryWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }

  void _showAddTechnicalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icLanguages,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 30.setHeight,
                    width: 30.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtLanguages,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: CommonTextFormField(controller: TextEditingController(), hintText: Languages.of(context).txtAddLanguage),
            ),
            SizedBox(height: 40.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtAdd,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class LanguageCardView extends StatelessWidget {
  final ProfileDetails profileDetails;

  const LanguageCardView({super.key, required this.profileDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icLanguages,
                        width: 18.setWidth,
                        height: 18.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtLanguages,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => _showLanguageBottomSheet(context),
                    child: Image.asset(
                      AppAssets.icUpdate,
                      width: 22.setWidth,
                      height: 22.setHeight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 10.setHeight),
            Wrap(
              spacing: 8.setWidth,
              runSpacing: 8.setHeight,
              children: profileDetails.languages.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 15.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).icPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CommonText(
                    text: skill,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).white,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icLanguages,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 23.setHeight,
                    width: 27.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtLanguages,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Wrap(
              spacing: 8.setWidth,
              runSpacing: 8.setHeight,
              children: profileDetails.languages.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8.setHeight, horizontal: 8.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).icPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: skill,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      SizedBox(width: 5.setWidth),
                      Image.asset(
                        AppAssets.icCloseSquare,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).bgContainerPrimary,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 28.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  _showAddLanguageBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                  decoration: BoxDecoration(border: Border.all(color: CustomAppColor.of(context).icPrimary), borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icAdd,
                        height: 20.setHeight,
                        width: 20.setWidth,
                      ),
                      SizedBox(width: 5.setWidth),
                      CommonText(
                        text: Languages.of(context).txtAddNewLanguage,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtPrimaryWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtUpdate,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }

  void _showAddLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icLanguages,
                    color: CustomAppColor.of(context).icPrimary,
                    height: 23.setHeight,
                    width: 27.setWidth,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtLanguages,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Divider(color: CustomAppColor.of(context).containerGrey),
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: CommonTextFormField(controller: TextEditingController(), hintText: Languages.of(context).txtAddLanguage),
            ),
            SizedBox(height: 40.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtAdd,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class MyResumeCvCardView extends StatelessWidget {
  const MyResumeCvCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 22.setHeight, horizontal: 22.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgWhiteSecondary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: CustomAppColor.of(context).black.withOpacityPercent(.08),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icCV,
                        width: 18.setWidth,
                        height: 18.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtMyResumeCv,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                    ],
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: InkWell(
                    onTap: () => _showLogoutBottomSheet(context),
                    child: Image.asset(
                      AppAssets.icAdd,
                      width: 22.setWidth,
                      height: 22.setHeight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.setHeight),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 10.setHeight),
            Row(
              children: [
                Image.asset(
                  AppAssets.icPdf,
                  width: 44.setWidth,
                  height: 44.setHeight,
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Zack Stevens - Product Designer",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtSecondaryWhite,
                      ),
                      CommonText(
                        text: "987 Kb",
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  AppAssets.icDelete,
                  width: 24.setWidth,
                  height: 24.setHeight,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
              child: Container(
                width: 60.setWidth,
                height: 4.setHeight,
                decoration: BoxDecoration(color: CustomAppColor.of(context).bsDragHandle),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.setHeight, horizontal: 24.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icCV,
                    color: CustomAppColor.of(context).icPrimary,
                    width: 20.setWidth,
                    height: 26.setHeight,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: Languages.of(context).txtMyResumeCv,
                    fontSize: 22.setFontSize,
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).txtSecondaryWhite,
                  ),
                ],
              ),
            ),
            Divider(color: CustomAppColor.of(context).containerGrey),
            SizedBox(height: 20.setHeight),
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
            SizedBox(height: 28.setHeight),
            _ContinueButtonView(
              secondButtonText: Languages.of(context).txtSubmit,
              firstButtonText: Languages.of(context).txtCancel,
            ),
          ],
        );
      },
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  final String firstButtonText;
  final String secondButtonText;

  const _ContinueButtonView({required this.firstButtonText, required this.secondButtonText});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
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
          child: Row(
            children: [
              Expanded(
                child: CommonOutlineButton(
                  height: 50.setHeight,
                  text: firstButtonText,
                  buttonBorderColor: CustomAppColor.of(context).secondary,
                  buttonTextColor: CustomAppColor.of(context).txtSecondary,
                  buttonColor: CustomAppColor.of(context).bgScreenWhite,
                  onTap: () => Navigator.pop(context),
                ),
              ),
              SizedBox(width: 15.setHeight),
              Expanded(
                child: CommonButton(
                  height: 50.setHeight,
                  text: secondButtonText,
                  buttonTextSize: 18.setFontSize,
                  buttonTextWeight: FontWeight.w500,
                  buttonColor: CustomAppColor.of(context).txtSecondary,
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
