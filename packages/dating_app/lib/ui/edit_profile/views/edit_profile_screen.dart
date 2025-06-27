import 'package:dating_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/ui/edit_basic_details/views/edit_basic_details_screen.dart';
import 'package:dating_app_package/ui/edit_gender_and_sexual/views/edit_gender_and_sexual_screen.dart';
import 'package:dating_app_package/ui/edit_job_and_school/views/edit_job_and_school_screen.dart';
import 'package:dating_app_package/ui/edit_language/views/edit_langauges_screen.dart';
import 'package:dating_app_package/ui/edit_passion/views/edit_passion_screen.dart';
import 'package:dating_app_package/ui/edit_social_links/views/edit_social_links_screen.dart';
import 'package:dating_app_package/utils/app_assets.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/constant.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:dating_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  List<String> photoList = [];
  List<String> interestList = [];
  List<String> socialMediaList = [];
  List<String> languageList = [];

  void fillData() {
    photoList = [AppAssets.imgProfile];
    interestList = [
      "Sport",
      "Dancing",
      "Swimming",
      "Music",
      "Art",
    ];
    socialMediaList = [
      AppAssets.icInstagram,
      AppAssets.icFacebook,
      AppAssets.icSnapchat,
      AppAssets.icTiktok,
      AppAssets.icTelegram,
    ];
    languageList = [
      "English",
      "Korean",
      "Japanese",
      "Urdu",
    ];
  }

  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditProfile,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                  child: Column(
                    children: [
                      ImageListView(imageList: photoList),
                      SizedBox(height: 10.setHeight),
                      Divider(color: CustomAppColor.of(context).greyDivider),
                      SizedBox(height: 15.setHeight),
                      const BasicInformationView(),
                      SizedBox(height: 20.setHeight),
                      const JobAndSchoolView(),
                      SizedBox(height: 20.setHeight),
                      const GenderAndSexualView(),
                      SizedBox(height: 20.setHeight),
                      PassionListView(interestList: interestList),
                      SizedBox(height: 20.setHeight),
                      SocialMediaListView(socialMediaList: socialMediaList),
                      SizedBox(height: 20.setHeight),
                      LanguagesListView(languageList: languageList),
                      SizedBox(height: 20.setHeight),
                      ShowOnMyProfileView(),
                    ],
                  ),
                ),
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

class ImageListView extends StatelessWidget {
  final List<String> imageList;

  const ImageListView({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160.setHeight,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              bool hasImage = index < imageList.length;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 100.setWidth,
                    height: 145.setHeight,
                    margin: EdgeInsets.only(right: 10.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).imgBg,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: CustomAppColor.of(context).textFormFieldBorder),
                      image: hasImage
                          ? DecorationImage(
                              image: AssetImage(imageList[index]),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: !hasImage
                        ? Center(
                            child: Image.asset(
                              AppAssets.icUser,
                              height: 56.setHeight,
                              width: 56.setWidth,
                            ),
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0.setHeight,
                    left: 30.setWidth,
                    child: Container(
                      width: 40.setWidth,
                      height: 28.setWidth,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColor.of(context).txtPink,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 18.setWidth,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 16.setHeight),
        CommonText(
          text: Languages.of(context).txtClickAndDragOnThePhotosToChangeTheOrder,
          textColor: CustomAppColor.of(context).txtGrey,
          fontSize: 15.setFontSize,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}

class BasicInformationView extends StatelessWidget {
  const BasicInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtBasicInformation.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditBasicDetailsScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).greyDivider,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  detailsView(context, Languages.of(context).txtName, "Devin Oliver"),
                  SizedBox(width: 100.setWidth),
                  detailsView(context, Languages.of(context).txtAge, "28"),
                ],
              ),
              Divider(color: CustomAppColor.of(context).greyDivider),
              detailsView(context, Languages.of(context).txtCity, "Slate Spring"),
              Divider(color: CustomAppColor.of(context).greyDivider),
              detailsView(context, Languages.of(context).txtBio, "I love physical and outdoor activity"),
            ],
          ),
        )
      ],
    );
  }
}

class JobAndSchoolView extends StatelessWidget {
  const JobAndSchoolView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtJobAndSchool.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditJobAndSchoolScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: CustomAppColor.of(context).greyDivider,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsView(context, Languages.of(context).txtJob, "Photographer"),
              Divider(color: CustomAppColor.of(context).greyDivider),
              detailsView(context, Languages.of(context).txtSchool, "Divine Child High School"),
            ],
          ),
        )
      ],
    );
  }
}

