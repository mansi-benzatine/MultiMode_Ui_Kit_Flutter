import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/ui/home/datamodels/home_data.dart';
import 'package:dating_app_package/ui/profile_details/views/profile_details_screen.dart';
import 'package:dating_app_package/utils/app_assets.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/button/common_button.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum HomeTab { discover, nearby }

class _HomeScreenState extends State<HomeScreen> {
  HomeTab selectedTab = HomeTab.discover;
  List<String> imageList = [];
  List<NearbyData> nearbyImageList = [];

  void fillData() {
    imageList = [
      AppAssets.imgProfile1,
      AppAssets.imgProfile1,
      AppAssets.imgProfile1,
    ];
    nearbyImageList = [
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away"),
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
      backgroundColor: CustomAppColor.of(context).bgPinkScaffold,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: selectedTab == HomeTab.discover ? 322.setHeight : 145.setHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtPink,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.setWidth, vertical: 14.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = HomeTab.discover;
                          });
                        },
                        child: Column(
                          children: [
                            CommonText(
                              text: Languages.of(context).txtDiscover,
                              fontWeight: selectedTab == HomeTab.discover ? FontWeight.w700 : FontWeight.w500,
                              fontSize: 24.setFontSize,
                              textColor: CustomAppColor.of(context).white,
                            ),
                            Container(
                              height: 6.setHeight,
                              width: 6.setWidth,
                              decoration: BoxDecoration(
                                color: selectedTab == HomeTab.discover ? CustomAppColor.of(context).white : CustomAppColor.of(context).transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = HomeTab.nearby;
                          });
                        },
                        child: Column(
                          children: [
                            CommonText(
                              text: Languages.of(context).txtNearby,
                              fontWeight: selectedTab == HomeTab.nearby ? FontWeight.w700 : FontWeight.w500,
                              fontSize: 24.setFontSize,
                              textColor: CustomAppColor.of(context).white,
                            ),
                            Container(
                              height: 6.setHeight,
                              width: 6.setWidth,
                              decoration: BoxDecoration(
                                color: selectedTab == HomeTab.nearby ? CustomAppColor.of(context).white : CustomAppColor.of(context).transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (selectedTab == HomeTab.discover)
            ProfileCardSwiper(imageList: imageList)
          else
            NearbyView(
              nearbyList: nearbyImageList,
            ),
        ],
      ),
    );
  }
}

class ProfileCardSwiper extends StatelessWidget {
  final List<String> imageList;

  const ProfileCardSwiper({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 40.setHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        child: CardSwiper(
          cardsCount: imageList.length,
          numberOfCardsDisplayed: 3,
          isLoop: true,
          backCardOffset: const Offset(0, 40),
          scale: 0.9,
          padding: EdgeInsets.zero,
          cardBuilder: (context, index, percentX, percentY) {
            final swipeRight = percentX > 0.3;
            final swipeLeft = percentX < -0.3;

            String? overlayText;
            if (swipeRight) {
              overlayText = Languages.of(context).txtNope;
            } else if (swipeLeft) {
              overlayText = Languages.of(context).txtLike;
            }

            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30.setHeight, bottom: 40.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomAppColor.of(context).bgSwipeCard,
                    boxShadow: [
                      BoxShadow(
                        color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: _buildProfileCard(context, imageList[index]),
                ),
                if (overlayText != null)
                  Positioned(
                    top: 50.setHeight,
                    left: swipeLeft ? 20 : null,
                    right: swipeRight ? 20 : null,
                    child: Transform.rotate(
                      angle: swipeLeft ? -0.2 : 0.2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 6.setHeight),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: swipeLeft ? const Color(0xFF16FF39) : const Color(0xFFF44336),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CommonText(
                          text: overlayText.toUpperCase(),
                          textColor: swipeLeft ? const Color(0xFF16FF39) : const Color(0xFFF44336),
                          fontWeight: FontWeight.w700,
                          fontSize: 26.setFontSize,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(context, ProfileDetailsScreen.route()),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    height: 295.setHeight,
                    width: 295.setHeight,
                  ),
                ),
                Positioned(
                  bottom: -16.setHeight,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgButton,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 9.setHeight,
                        horizontal: 15.setWidth,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppAssets.icLike, height: 19.setHeight, width: 19.setWidth),
                          SizedBox(width: 11.setWidth),
                          CommonText(
                            text: "87% Match!",
                            fontWeight: FontWeight.w700,
                            fontSize: 18.setFontSize,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.setHeight),
          CommonText(
            text: "Rose Ward, 29",
            fontWeight: FontWeight.w700,
            fontSize: 24.setFontSize,
          ),
          CommonText(
            text: "Fashion Designer",
            fontWeight: FontWeight.w400,
            fontSize: 15.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.setHeight, bottom: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).containerPink,
              borderRadius: BorderRadius.circular(3),
            ),
            padding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 10.setWidth),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildActionButton(AppAssets.icClose, context, () {}),
              _buildActionButton(AppAssets.icLike, context, () {
                showMatchPopup(context);
              }, isPrimary: true),
              _buildActionButton(AppAssets.icRefresh, context, () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionButton(String icon, BuildContext context, void Function()? onTap, {bool isPrimary = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 21.setHeight),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isPrimary ? CustomAppColor.of(context).bgButton : CustomAppColor.of(context).white,
          boxShadow: [
            BoxShadow(
              color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Image.asset(
          icon,
          height: isPrimary ? 31.setHeight : 18.setHeight,
          width: isPrimary ? 34.setWidth : 18.setWidth,
        ),
      ),
    );
  }

  void showMatchPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
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
                    color: CustomAppColor.of(context).bgScaffold,
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
                    onTap: () {
                      if (dialogContext.mounted) {
                        Navigator.pop(dialogContext);
                      }
                    },
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
                  onTap: () {
                    if (dialogContext.mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
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

class NearbyView extends StatelessWidget {
  final List<NearbyData> nearbyList;
  const NearbyView({super.key, required this.nearbyList});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 70.setHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.setWidth,
          mainAxisSpacing: 10.setHeight,
          childAspectRatio: 0.7,
        ),
        itemCount: nearbyList.length,
        itemBuilder: (context, index) {
          final item = nearbyList[index];

          return InkWell(
            onTap: () => Navigator.push(context, ProfileDetailsScreen.route()),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          CustomAppColor.of(context).txtPink.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.setHeight,
                    left: 12.setWidth,
                    right: 12.setWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonText(
                          text: item.name,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        ),
                        SizedBox(height: 4.setHeight),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 2.setHeight),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xFF4A1749).withValues(alpha: 0.6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppAssets.icLocation,
                                width: 13.setWidth,
                                height: 14.setHeight,
                                color: CustomAppColor.of(context).white,
                              ),
                              SizedBox(width: 4.setWidth),
                              CommonText(
                                text: "5km away",
                                fontWeight: FontWeight.w400,
                                fontSize: 12.setFontSize,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
