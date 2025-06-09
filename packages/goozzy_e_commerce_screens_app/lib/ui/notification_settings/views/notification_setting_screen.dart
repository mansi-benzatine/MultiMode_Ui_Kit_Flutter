import 'package:flutter/material.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../app/my_app.dart';
import '../datamodel/notification_settings_data.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const NotificationSettingsScreen());
  }

  @override
  NotificationSettingsScreenState createState() => NotificationSettingsScreenState();
}

class NotificationSettingsScreenState extends State<NotificationSettingsScreen> implements TopBarClickListener {
  bool enableForYou = false;
  bool selectAll = false;

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      for (var category in categories) {
        category.isSelected = selectAll;
      }
    });
  }

  void toggleCategory(int index) {
    setState(() {
      categories[index].isSelected = !categories[index].isSelected;
      selectAll = categories.every((category) => category.isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                isShowBack: true,
                title: Languages.of(context).notificationSettings,
                textColor: CustomAppColor.of(context).txtBlack,
                topBarColor: CustomAppColor.of(context).bgTopBar,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(10)),
                    child: CommonText(
                      text: Languages.of(context).enableNotification.toUpperCase(),
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(6)),
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      title: CommonText(
                        text: AppStrings.forYou,
                        textAlign: TextAlign.start,
                        fontSize: AppSizes.setFontSize(15),
                        fontWeight: FontWeight.w400,
                      ),
                      value: enableForYou,
                      onChanged: (bool? value) {
                        setState(() {
                          enableForYou = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setHeight(16), vertical: AppSizes.setHeight(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).allCollections,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSizes.setFontSize(18),
                        ),
                        GestureDetector(
                          onTap: toggleSelectAll,
                          child: CommonText(
                            text: selectAll ? Languages.of(context).unselectAll.toUpperCase() : Languages.of(context).selectAll.toUpperCase(),
                            textColor: CustomAppColor.of(context).txtPurple,
                            fontSize: AppSizes.setFontSize(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(16)),
                    child: const Divider(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setHeight(16)),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          activeColor: CustomAppColor.of(context).btnPurple,
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: CommonText(
                            text: categories[index].name,
                            textAlign: TextAlign.start,
                            fontSize: AppSizes.setFontSize(15),
                            fontWeight: categories[index].isSelected ? FontWeight.w500 : FontWeight.w400,
                            textColor: categories[index].isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGrey,
                          ),
                          value: categories[index].isSelected,
                          onChanged: (bool? value) {
                            toggleCategory(index);
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgBlackWhiteScaffold,
                      border: Border(
                        top: BorderSide(color: CustomAppColor.of(context).dividerGrey, width: 2),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setHeight(16), vertical: AppSizes.setHeight(15)),
                    child: CommonButton(
                      btnText: Languages.of(context).saveChanges,
                      radius: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context);
    }
  }
}
