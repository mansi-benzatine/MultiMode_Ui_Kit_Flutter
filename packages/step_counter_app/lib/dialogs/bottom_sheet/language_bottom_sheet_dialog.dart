import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

import '../../utils/app_color.dart';

class LanguageBottomSheetDialog extends StatefulWidget {
  const LanguageBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<LanguageBottomSheetDialog> createState() => _LanguageBottomSheetDialogState();
}

class _LanguageBottomSheetDialogState extends State<LanguageBottomSheetDialog> {
  final langugaeList = [
    "English",
    "Arabic",
    "Hindi",
    "Urdu",
    "Spanish",
    "French",
    "German",
    "Italian",
    "Portuguese",
    "Russian",
    "Chinese",
    "Japanese",
    "Korean",
    "Thai",
    "Vietnamese",
  ];

  final ValueNotifier<int> selectedLanguage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 0.screenHeight / 1.5),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: langugaeList.length,
        padding: EdgeInsets.only(bottom: 0.bottomPadding),
        itemBuilder: (context, index) {
          return ValueListenableBuilder(
            valueListenable: selectedLanguage,
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  selectedLanguage.value = index;
                },
                child: Column(
                  children: [
                    Container(
                      color: value == index ? CustomAppColor.of(context).primary.withValues(alpha: .2) : CustomAppColor.of(context).bgContainerWhiteAndBlack,
                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 20.setHeight),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.icSetupProfileLanguage,
                            height: 22.setHeight,
                            width: 22.setWidth,
                            color: value == index ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).borderColor,
                          ),
                          SizedBox(width: 20.setWidth),
                          Expanded(
                            child: CommonText(
                              text: langugaeList[index],
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: value == index ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          if (value == index)
                            Container(
                              height: 22.setHeight,
                              width: 22.setHeight,
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_rounded,
                                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                                size: 16.setHeight,
                              ),
                            )
                        ],
                      ),
                    ),
                    if (index != langugaeList.length - 1 && (index != value && index != value - 1))
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: CustomAppColor.of(context).dividerColor,
                        indent: 25.setWidth,
                        endIndent: 25.setWidth,
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
