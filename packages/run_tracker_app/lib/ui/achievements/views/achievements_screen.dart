import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:run_tracker_app/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../achievement_share/views/achievement_share_screen.dart';
import '../datamodel/achievement_data.dart';

class AchievementsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => AchievementsScreen());
  }

  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen>
    implements TopBarClickListener {
  final List<Achievement> achievements = [
    Achievement(label: "50", isUnlocked: true),
    Achievement(label: "100", isUnlocked: true),
    Achievement(label: "500"),
    Achievement(label: "1000"),
    Achievement(label: "5000"),
    Achievement(label: "10000"),
    Achievement(label: "20000"),
    Achievement(label: "30000"),
    Achievement(label: "50000"),
    Achievement(label: "60000"),
    Achievement(label: "75000"),
    Achievement(label: "100000"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            simpleTitle: Languages.of(context).txtAchievements.toUpperCase(),
            isShowSimpleTitle: true,
            isShowBack: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 22.setWidth,
              vertical: 5.setHeight,
            ),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: achievements.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final achievement = achievements[index];
                return _AchievementCard(achievement: achievement);
              },
            ),
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

class _AchievementCard extends StatelessWidget {
  final Achievement achievement;

  const _AchievementCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (achievement.isUnlocked) {
              Navigator.push(
                context,
                AchievementShareScreen.route(km: achievement.label),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bottomNavbar,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: CustomAppColor.of(context).border),
            ),
            child: Column(
              children: [
                SizedBox(height: 4.setHeight),
                Image.asset(
                  AppAssets.icAchievement,
                  height: 80.setHeight,
                  width: 75.setWidth,
                ),
                SizedBox(height: 8.setHeight),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary,
                    border: Border.all(
                      color: CustomAppColor.of(context).border,
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5.setHeight),
                  child: CommonText(
                    text: "${achievement.label} KM",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    textColor: CustomAppColor.of(context).txtWhite,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (!achievement.isUnlocked)
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).blurCard,
                  borderRadius: BorderRadius.circular(30),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.icLockWhiteDot,
                  height: 35.setHeight,
                  width: 35.setWidth,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
