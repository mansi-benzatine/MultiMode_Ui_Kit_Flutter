import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/widgets/button/common_button.dart';
import 'package:cinemix_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class EditAvatarScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAvatarScreen());
  }

  const EditAvatarScreen({super.key});

  @override
  State<EditAvatarScreen> createState() => _EditAvatarScreenState();
}

class _EditAvatarScreenState extends State<EditAvatarScreen> implements TopBarClickListener {
  final TextEditingController _usernameController = TextEditingController(text: "Sana");

  int selectedAvatarIndex = 0;

  final List<Color> avatarColors = const [
    Color(0xFF9E9E9E),
    Color(0xFFFFC107),
    Color(0xFF00BCD4),
    Color(0xFFE91E63),
    Color(0xFF00E676),
    Color(0xFF3F51B5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditProfile,
              isShowBack: true,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.setHeight),
                    CircleAvatar(
                      radius: 70.setWidth,
                      backgroundImage: AssetImage(AppAssets.imgDummyImage),
                    ),
                    SizedBox(height: 50.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: CommonTextFormField(
                        controller: _usernameController,
                        hintText: Languages.of(context).txtEnterYourUsername,
                        titleText: Languages.of(context).txtUsername,
                      ),
                    ),
                    SizedBox(height: 25.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: Languages.of(context).txtAvatar,
                          fontSize: 14.setFontSize,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.setHeight),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.setWidth),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAvatarIndex = 0;
                                });
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedAvatarIndex == 0 ? Colors.redAccent : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 35.setWidth,
                                      backgroundImage: AssetImage(AppAssets.imgDummyImage),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(Icons.photo_library_outlined),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10.setWidth),
                            Wrap(
                              spacing: 8.setWidth,
                              children: List.generate(avatarColors.length, (index) {
                                final color = avatarColors[index];
                                final avatarIndex = index + 1;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedAvatarIndex = avatarIndex;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedAvatarIndex == avatarIndex ? Colors.redAccent : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 35.setWidth,
                                      backgroundColor: color,
                                      child: Image.asset(
                                        AppAssets.icEmoji,
                                        height: 25.setHeight,
                                        width: 25.setWidth,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(context).txtSaveProfile,
                  onTap: () => Navigator.pop(context),
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
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
