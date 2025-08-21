import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../meditation_details/view/meditation_details_screen.dart';
import '../../notification/view/notification_screen.dart';
import '../../saved/view/saved_screen.dart';
import '../../yoga_details/view/yoga_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'Beginner',
    'Intermediate',
    'Expert',
  ];

  final ValueNotifier<int> _selectedCategory = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topBarView(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: 30.setHeight),
            child: Column(
              children: [
                _categoriesView(),
                SizedBox(height: 20.setHeight),
                _popularView(),
                SizedBox(height: 20.setHeight),
                _essantialsForBeginnersView(),
                SizedBox(height: 20.setHeight),
                _recentExercisesView(),
                SizedBox(height: 20.setHeight),
                _stressReliefView(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _topBarView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
      child: Row(
        children: [
          Container(
            width: 50.setWidth,
            height: 50.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgScreen,
              shape: BoxShape.circle,
              border: Border.all(color: CustomAppColor.of(context).borderColor),
            ),
            child: Icon(
              Icons.person_rounded,
              size: 25.setHeight,
              color: CustomAppColor.of(context).txtBlack,
            ),
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "${Languages.of(context).txtWelcomeBack}!",
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtPrimary,
                  height: 1,
                ),
                CommonText(
                  text: "Kenneth",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: CustomAppColor.of(context).txtBlack,
                  height: 1.5,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.setWidth),
          InkWell(
            splashColor: CustomAppColor.of(context).transparent,
            highlightColor: CustomAppColor.of(context).transparent,
            onTap: () {
              Navigator.push(context, NotificationScreen.route());
            },
            child: Image.asset(
              AppAssets.icNotification,
              width: 18.setHeight,
              height: 18.setHeight,
              color: CustomAppColor.of(context).txtBlackAndGray,
            ),
          ),
          SizedBox(width: 10.setWidth),
          InkWell(
            splashColor: CustomAppColor.of(context).transparent,
            highlightColor: CustomAppColor.of(context).transparent,
            onTap: () {
              Navigator.push(context, SavedScreen.route());
            },
            child: Image.asset(
              AppAssets.icArchive,
              width: 18.setHeight,
              height: 18.setHeight,
              color: CustomAppColor.of(context).txtBlackAndGray,
            ),
          ),
        ],
      ),
    );
  }

  _categoriesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: CommonText(
            text: Languages.of(context).txtCategories,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              categories.length,
              (index) => ValueListenableBuilder(
                valueListenable: _selectedCategory,
                builder: (context, value, child) {
                  return InkWell(
                    splashColor: CustomAppColor.of(context).transparent,
                    highlightColor: CustomAppColor.of(context).transparent,
                    onTap: () {
                      _selectedCategory.value = index;
                    },
                    child: Container(
                      height: 40.setHeight,
                      margin: EdgeInsets.only(right: 10.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: value == index ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: categories[index],
                        fontSize: 14.setFontSize,
                        fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                        fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                        textColor: value == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  _popularView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtPopular,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              10,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, YogaDetailsScreen.route());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.setHeight),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                                AppAssets.imgYogaDummy1,
                                width: 130.setWidth,
                                height: 130.setHeight,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).containerFillBorderAndBlack,
                              border: Border.all(color: CustomAppColor.of(context).primary),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                            child: CommonText(
                              text: "Beginners",
                              fontSize: 10.setFontSize,
                              fontWeight: FontWeight.w500,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: "Morning Yoga",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.setHeight),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            CommonText(
                              text: "10 ${Languages.of(context).txtPoses}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                            VerticalDivider(
                              color: CustomAppColor.of(context).txtLightGray,
                              thickness: 1,
                              width: 15.setWidth,
                              indent: 2.5.setHeight,
                              endIndent: 2.5.setHeight,
                            ),
                            CommonText(
                              text: "25 ${Languages.of(context).txtMin}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _essantialsForBeginnersView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtEssantialsForBeginners,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Column(
            children: List.generate(
              5,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, MeditationDetailsScreen.route());
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            AppAssets.imgMeditationDummy1,
                            width: 80.setWidth,
                            height: 80.setHeight,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Meditation",
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                fontFamily: Constant.fontFamilySemiBold600,
                                textColor: CustomAppColor.of(context).txtBlack,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 2.setHeight),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    CommonText(
                                      text: "10 ${Languages.of(context).txtPoses}",
                                      fontSize: 11.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Constant.fontFamilyRegular400,
                                      textColor: CustomAppColor.of(context).txtDarkGray,
                                    ),
                                    VerticalDivider(
                                      color: CustomAppColor.of(context).txtLightGray,
                                      thickness: 1,
                                      width: 15.setWidth,
                                      indent: 2.5.setHeight,
                                      endIndent: 2.5.setHeight,
                                    ),
                                    CommonText(
                                      text: "25 ${Languages.of(context).txtMin}",
                                      fontSize: 11.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: Constant.fontFamilyRegular400,
                                      textColor: CustomAppColor.of(context).txtDarkGray,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).containerFillBorderAndBlack,
                            border: Border.all(color: CustomAppColor.of(context).primary),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                          child: CommonText(
                            text: "Beginners",
                            fontSize: 11.setFontSize,
                            fontWeight: FontWeight.w500,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    if (index != 4)
                      Divider(
                        color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                        thickness: 1,
                        height: 25.setHeight,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _recentExercisesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtRecentExercises,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Column(
            children: List.generate(
              5,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, YogaDetailsScreen.route());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).containerFillBorderAndBlack,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: CustomAppColor.of(context).borderPrimaryAndGray),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 8.setHeight),
                  margin: EdgeInsets.only(bottom: 10.setHeight),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          AppAssets.imgYogaDummy1,
                          width: 70.setWidth,
                          height: 70.setHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Spiritual Growth",
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w600,
                              fontFamily: Constant.fontFamilySemiBold600,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 2.setHeight),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  CommonText(
                                    text: "10 ${Languages.of(context).txtPoses}",
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                  VerticalDivider(
                                    color: CustomAppColor.of(context).txtLightGray,
                                    thickness: 1,
                                    width: 15.setWidth,
                                    indent: 2.5.setHeight,
                                    endIndent: 2.5.setHeight,
                                  ),
                                  CommonText(
                                    text: "25 ${Languages.of(context).txtMin}",
                                    fontSize: 11.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        AppAssets.icArrowRight,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _stressReliefView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtStressRelief,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              CommonText(
                text: Languages.of(context).txtViewAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.setHeight, width: 0.screenWidth),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
          child: Row(
            children: List.generate(
              10,
              (index) => InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  Navigator.push(context, MeditationDetailsScreen.route());
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          AppAssets.imgYogaDummy1,
                          width: 130.setWidth,
                          height: 130.setHeight,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: "Mindfullness",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 2.setHeight),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            CommonText(
                              text: "10 ${Languages.of(context).txtPoses}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                            VerticalDivider(
                              color: CustomAppColor.of(context).txtLightGray,
                              thickness: 1,
                              width: 15.setWidth,
                              indent: 2.5.setHeight,
                              endIndent: 2.5.setHeight,
                            ),
                            CommonText(
                              text: "25 ${Languages.of(context).txtMin}",
                              fontSize: 10.5.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtDarkGray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
