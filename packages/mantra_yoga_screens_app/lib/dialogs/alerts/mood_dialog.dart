import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class MoodDialog extends StatefulWidget {
  const MoodDialog({super.key, required this.onTap, required this.parentContext});

  final Function? onTap;
  final BuildContext parentContext;

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => MoodDialog(
        onTap: onTap,
        parentContext: context,
      ),
    );
  }

  @override
  State<MoodDialog> createState() => _MoodDialogState();
}

class _MoodDialogState extends State<MoodDialog> {
  final List<String> emojiList = [
    AppAssets.imgEmoji1,
    AppAssets.imgEmoji2,
    AppAssets.imgEmoji3,
    AppAssets.imgEmoji4,
    AppAssets.imgEmoji5,
    AppAssets.imgEmoji6,
    AppAssets.imgEmoji7,
    AppAssets.imgEmoji8,
  ];

  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final parentContext = widget.parentContext;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(parentContext);
          Navigator.pop(context);
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
        backgroundColor: CustomAppColor.of(parentContext).bgScreen,
        insetPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: Languages.of(parentContext).txtHowWasYourMoodAfterLesson,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w700,
                fontFamily: Constant.fontFamilyBold700,
                textColor: CustomAppColor.of(parentContext).txtBlack,
                textAlign: TextAlign.center,
              ),
              Divider(
                color: CustomAppColor.of(parentContext).txtBlack.withValues(alpha: 0.5),
                thickness: 1,
                height: 25.setHeight,
              ),
              ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: emojiList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(top: 5.setHeight, bottom: 15.setHeight),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: 80.setHeight,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => selectedIndex.value = index,
                        child: Container(
                          margin: EdgeInsets.all(4.setWidth),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: value == index ? CustomAppColor.of(parentContext).primary : Colors.transparent,
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
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(parentContext).txtContinue,
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    widget.onTap?.call();
                  },
                  buttonColor: CustomAppColor.of(parentContext).primary,
                  borderColor: CustomAppColor.of(parentContext).borderColor,
                  borderWidth: 3,
                  height: 55.setHeight,
                  radius: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
