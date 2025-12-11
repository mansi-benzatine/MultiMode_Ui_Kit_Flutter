import 'package:cinemix_app/ui/add_avatar/view/add_avatar_screen.dart';
import 'package:cinemix_app/ui/edit_avatar/view/edit_avatar_screen.dart';
import 'package:cinemix_app/ui/who_is_watching/datamodel/who_is_watching_data.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class EditAvatarBottomSheet extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAvatarBottomSheet());
  }

  const EditAvatarBottomSheet({super.key});

  @override
  State<EditAvatarBottomSheet> createState() => _EditAvatarBottomSheetState();
}

class _EditAvatarBottomSheetState extends State<EditAvatarBottomSheet> {
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
      WhoIsWatchingModel(
        name: "Done",
        isEditProfile: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgShadowDark,
              CustomAppColor.of(context).bgTextFormFieldShadow,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.setHeight),
            Center(
              child: CommonText(
                text: "Edit Avatar",
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilyClashDisplayMedium500,
              ),
            ),
            Divider(height: 30.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.setWidth, vertical: 10.setHeight),
              child: Wrap(
                spacing: 22.setWidth,
                runSpacing: 20.setHeight,
                alignment: WrapAlignment.center,
                children: profiles.map((item) {
                  return GestureDetector(
                    onTap: () {
                      if (item.isAddProfile) {
                        // Navigator.push(context, AddProfileScreen.route());
                      } else {
                        Navigator.push(context, EditAvatarScreen.route());
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90.setWidth,
                          height: 90.setWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: item.backgroundColor,
                            gradient: item.backgroundColor == null
                                ? LinearGradient(
                                    colors: [
                                      CustomAppColor.of(context).bgShadowDark.withValues(alpha: 0.6),
                                      CustomAppColor.of(context).bgTextFormFieldShadowLight,
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
                                  onTap: () {
                                    Navigator.push(context, AddAvatarScreen.route());
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: CustomAppColor.of(context).icBlackWhite,
                                    size: 32,
                                  ),
                                )
                              : item.isEditProfile
                                  ? GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: const Icon(
                                        Icons.close,
                                        size: 28,
                                      ),
                                    )
                                  : (item.image == null
                                      ? Image.asset(
                                          AppAssets.icEmoji,
                                          width: 35.setHeight,
                                          height: 35.setHeight,
                                        )
                                      : null),
                        ),
                        SizedBox(height: 10.setHeight),
                        CommonText(
                          text: item.name,
                          fontSize: 14.setFontSize,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 15.setHeight),
          ],
        ),
      ),
    );
  }
}