class GenderAndSexualView extends StatelessWidget {
  const GenderAndSexualView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtGenderAndSexual.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditGenderAndSexualScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 10.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).greyDivider),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsView(context, Languages.of(context).txtGender, "Male"),
              Divider(color: CustomAppColor.of(context).greyDivider),
              detailsView(context, Languages.of(context).txtSexualOrientation, "Straight"),
            ],
          ),
        )
      ],
    );
  }
}

class PassionListView extends StatelessWidget {
  final List<String> interestList;
  const PassionListView({super.key, required this.interestList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtPassions.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditPassionScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 10.setHeight),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgTextFormField,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: CustomAppColor.of(context).greyDivider)),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 4.setWidth,
            runSpacing: 12.setHeight,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: interestList.map((item) => _tag(item, context)).toList(),
          ),
        )
      ],
    );
  }
}

class SocialMediaListView extends StatelessWidget {
  final List<String> socialMediaList;

  const SocialMediaListView({super.key, required this.socialMediaList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtSocialMedia.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditSocialLinksScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 14.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).greyDivider),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 12.setWidth,
            runSpacing: 12.setHeight,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: socialMediaList.map((item) => _roundTag(item, context)).toList(),
          ),
        )
      ],
    );
  }
}

class LanguagesListView extends StatelessWidget {
  final List<String> languageList;

  const LanguagesListView({super.key, required this.languageList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtLanguageIKnow.toUpperCase(),
              fontWeight: FontWeight.w700,
              fontSize: 18.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvetPink,
            ),
            InkWell(
              onTap: () => Navigator.push(context, EditLanguagesScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 22.setWidth,
                height: 22.setHeight,
              ),
            )
          ],
        ),
        SizedBox(height: 14.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgTextFormField,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).greyDivider),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 12.setWidth,
            runSpacing: 12.setHeight,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: languageList.map((item) => _tag(item, context)).toList(),
          ),
        )
      ],
    );
  }
}

class ShowOnMyProfileView extends StatelessWidget {
  final ValueNotifier<bool> isShowAge = ValueNotifier(true);
  final ValueNotifier<bool> isShowGender = ValueNotifier(false);
  final ValueNotifier<bool> isShowOccupation = ValueNotifier(false);

  ShowOnMyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtShowOnMyProfile.toUpperCase(),
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 14.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgTextFormField,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: CustomAppColor.of(context).greyDivider)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtAge,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.setFontSize,
                  ),
                  ValueListenableBuilder(
                    valueListenable: isShowAge,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {},
                        activeColor: CustomAppColor.of(context).txtPink,
                        inactiveColor: CustomAppColor.of(context).switchInactive,
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).txtPink,
                        width: 44.setWidth,
                        height: 22.setHeight,
                        toggleSize: 16.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 6.setHeight),
              Divider(color: CustomAppColor.of(context).greyDivider),
              SizedBox(height: 6.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtGender,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.setFontSize,
                  ),
                  ValueListenableBuilder(
                    valueListenable: isShowGender,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {},
                        activeColor: CustomAppColor.of(context).txtPink,
                        inactiveColor: CustomAppColor.of(context).switchInactive,
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 44.setWidth,
                        height: 22.setHeight,
                        toggleSize: 16.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 6.setHeight),
              Divider(color: CustomAppColor.of(context).greyDivider),
              SizedBox(height: 6.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtOccupation,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.setFontSize,
                  ),
                  ValueListenableBuilder(
                    valueListenable: isShowOccupation,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {},
                        activeColor: CustomAppColor.of(context).txtPink,
                        inactiveColor: CustomAppColor.of(context).switchInactive,
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 44.setWidth,
                        height: 22.setHeight,
                        toggleSize: 16.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget detailsView(BuildContext context, String title, String details) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonText(
        text: title,
        fontWeight: FontWeight.w400,
        fontSize: 14.setFontSize,
        textColor: CustomAppColor.of(context).txtGrey,
      ),
      CommonText(
        text: details,
        fontWeight: FontWeight.w500,
        fontSize: 16.setFontSize,
      )
    ],
  );
}

Widget _tag(String label, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
    decoration: BoxDecoration(
      color: CustomAppColor.of(context).editPassionBg,
      border: Border.all(color: CustomAppColor.of(context).passionContainerBorder, width: 0.5),
      borderRadius: BorderRadius.circular(30),
    ),
    child: CommonText(
      text: label.toUpperCase(),
      fontWeight: FontWeight.w700,
      fontSize: 14.setFontSize,
      textColor: CustomAppColor.of(context).white,
    ),
  );
}

Widget _roundTag(String label, BuildContext context) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.setWidth, vertical: 11.setHeight),
      decoration: BoxDecoration(
        border: Border.all(color: CustomAppColor.of(context).greyDivider, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.asset(
        label,
        height: 24.setHeight,
        width: 24.setWidth,
        fit: BoxFit.fill,
      ));
}
