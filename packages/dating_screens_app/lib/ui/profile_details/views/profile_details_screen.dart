import 'package:dating_screens_app_package/ui/chat/views/chat_screen.dart';
import 'package:dating_screens_app_package/ui/report/views/report_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/text/common_text.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final bool isShownMatchAlert;
  static Route<void> route({bool isShownMatchAlert = false}) {
    return MaterialPageRoute(builder: (_) => ProfileDetailsScreen(isShownMatchAlert: isShownMatchAlert));
  }

  const ProfileDetailsScreen({super.key, this.isShownMatchAlert = false});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  List<String> photoList = [];
  List<String> interestList = [];
  List<String> socialMediaList = [];
  List<String> languageList = [];
  late ScrollController _scrollController;
  bool isCollapsed = false;
  bool _isDialogOpen = false;

  void fillData() {
    photoList = [
      AppAssets.imgProfile1,
      AppAssets.imgProfile1,
      AppAssets.imgProfile1,
    ];
    interestList = [
      "Sport",
      "Dancing",
      "Swimming",
      "Music",
      "Art",
      "Reading",
      "Environmental",
      "Travel",
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
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        bool newValue = _scrollController.offset > 280;
        if (newValue != isCollapsed) {
          setState(() {
            isCollapsed = newValue;
          });
        }
      }
    });

    if (widget.isShownMatchAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMatchDialog();
      });
    }
  }

  void _showMatchDialog() {
    setState(() {
      _isDialogOpen = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgSwipeCard,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 5.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).passionContainerBg,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.close, color: CustomAppColor.of(context).txtPink),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 32.setWidth,
                    top: 90.setHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomAppColor.of(context).txtPink,
                          width: 5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.imgProfile,
                          height: 110.setHeight,
                          width: 110.setWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30.setWidth,
                    top: 55.setHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomAppColor.of(context).txtPink,
                          width: 5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.imgProfile1,
                          height: 110.setHeight,
                          width: 110.setWidth,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(child: Image.asset(AppAssets.imgBgProfile)),
                ],
              ),
              CommonText(
                text: Languages.of(context).txtItIsMatch.toUpperCase(),
                fontWeight: FontWeight.w800,
                fontSize: 18.setFontSize,
                textColor: CustomAppColor.of(context).txtPink,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: "Rose Ward, 29",
                fontWeight: FontWeight.w700,
                fontSize: 30.setFontSize,
              ),
              CommonText(
                text: "Fashion Designer",
                fontWeight: FontWeight.w400,
                fontSize: 18.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.setHeight, bottom: 10.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).containerPink,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.icShare, height: 13.setHeight, width: 13.setWidth),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "5KM",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.setWidth),
                  child: CommonButton(
                    text: Languages.of(context).txtSendAMessage,
                    onTap: () {},
                    height: 40.setHeight,
                  ),
                ),
              ),
              SizedBox(height: 10.setHeight),
              InkWell(
                onTap: () {},
                child: CommonText(
                  text: Languages.of(context).txtKeepPlaying,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((_) {
      if (_isDialogOpen) {
        print('LogoutDialog dismissed: Popping MyProfileScreen');
        setState(() {
          _isDialogOpen = false;
        });
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        bottom: true,
        top: false,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              scrolledUnderElevation: 0,
              expandedHeight: 320.setHeight,
              backgroundColor: isCollapsed ? CustomAppColor.of(context).bgScaffold : Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: EdgeInsets.only(left: 16.setWidth),
                child: Image.asset(
                  AppAssets.icBack,
                  color: isCollapsed ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).white,
                  scale: 4,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Icon(
                    Icons.more_horiz,
                    color: isCollapsed ? CustomAppColor.of(context).txtBlack : Colors.white,
                  ),
                )
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                      child: Image.asset(
                        AppAssets.imgProfile1,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [CustomAppColor.of(context).primary.withValues(alpha: 0.01), CustomAppColor.of(context).primary.withValues(alpha: 0.7)],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16.setHeight,
                      left: 0.setWidth,
                      right: 0.setWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            maxRadius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.clear, color: Colors.black),
                          ),
                          SizedBox(width: 20.setWidth),
                          InkWell(
                            onTap: () => showMatchPopup(context),
                            child: CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: CustomAppColor.of(context).txtPink,
                              child: const Icon(Icons.favorite, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicDetailsView(photoList: photoList),
                    CommonText(
                      text: Languages.of(context).txtAboutMe,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                      textColor: CustomAppColor.of(context).txtVelvetPink,
                    ),
                    SizedBox(height: 10.setHeight),
                    CommonText(
                      text:
                          "I love physical and outdoor activities: sailing, climbing, skydiving, I am always active. My other passion is cooking for my friends. I love physical and outdoor activities: sailing, climbing, skydiving, I am always active. My other passion is cooking for my friends.",
                      fontWeight: FontWeight.w500,
                      fontSize: 15.setFontSize,
                      textColor: CustomAppColor.of(context).txtVelvet,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10.setHeight),
                    Divider(color: CustomAppColor.of(context).greyDivider),
                    SizedBox(height: 10.setHeight),
                    InterestedListView(interestList: interestList),
                    SizedBox(height: 10.setHeight),
                    SocialMediaListView(socialMediaList: socialMediaList),
                    SizedBox(height: 10.setHeight),
                    LanguagesListView(languageList: languageList),
                    Divider(color: CustomAppColor.of(context).greyDivider),
                    SizedBox(height: 10.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () => Navigator.push(context, ChatScreen.route()),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15.setHeight),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgButton,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icShare,
                                width: 16.setWidth,
                                height: 16.setHeight,
                              ),
                              SizedBox(width: 10.setWidth),
                              CommonText(
                                text: Languages.of(context).txtSendAMessage.toUpperCase(),
                                fontWeight: FontWeight.w700,
                                fontSize: 16.setFontSize,
                                textColor: CustomAppColor.of(context).white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () => Navigator.push(context, ReportUserScreen.route()),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.setHeight),
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomAppColor.of(context).bgButton),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icCheckList,
                                width: 24.setWidth,
                                height: 24.setHeight,
                                color: CustomAppColor.of(context).txtVelvetPink,
                              ),
                              SizedBox(width: 10.setWidth),
                              CommonText(
                                text: "Report Rose".toUpperCase(),
                                fontWeight: FontWeight.w700,
                                fontSize: 16.setFontSize,
                                textColor: CustomAppColor.of(context).txtVelvetPink,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMatchPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgSwipeCard,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 5.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).passionContainerBg,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.close, color: CustomAppColor.of(context).txtPink),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 32.setWidth,
                    top: 90.setHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomAppColor.of(context).txtPink,
                          width: 5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.imgProfile,
                          height: 110.setHeight,
                          width: 110.setWidth,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30.setWidth,
                    top: 55.setHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: CustomAppColor.of(context).txtPink,
                          width: 5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.imgProfile1,
                          height: 110.setHeight,
                          width: 110.setWidth,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(child: Image.asset(AppAssets.imgBgProfile)),
                ],
              ),
              CommonText(
                text: Languages.of(context).txtItIsMatch.toUpperCase(),
                fontWeight: FontWeight.w800,
                fontSize: 18.setFontSize,
                textColor: CustomAppColor.of(context).txtPink,
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: "Rose Ward, 29",
                fontWeight: FontWeight.w700,
                fontSize: 30.setFontSize,
              ),
              CommonText(
                text: "Fashion Designer",
                fontWeight: FontWeight.w400,
                fontSize: 18.setFontSize,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.setHeight, bottom: 15.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).containerPink,
                  borderRadius: BorderRadius.circular(3),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 10.setWidth),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.icShare, height: 13.setHeight, width: 13.setWidth),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: "5KM",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.setWidth),
                child: CommonButton(
                  text: Languages.of(context).txtSendAMessage,
                  onTap: () => Navigator.pop(context),
                  height: 40.setHeight,
                ),
              ),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: Languages.of(context).txtKeepPlaying,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDetailsView extends StatelessWidget {
  final List<String> photoList;
  const BasicDetailsView({super.key, required this.photoList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: "Rose Ward, " "29",
          fontWeight: FontWeight.w800,
          fontSize: 24.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        CommonText(
          text: "Fashion Designer",
          fontWeight: FontWeight.w500,
          fontSize: 14.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        SizedBox(height: 9.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.icLocation,
              width: 22.setWidth,
              height: 22.setHeight,
            ),
            SizedBox(width: 4.setWidth),
            CommonText(
              text: "1712 Clay Lick Road, Aurora, 80014",
              fontWeight: FontWeight.w500,
              fontSize: 15.setFontSize,
              textColor: CustomAppColor.of(context).txtVelvet,
            ),
          ],
        ),
        SizedBox(height: 16.setHeight),
        Wrap(
          spacing: 10,
          children: List.generate(
            photoList.length,
            (index) {
              return Container(
                width: 102.setWidth,
                height: 140.setHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(photoList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.setHeight),
        Divider(color: CustomAppColor.of(context).greyDivider),
        SizedBox(height: 10.setHeight),
      ],
    );
  }
}

class InterestedListView extends StatelessWidget {
  final List<String> interestList;

  const InterestedListView({super.key, required this.interestList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtInterested,
          fontWeight: FontWeight.w700,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 14.setHeight),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 12.setWidth,
          runSpacing: 12.setHeight,
          children: interestList.map((item) => _tag(item, context)).toList(),
        ),
        SizedBox(height: 14.setHeight),
        Divider(color: CustomAppColor.of(context).greyDivider),
      ],
    );
  }

  Widget _tag(String label, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).passionContainerBg,
        border: Border.all(color: CustomAppColor.of(context).passionContainerBorder, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CommonText(
        text: label.toUpperCase(),
        fontWeight: FontWeight.w700,
        fontSize: 14.setFontSize,
        textColor: CustomAppColor.of(context).txtVelvet,
      ),
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
        CommonText(
          text: Languages.of(context).txtSocialMedia,
          fontWeight: FontWeight.w700,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 14.setHeight),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 10.setWidth,
          runSpacing: 14.setHeight,
          children: socialMediaList.map((item) => _tag(item, context)).toList(),
        ),
        SizedBox(height: 14.setHeight),
        Divider(color: CustomAppColor.of(context).greyDivider),
      ],
    );
  }

  Widget _tag(String label, BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 11.setWidth, vertical: 11.setHeight),
        decoration: BoxDecoration(
          border: Border.all(color: CustomAppColor.of(context).passionContainerBorder, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(
          label,
          height: 24.setHeight,
          width: 24.setWidth,
          fit: BoxFit.fill,
        ));
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
        CommonText(
          text: Languages.of(context).txtLanguageIKnow,
          fontWeight: FontWeight.w700,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtVelvetPink,
        ),
        SizedBox(height: 14.setHeight),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 12.setWidth,
          runSpacing: 12.setHeight,
          children: languageList.map((item) => _tag(item, context)).toList(),
        ),
        SizedBox(height: 14.setHeight),
      ],
    );
  }

  Widget _tag(String label, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).passionContainerBg,
        border: Border.all(color: CustomAppColor.of(context).passionContainerBorder, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: CommonText(
        text: label.toUpperCase(),
        fontWeight: FontWeight.w700,
        fontSize: 14.setFontSize,
        textColor: CustomAppColor.of(context).txtVelvet,
      ),
    );
  }
}
