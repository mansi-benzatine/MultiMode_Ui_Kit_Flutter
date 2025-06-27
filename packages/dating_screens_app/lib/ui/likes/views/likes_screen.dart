import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/ui/profile_details/views/profile_details_screen.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../home/datamodels/home_data.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  List<NearbyData> nearbyImageList = [];

  void fillData() {
    nearbyImageList = [
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away", isActive: true),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away", isActive: true),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away", activeAgo: "2h"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away", activeAgo: "4h"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away", activeAgo: "5h"),
      NearbyData(name: "Rose Ward", imageUrl: AppAssets.imgProfile1, howMuchAway: "5km away", activeAgo: "6h"),
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
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 145.setHeight,
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).txtPink,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: CommonText(
                    text: Languages.of(context).txtLike,
                    fontWeight: FontWeight.w800,
                    fontSize: 22.setFontSize,
                    textColor: CustomAppColor.of(context).white,
                  ),
                ),
              ],
            ),
            LikesListView(nearbyList: nearbyImageList),
          ],
        ),
      ),
    );
  }
}

class LikesListView extends StatelessWidget {
  final List<NearbyData> nearbyList;
  const LikesListView({super.key, required this.nearbyList});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 55.setHeight,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.setWidth,
          mainAxisSpacing: 10.setHeight,
          childAspectRatio: 0.67,
        ),
        itemCount: nearbyList.length,
        itemBuilder: (context, index) {
          final item = nearbyList[index];

          return IgnorePointer(
            ignoring: true,
            child: InkWell(
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
                            padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 4.setHeight),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xFF4A1749).withValues(alpha: 0.6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                item.isActive ?? false
                                    ? Container(
                                        width: 6.setWidth,
                                        height: 6.setHeight,
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : CommonText(
                                        text: "Last seen:",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.setFontSize,
                                        textColor: CustomAppColor.of(context).white,
                                        // textColor: Colors.white,
                                      ),
                                SizedBox(width: 4.setWidth),
                                item.isActive ?? false
                                    ? CommonText(
                                        text: "Active now",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.setFontSize,
                                        textColor: CustomAppColor.of(context).white,
                                      )
                                    : CommonText(
                                        text: "${item.activeAgo ?? " "} ago",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.setFontSize,
                                        textColor: CustomAppColor.of(context).white,
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
            ),
          );
        },
      ),
    );
  }
}
