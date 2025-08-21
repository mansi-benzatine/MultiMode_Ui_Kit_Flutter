import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class MoodDialog extends StatefulWidget {
  const MoodDialog({super.key, required this.onTap});

  final Function? onTap;

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      builder: (context) => MoodDialog(onTap: onTap),
    );
  }

  @override
  State<MoodDialog> createState() => _MoodDialogState();
}

class _MoodDialogState extends State<MoodDialog> {
  List<String> emojiList = [
    AppAssets.imgEmoji1,
    AppAssets.imgEmoji2,
    AppAssets.imgEmoji3,
    AppAssets.imgEmoji4,
    AppAssets.imgEmoji5,
    AppAssets.imgEmoji6,
    AppAssets.imgEmoji7,
    AppAssets.imgEmoji8,
  ];
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      alignment: Alignment.center,
      child: Material(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(34),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: Languages.of(context).txtHowWasYourMoodAfterLesson,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w700,
                fontFamily: Constant.fontFamilyBold700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              Divider(
                color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.5),
                thickness: 1,
                height: 25.setHeight,
              ),
              ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: emojiList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 5.setHeight, bottom: 15.setHeight),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 80.setHeight,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: CustomAppColor.of(context).transparent,
                        highlightColor: CustomAppColor.of(context).transparent,
                        onTap: () {
                          selectedIndex.value = index;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).transparent,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: selectedIndex.value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            emojiList[index],
                            width: 80.setWidth,
                            height: 80.setHeight,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              CommonButton(
                text: Languages.of(context).txtContinue,
                onTap: () {
                  Navigator.pop(context);
                  widget.onTap?.call();
                },
                buttonColor: CustomAppColor.of(context).primary,
                borderColor: CustomAppColor.of(context).borderColor,
                borderWidth: 3,
                height: 55.setHeight,
                radius: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
