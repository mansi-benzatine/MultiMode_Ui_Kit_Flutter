import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  final ValueNotifier<String> selectedLanguage = ValueNotifier('English');

  final FixedExtentScrollController _languageController = FixedExtentScrollController(initialItem: 2);

  final List<String> languages = ['Arabic', 'French', 'English', 'German', 'Spanish'];

  @override
  void dispose() {
    _languageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 165.setHeight,
              width: 165.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerLightAndDark,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(30.setWidth),
              child: Image.asset(AppAssets.icSetupProfileLanguage),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatIsYourLanguage.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            _buildLanguagePicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagePicker() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60.setHeight),
          child: Container(
            height: 120.setHeight,
            width: 0.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    scrollController: _languageController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
                    onSelectedItemChanged: (index) {
                      selectedLanguage.value = languages[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: languages.map((language) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedLanguage,
                          builder: (context, selectedValue, child) {
                            final isSelected = language == selectedValue;
                            return CommonText(
                              text: language,
                              fontSize: isSelected ? 25.setFontSize : 20.setFontSize,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0.screenWidth / 5,
          bottom: 0,
          top: 50.setHeight,
          child: Image.asset(
            AppAssets.icTriangleRight,
            height: 20.setHeight,
            width: 20.setHeight,
          ),
        ),
      ],
    );
  }
}
