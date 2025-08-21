import 'package:flutter/cupertino.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class YourAgePage extends StatefulWidget {
  const YourAgePage({super.key});

  @override
  State<YourAgePage> createState() => _YourAgePageState();
}

class _YourAgePageState extends State<YourAgePage> {
  ValueNotifier<int> selectedAge = ValueNotifier(22);
  final FixedExtentScrollController _scrollController = FixedExtentScrollController(initialItem: 4);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtSelectYourCurrentAge,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w400,
          fontFamily: Constant.fontFamilyRegular400,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtDarkGray,
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: selectedAge,
            builder: (context, value, child) {
              return CupertinoPicker(
                scrollController: _scrollController,
                itemExtent: 120.setHeight,
                onSelectedItemChanged: (int index) {
                  selectedAge.value = 10 + index;
                },
                selectionOverlay: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).primary,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: CustomAppColor.of(context).borderColor, width: 6),
                  ),
                  padding: EdgeInsets.only(top: 15.setHeight),
                  child: CommonText(
                    text: selectedAge.value.toString(),
                    fontSize: 74.setFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontFamilyBold700,
                    textAlign: TextAlign.center,
                    textColor: CustomAppColor.of(context).txtBlack,
                    height: 1,
                  ),
                ),
                children: List.generate(
                  141,
                  (index) {
                    int age = 10 + index;
                    bool isSelected = age == selectedAge.value;

                    return Container(
                      height: 60.setHeight,
                      alignment: Alignment.center,
                      child: CommonText(
                        text: age.toString(),
                        fontSize: isSelected ? 74.setFontSize : 60.setFontSize,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                        fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilySemiBold600,
                        textAlign: TextAlign.center,
                        textColor: isSelected
                            ? CustomAppColor.of(context).txtWhite
                            : age == selectedAge.value - 1 || age == selectedAge.value + 1
                                ? CustomAppColor.of(context).txtBlack
                                : CustomAppColor.of(context).txtLightGray,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
