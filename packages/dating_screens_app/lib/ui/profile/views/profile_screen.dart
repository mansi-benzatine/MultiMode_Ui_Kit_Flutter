import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/ui/settings/views/settings_screen.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:dating_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements TopBarClickListener {
  List<String> photoList = [];
  List<String> interestList = [];

  void fillData() {
    photoList = [AppAssets.imgProfile];
    interestList = [
      "Sport",
      "Dancing",
      "Swimming",
      "Music",
      "Art",
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtProfile,
              isShowSetting: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 28.setHeight),
                    ProfileDetailView(photoList: photoList, interestList: interestList),
                  ],
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
    if (name == Constant.strSettings) {
      Navigator.push(context, SettingsScreen.route());
    }
  }
}

class ProfileDetailView extends StatelessWidget {
  final List<String> photoList;
  final List<String> interestList;
  const ProfileDetailView({super.key, required this.photoList, required this.interestList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomAppColor.of(context).txtPink, width: 5),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.imgProfile),
                  maxRadius: 70,
                ),
              ),
              Positioned(
                bottom: 5.setHeight,
                right: 5.setWidth,
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).txtPink,
                  ),
                  child: Image.asset(
                    AppAssets.icNavigate,
                    height: 15.setHeight,
                    width: 17.setWidth,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18.setHeight),
          CommonText(
            text: "Devin Oliver" ", 30",
            textColor: CustomAppColor.of(context).txtVelvet,
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          CommonText(
            text: "Photographer",
            textColor: CustomAppColor.of(context).txtGrey,
            fontSize: 15.setFontSize,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 18.setHeight),
          CommonText(
            text:
                "I love physical and outdoor activities: sailing, climbing, skydiving, I am always active. My other passion is cooking for my friends.",
            textColor: CustomAppColor.of(context).txtVelvet,
            fontSize: 15.setFontSize,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 25.setHeight),
          SizedBox(
            height: 160.setHeight,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                bool hasImage = index < photoList.length;

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
                                image: AssetImage(photoList[index]),
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
                    if (!hasImage)
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
          SizedBox(height: 25.setHeight),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12.setWidth,
            runSpacing: 12.setHeight,
            children: interestList.map((item) => _tag(item, context)).toList(),
          ),
          SizedBox(height: 25.setHeight),
        ],
      ),
    );
  }

  Widget _tag(String label, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).txtVelvetPink,
        border: Border.all(color: CustomAppColor.of(context).txtVelvetPink, width: 1),
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
}
