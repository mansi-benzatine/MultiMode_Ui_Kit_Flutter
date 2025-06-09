import 'package:flutter/material.dart';

import '../../../../../../../ui/edit_about_you/view/edit_about_you_screen.dart';
import '../../../../../../../ui/edit_social/view/edit_social_screen.dart';
import '../../../localization/language/languages.dart';
import '../../../ui/edit_profile/datamodel/edit_profile_data.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/text/common_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static Route route({bool? isFromPost}) {
    return MaterialPageRoute(
      builder: (context) => const EditProfileScreen(),
    );
  }

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  List<EditProfileData> editProfileList = [];
  List<EditProfileData> socialList = [];
  void fillData() {
    editProfileList = [
      EditProfileData(
        icon: AppAssets.icProfileFilled,
        label: Languages.of(context).name,
        detail: AppStrings.johnDoe,
      ),
      EditProfileData(
        icon: AppAssets.icTickSquare,
        label: Languages.of(context).userName,
        detail: AppStrings.john.replaceAll("@", ""),
      ),
      EditProfileData(
        icon: AppAssets.icDocument,
        label: Languages.of(context).bio,
        detail: AppStrings.designerPhoto,
      ),
    ];
    socialList = [
      EditProfileData(icon: AppAssets.icInstagramFilled, label: Languages.of(context).instagram, detail: AppStrings.john.toLowerCase()),
      EditProfileData(
          icon: AppAssets.icFacebookFilled, label: Languages.of(context).facebook, detail: AppStrings.johnDoe.toLowerCase().replaceAll(" ", "")),
      EditProfileData(icon: AppAssets.icTwitterFilled, label: Languages.of(context).twitter, detail: AppStrings.john.replaceAll("@", "")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      appBar: AppBar(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
        centerTitle: false,
        titleSpacing: 0,
        title: CommonText(
          text: Languages.of(context).editProfile,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            editAvatar(),
            const Divider(thickness: 0.6),
            aboutYou(
              context: context,
              title: Languages.of(context).aboutYou,
              profileList: editProfileList,
              onTap: () {
                Navigator.push(context, EditAboutYouScreen.route());
              },
            ),
            const Divider(thickness: 0.6),
            aboutYou(
              context: context,
              title: Languages.of(context).social,
              profileList: socialList,
              onTap: () {
                Navigator.push(context, EditSocialYouScreen.route());
              },
            )
          ],
        ),
      ),
    );
  }

  Widget editAvatar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(24)),
      child: Stack(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(AppAssets.imgProfile),
            ),
          ),
          Positioned.fill(
            top: AppSizes.setHeight(95),
            left: AppSizes.setWidth(95),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppAssets.icProfileEdit,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutYou({required BuildContext context, required String? title, required List<EditProfileData> profileList, required Function()? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: title ?? '',
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(18),
                textAlign: TextAlign.start,
              ),
              InkWell(
                onTap: onTap,
                child: Image.asset(
                  AppAssets.icEdit,
                  width: AppSizes.setWidth(22),
                  height: AppSizes.setHeight(22),
                  color: CustomAppColor.of(context).icBlack,
                ),
              )
            ],
          ),
        ),
        Column(
          children: List.generate(
            profileList.length,
            (index) {
              final socialData = profileList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      socialData.icon ?? '',
                      color: CustomAppColor.of(context).icBlack,
                      width: AppSizes.setWidth(24),
                      height: AppSizes.setHeight(24),
                    ),
                    SizedBox(width: AppSizes.setWidth(20)),
                    CommonText(
                      text: socialData.label ?? '',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(16),
                    ),
                    const Spacer(),
                    CommonText(
                      text: socialData.detail ?? '',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(16),
                    ),
                    SizedBox(width: AppSizes.setWidth(5)),
                    const Icon(Icons.navigate_next_sharp)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
