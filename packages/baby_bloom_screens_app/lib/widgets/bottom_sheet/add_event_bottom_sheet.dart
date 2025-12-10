import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/notification_popup/view/notification_popup_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../utils/app_color.dart';
import '../button/common_button.dart';

class AddEventBottomSheet extends StatefulWidget {
  final String date;
  final int selectedIndex;

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddEventBottomSheet());
  }

  const AddEventBottomSheet({super.key, this.date = "Wednesday, August 20", this.selectedIndex = 0});

  @override
  State<AddEventBottomSheet> createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {
  final List<Map<String, dynamic>> _eventCategories = [
    {
      'name': 'Logs',
      'color': Colors.red,
      'icon': AppAssets.icHeart,
    },
    {
      'name': 'Visits',
      'color': Colors.blue,
      'icon': AppAssets.icVisit,
    },
    {
      'name': 'Milestones',
      'color': Colors.orange,
      'icon': AppAssets.icMilestone,
    },
    {
      'name': 'Reminder',
      'color': Colors.green,
      'icon': AppAssets.icReminder,
    },
  ];
  int _selectedCategoryIndex = -1;
  final TextEditingController controller = TextEditingController();
  ValueNotifier<bool> isReminder = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedCategoryIndex = widget.selectedIndex;
    if (_selectedCategoryIndex == 3) {
      isReminder.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: 15.setHeight),
              Center(
                child: Container(
                  width: 40.setWidth,
                  height: 3.setHeight,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: widget.date,
                fontSize: 18.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15.setHeight),
              Wrap(
                spacing: 8.setWidth,
                runSpacing: 8.setHeight,
                children: List.generate(_eventCategories.length, (index) {
                  final category = _eventCategories[index];
                  final isSelected = _selectedCategoryIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 6.setHeight),
                      decoration: BoxDecoration(
                        color: isSelected ? category['color'].withOpacity(0.1) : CustomAppColor.of(context).btnGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            category['icon'],
                            height: 14.setHeight,
                            width: 14.setWidth,
                            color: isSelected ? category['color'] : Colors.grey,
                          ),
                          SizedBox(width: 6.setWidth),
                          CommonText(
                            text: category['name'],
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: isSelected ? category['color'] : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 15.setHeight),
              CommonTextFormField(
                radius: 15,
                controller: controller,
                hintText: Languages.of(context).txtEnterYourNote,
                maxLines: 5,
                minLines: 5,
              ),
              SizedBox(height: 15.setHeight),
              Row(
                children: [
                  ValueListenableBuilder(
                      valueListenable: isReminder,
                      builder: (context, value, child) {
                        return FlutterSwitch(
                          value: value,
                          onToggle: (bool newValue) {
                            setState(() {
                              isReminder.value = newValue;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveColor: CustomAppColor.of(context).icGray,
                          activeToggleColor: CustomAppColor.of(context).white,
                          inactiveToggleColor: CustomAppColor.of(context).white,
                          width: 40.setWidth,
                          height: 22.setHeight,
                          toggleSize: 16.0,
                          borderRadius: 16.0,
                          padding: 2.5,
                        );
                      }),
                  SizedBox(width: 10.setWidth),
                  CommonText(
                    text: "Reminder",
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                ],
              ),
              SizedBox(height: 15.setHeight),
              GestureDetector(
                onTap: () => Navigator.push(context, NotificationPopupScreen.route()),
                child: CommonText(
                  text: "*  Preview reminder screen",
                  fontSize: 12.setFontSize,
                  textAlign: TextAlign.start,
                  textColor: CustomAppColor.of(context).txtLightGrey,
                ),
              ),
              SizedBox(height: 15.setHeight),
              IgnorePointer(
                ignoring: true,
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        height: 44.setHeight,
                        text: "Cancel",
                        buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                        borderColor: CustomAppColor.of(context).btnGrey,
                        buttonColor: CustomAppColor.of(context).btnGrey,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    Expanded(
                      child: CommonButton(
                        height: 44.setHeight,
                        text: "Add",
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.setHeight),
            ],
          ),
        ),
      ),
    );
  }
}
