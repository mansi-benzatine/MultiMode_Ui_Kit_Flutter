import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/add_avatar/view/add_avatar_screen.dart';
import 'package:cinemix_screens_app/ui/edit_avatar/view/edit_avatar_screen.dart';
import 'package:cinemix_screens_app/ui/who_is_watching/datamodel/who_is_watching_data.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';

class EditAvatarsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAvatarsScreen());
  }

  const EditAvatarsScreen({super.key});

  @override
  State<EditAvatarsScreen> createState() => _EditAvatarsScreenState();
}

class _EditAvatarsScreenState extends State<EditAvatarsScreen> implements TopBarClickListener {
  late List<WhoIsWatchingModel> profiles;

  @override
  void initState() {
    super.initState();
    profiles = [
      WhoIsWatchingModel(
        name: "Sana",
        image: AppAssets.imgDummyImage,
        backgroundColor: Colors.transparent,
      ),
      WhoIsWatchingModel(
        name: "1",
        backgroundColor: const Color(0xFFF6C018),
      ),
      WhoIsWatchingModel(
        name: "John",
        backgroundColor: const Color(0xFF0CC4E4),
      ),
      WhoIsWatchingModel(
        name: "Add Profile",
        isAddProfile: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditProfiles,
              isShowBack: true,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Wrap(
                    spacing: 60.setWidth,
                    runSpacing: 30.setHeight,
                    alignment: WrapAlignment.center,
                    children: profiles.map((item) {
                      return IgnorePointer(
                        ignoring: true,
                        child: GestureDetector(
                          onTap: () {
                            if (item.isAddProfile) {
                              Navigator.push(context, AddAvatarScreen.route());
                            } else {
                              Navigator.push(context, EditAvatarScreen.route());
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 90.setWidth,
                                    height: 90.setWidth,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: item.backgroundColor,
                                      gradient: item.backgroundColor == null && item.isAddProfile == true
                                          ? LinearGradient(
                                              colors: [
                                                CustomAppColor.of(context).bgLanguageShadow,
                                                CustomAppColor.of(context).bgShadowDark,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            )
                                          : null,
                                      image: item.image != null
                                          ? DecorationImage(
                                              image: AssetImage(item.image!),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: item.isAddProfile
                                        ? GestureDetector(
                                            onTap: () => Navigator.push(context, AddAvatarScreen.route()),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          )
                                        : (item.image == null ? Image.asset(AppAssets.icEmoji) : null),
                                  ),
                                  item.isAddProfile
                                      ? const SizedBox()
                                      : Container(
                                          width: 90.setWidth,
                                          height: 90.setWidth,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: CustomAppColor.of(context).black.withValues(alpha: 0.4),
                                          ),
                                          padding: const EdgeInsets.all(35),
                                          child: Image.asset(
                                            AppAssets.icEdit,
                                          ),
                                        )
                                ],
                              ),
                              SizedBox(height: 10.setHeight),
                              CommonText(
                                text: item.name,
                                fontSize: 14.setFontSize,
                                fontFamily: Constant.fontFamilyClashGroteskMedium500,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
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
    if (name == Constant.strEdit) {}
  }
}
