import 'package:cinemix_app/ui/who_is_watching/datamodel/who_is_watching_data.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/utils/utils.dart';
import 'package:cinemix_app/widgets/bottom_sheet/edit_avatar_bottom_sheet.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';

class SwitchProfileBottomSheet extends StatefulWidget {
  const SwitchProfileBottomSheet({super.key});

  @override
  State<SwitchProfileBottomSheet> createState() => _SwitchProfileBottomSheetState();
}

class _SwitchProfileBottomSheetState extends State<SwitchProfileBottomSheet> {
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
        name: "Edit Profile",
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
                text: "Switch Profile",
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
                        // Navigator.push(context, DashboardScreen.route());
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
                                  // onTap: () => Navigator.push(context, AddProfileScreen.route()),
                                  child: Icon(
                                    Icons.add,
                                    color: CustomAppColor.of(context).icBlackWhite,
                                    size: 32,
                                  ),
                                )
                              : item.isEditProfile
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Utils.showBottomSheetDialog(context, widgets: const EditAvatarBottomSheet());
                                      },
                                      child: Image.asset(
                                        AppAssets.icEdit,
                                        width: 22.setHeight,
                                        height: 22.setHeight,
                                        color: CustomAppColor.of(context).icBlackWhite,
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
