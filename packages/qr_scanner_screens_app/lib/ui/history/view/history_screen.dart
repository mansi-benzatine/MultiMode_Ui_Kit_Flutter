import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../../dialogs/alerts/history_delete_confirmation_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    implements TopBarClickListener {
  List<Map<String, dynamic>>? historyList;

  ValueNotifier<bool> isDeleteMode = ValueNotifier(false);
  ValueNotifier<bool> isSelectAll = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    historyList = null;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      historyList = [];
      historyList?.clear();
      historyList?.add({
        'icon': AppAssets.icContentClipboard,
        'name': Languages.of(context).txtContentFromClipboard,
        'description': 'https://en.wikipedia.org/wiki...',
        'date': '2025-07-25',
        'time': '12:15 PM',
        'isFavorite': false,
        'isSelected': false,
        'type': Constant.toolContentFromClipboard,
      });
      historyList?.add({
        'icon': AppAssets.icWebsite,
        'name': Languages.of(context).txtWebsite,
        'description': 'https://www.google.com',
        'date': '2025-07-24',
        'time': '10:15 AM',
        'isFavorite': true,
        'isSelected': false,
        'type': Constant.toolWebsite,
      });
      historyList?.add({
        'icon': AppAssets.icText,
        'name': Languages.of(context).txtText,
        'description': 'software engineering',
        'date': '2025-07-24',
        'time': '10:15 PM',
        'isFavorite': true,
        'isSelected': false,
        'type': Constant.toolText,
      });
      historyList?.add({
        'icon': AppAssets.icContact,
        'name': Languages.of(context).txtContact,
        'description': 'BEGIN:VCARD',
        'date': '2025-07-23',
        'time': '10:15 AM',
        'isFavorite': true,
        'isSelected': false,
        'type': Constant.toolContact,
      });
      historyList?.add({
        'icon': AppAssets.icEmail,
        'name': Languages.of(context).txtEmail,
        'description': 'john.doe@example.com',
        'date': '2025-07-23',
        'time': '11:00 PM',
        'isFavorite': false,
        'isSelected': false,
        'type': Constant.toolEmail,
      });
      historyList?.add({
        'icon': AppAssets.icSms,
        'name': Languages.of(context).txtSms,
        'description': 'Hello, how are you?',
        'date': '2025-07-20',
        'time': '9:15 AM',
        'isFavorite': true,
        'isSelected': false,
        'type': Constant.toolSms,
      });
      historyList?.add({
        'icon': AppAssets.icLocation,
        'name': Languages.of(context).txtLocation,
        'description': '21.2325416, 72.8355564',
        'date': '2025-07-20',
        'time': '2:15 PM',
        'isFavorite': false,
        'isSelected': false,
        'type': Constant.toolLocation,
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: isDeleteMode,
              builder: (context, value, child) => TopBar(
                this,
                title: Languages.of(context).txtHistory,
                isShowDelete: true,
                isDeleteEnabled: value,
                isShowDone: value,
              ),
            ),
            Expanded(
              child: historyList == null
                  ? const SizedBox.shrink()
                  : (historyList?.isEmpty ?? true)
                      ? _buildEmptyHistory()
                      : ListView.builder(
                          itemCount: historyList?.length ?? 0,
                          padding: EdgeInsets.only(
                              left: 16.setWidth,
                              right: 16.setWidth,
                              top: 16.setHeight,
                              bottom: 30.setHeight),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (isDeleteMode.value) {
                                  // showDeleteDialog();
                                  historyList?[index]['isSelected'] =
                                      !historyList?[index]['isSelected'];
                                  isSelectAll.value = historyList?.every(
                                          (element) =>
                                              element['isSelected'] == true) ??
                                      false;
                                  isDeleteMode.value = historyList?.any(
                                          (element) =>
                                              element['isSelected'] == true) ??
                                      false;
                                  setState(() {});
                                } else {
                                  /*  if (historyList?[index] != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                QrCodeResultScreen(
                                                    qrType:
                                                        historyList![index])));
                                  }*/
                                }
                              },
                              onLongPress: () {
                                if (isDeleteMode.value) {
                                  historyList?[index]['isSelected'] =
                                      !historyList?[index]['isSelected'];
                                  isSelectAll.value = historyList?.every(
                                          (element) =>
                                              element['isSelected'] == true) ??
                                      false;
                                  isDeleteMode.value = historyList?.any(
                                          (element) =>
                                              element['isSelected'] == true) ??
                                      false;
                                  setState(() {});
                                } else {
                                  isDeleteMode.value = true;
                                  historyList?[index]['isSelected'] = true;
                                  isSelectAll.value = historyList?.every(
                                          (element) =>
                                              element['isSelected'] == true) ??
                                      false;
                                  isDeleteMode.value = historyList?.any(
                                          (element) =>
                                              element['isSelected'] == true) ??
                                      false;
                                  setState(() {});
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(bottom: 16.setHeight),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.setWidth,
                                    vertical: 12.setHeight),
                                decoration: BoxDecoration(
                                  color: (historyList?[index]['isSelected'])
                                      ? CustomAppColor.of(context).primary
                                      : CustomAppColor.of(context).bgCard,
                                  borderRadius:
                                      BorderRadius.circular(12.setHeight),
                                  border: Border.all(
                                    color: CustomAppColor.of(context)
                                        .containerBorder,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      historyList?[index]['icon'],
                                      height: 50.setHeight,
                                      width: 50.setWidth,
                                    ),
                                    SizedBox(width: 16.setWidth),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CommonText(
                                            text: historyList?[index]['name'],
                                            fontSize: 14.setFontSize,
                                            fontWeight: FontWeight.w500,
                                            maxLines: 1,
                                            textColor: (historyList?[index]
                                                    ['isSelected'])
                                                ? CustomAppColor.of(context)
                                                    .txtWhite
                                                : CustomAppColor.of(context)
                                                    .txtBlack,
                                          ),
                                          SizedBox(height: 4.setHeight),
                                          CommonText(
                                            text: historyList?[index]
                                                ['description'],
                                            fontSize: 12.setFontSize,
                                            fontWeight: FontWeight.w400,
                                            textColor: (historyList?[index]
                                                    ['isSelected'])
                                                ? CustomAppColor.of(context)
                                                    .txtWhite
                                                : CustomAppColor.of(context)
                                                    .txtDarkGray,
                                          ),
                                          SizedBox(height: 8.setHeight),
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppAssets.icDate,
                                                height: 14.setHeight,
                                                width: 14.setWidth,
                                                color: (historyList?[index]
                                                        ['isSelected'])
                                                    ? CustomAppColor.of(context)
                                                        .txtWhite
                                                    : CustomAppColor.of(context)
                                                        .primary,
                                              ),
                                              SizedBox(width: 4.setWidth),
                                              CommonText(
                                                text: historyList?[index]
                                                    ['date'],
                                                fontSize: 12.setFontSize,
                                                fontWeight: FontWeight.w400,
                                                textColor: (historyList?[index]
                                                        ['isSelected'])
                                                    ? CustomAppColor.of(context)
                                                        .txtWhite
                                                    : CustomAppColor.of(context)
                                                        .txtDarkGray,
                                              ),
                                              SizedBox(width: 16.setWidth),
                                              Image.asset(
                                                AppAssets.icTime,
                                                height: 16.setHeight,
                                                width: 16.setWidth,
                                                color: (historyList?[index]
                                                        ['isSelected'])
                                                    ? CustomAppColor.of(context)
                                                        .txtWhite
                                                    : CustomAppColor.of(context)
                                                        .primary,
                                              ),
                                              SizedBox(width: 4.setWidth),
                                              CommonText(
                                                text: historyList?[index]
                                                    ['time'],
                                                fontSize: 12.setFontSize,
                                                fontWeight: FontWeight.w400,
                                                textColor: (historyList?[index]
                                                        ['isSelected'])
                                                    ? CustomAppColor.of(context)
                                                        .txtWhite
                                                    : CustomAppColor.of(context)
                                                        .txtDarkGray,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 16.setWidth),
                                    GestureDetector(
                                      onTap: () {
                                        if (!isDeleteMode.value) {
                                          historyList?[index]['isFavorite'] =
                                              !historyList?[index]
                                                  ['isFavorite'];
                                          setState(() {});
                                        }
                                      },
                                      child: Image.asset(
                                        (historyList?[index]['isFavorite'])
                                            ? AppAssets.icTabFavoriteSelected
                                            : AppAssets.icTabFavorite,
                                        color: (historyList?[index]
                                                ['isSelected'])
                                            ? CustomAppColor.of(context)
                                                .txtWhite
                                            : CustomAppColor.of(context)
                                                .primary,
                                        height: 24.setHeight,
                                        width: 24.setWidth,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyHistory() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.icNoDataFoundHistory,
            width: 180.setWidth,
            height: 180.setHeight,
          ),
          SizedBox(height: 16.setHeight),
          CommonText(
            text: Languages.of(context).txtNoHistoryFound,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: Languages.of(context).txtYouHaveNoHistoryMsg,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
        ],
      ),
    );
  }

  void showDeleteDialog() {
    showDialog(
            context: context,
            builder: (_) =>
                HistoryDeleteConfirmationDialog(parentContext: context))
        .then((value) {
      if (value == true) {
        historyList?.removeWhere((element) => element['isSelected'] == true);
        isDeleteMode.value = false;
        setState(() {});
      }
    });
  }

  @override
  void onTopBarClick(String title, {bool value = false}) {
    if (title == Constant.strBack) {
      Navigator.pop(context);
    }
    if (title == Constant.strDelete) {
      if (isDeleteMode.value) {
        showDeleteDialog();
      } else {
        isDeleteMode.value = !isDeleteMode.value;
        if (!isDeleteMode.value) {
          for (var element in historyList ?? []) {
            element['isSelected'] = false;
          }
        }
        setState(() {});
      }
    }
    if (title == Constant.strDone) {
      if (isSelectAll.value) {
        for (var element in historyList ?? []) {
          element['isSelected'] = false;
        }
        isDeleteMode.value = false;
      } else {
        for (var element in historyList ?? []) {
          element['isSelected'] = true;
        }
      }
      isSelectAll.value = !isSelectAll.value;
      setState(() {});
    }
  }
}
