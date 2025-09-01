import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';

import '../../../dialogs/alerts/favorite_delete_confirmation_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../qr_code_result/view/qr_code_result_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> implements TopBarClickListener {
  List<Map<String, dynamic>>? favoriteList;

  ValueNotifier<bool> isDeleteMode = ValueNotifier(false);
  ValueNotifier<bool> isSelectAll = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    favoriteList = null;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      favoriteList = [];
      favoriteList?.clear();
      favoriteList?.add({
        'icon': AppAssets.icWebsite,
        'name': Languages.of(context).txtWebsite,
        'description': 'https://www.google.com',
        'date': '2025-07-24',
        'time': '10:15 AM',
        'isSelected': false,
        'type': Constant.toolWebsite,
      });
      favoriteList?.add({
        'icon': AppAssets.icText,
        'name': Languages.of(context).txtText,
        'description': 'software engineering',
        'date': '2025-07-24',
        'time': '10:15 PM',
        'isSelected': false,
        'type': Constant.toolText,
      });
      favoriteList?.add({
        'icon': AppAssets.icEmail,
        'name': Languages.of(context).txtEmail,
        'description': 'john.doe@example.com',
        'date': '2025-07-23',
        'time': '11:00 PM',
        'isSelected': false,
        'type': Constant.toolEmail,
      });
      favoriteList?.add({
        'icon': AppAssets.icLocation,
        'name': Languages.of(context).txtLocation,
        'description': '21.2325416, 72.8355564',
        'date': '2025-07-20',
        'time': '2:15 PM',
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
              builder: (context, value, child) => TopBar(this, title: Languages.of(context).txtFavorite, isShowDelete: true, isShowDone: value, isDeleteEnabled: value),
            ),
            Expanded(
              child: favoriteList == null
                  ? const SizedBox.shrink()
                  : (favoriteList?.isEmpty ?? true)
                      ? _buildEmptyFavorite()
                      : _buildFavoriteList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyFavorite() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.icNoDataFoundFavorite,
            width: 135.setWidth,
            gaplessPlayback: true,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 16.setHeight),
          CommonText(
            text: Languages.of(context).txtNoFavoriteFound,
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: Languages.of(context).txtYouHaveNoFavoriteMsg,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteList() {
    return ListView.builder(
      itemCount: favoriteList?.length ?? 0,
      padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 16.setHeight, bottom: 30.setHeight),
      itemBuilder: (context, index) => _buildFavoriteItem(favoriteList![index]),
    );
  }

  Widget _buildFavoriteItem(Map<String, dynamic> item) {
    return GestureDetector(
        onTap: () {
          if (isDeleteMode.value) {
            // showDeleteDialog();
            item['isSelected'] = !item['isSelected'];
            isSelectAll.value = favoriteList?.every((element) => element['isSelected'] == true) ?? false;
            isDeleteMode.value = favoriteList?.any((element) => element['isSelected'] == true) ?? false;
            setState(() {});
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QrCodeResultScreen(qrType: item)));
          }
        },
        onLongPress: () {
          if (isDeleteMode.value) {
            item['isSelected'] = !item['isSelected'];
            isSelectAll.value = favoriteList?.every((element) => element['isSelected'] == true) ?? false;
            isDeleteMode.value = favoriteList?.any((element) => element['isSelected'] == true) ?? false;
            setState(() {});
          } else {
            isDeleteMode.value = true;
            item['isSelected'] = true;
            isSelectAll.value = favoriteList?.every((element) => element['isSelected'] == true) ?? false;
            isDeleteMode.value = favoriteList?.any((element) => element['isSelected'] == true) ?? false;
            setState(() {});
          }
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.setHeight),
          padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 12.setHeight),
          decoration: BoxDecoration(
            color: (item['isSelected']) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgCard,
            borderRadius: BorderRadius.circular(12.setHeight),
            border: Border.all(
              color: CustomAppColor.of(context).containerBorder,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                item['icon'],
                height: 50.setHeight,
                width: 50.setWidth,
              ),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: item['name'],
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      maxLines: 1,
                      textColor: (item['isSelected']) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: item['description'],
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: (item['isSelected']) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                    ),
                    SizedBox(height: 8.setHeight),
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icDate,
                          height: 14.setHeight,
                          width: 14.setWidth,
                          color: (item['isSelected']) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).primary,
                        ),
                        SizedBox(width: 4.setWidth),
                        CommonText(
                          text: item['date'],
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: (item['isSelected']) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                        ),
                        SizedBox(width: 16.setWidth),
                        Image.asset(
                          AppAssets.icTime,
                          height: 16.setHeight,
                          width: 16.setWidth,
                          color: (item['isSelected']) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).primary,
                        ),
                        SizedBox(width: 4.setWidth),
                        CommonText(
                          text: item['time'],
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: (item['isSelected']) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void showDeleteDialog() {
    showDialog(
        context: context,
        builder: (_) => FavoriteDeleteConfirmationDialog(
              parentContext: context,
            )).then((value) {
      if (value == true) {
        favoriteList?.removeWhere((element) => element['isSelected'] == true);
        isDeleteMode.value = false;
        setState(() {});
      }
    });
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strDelete) {
      if (isDeleteMode.value) {
        showDeleteDialog();
      } else {
        isDeleteMode.value = !isDeleteMode.value;
        if (!isDeleteMode.value) {
          for (var element in favoriteList ?? []) {
            element['isSelected'] = false;
          }
        }
        setState(() {});
      }
    }
    if (name == Constant.strDone) {
      if (isSelectAll.value) {
        for (var element in favoriteList ?? []) {
          element['isSelected'] = false;
        }
        isDeleteMode.value = false;
      } else {
        for (var element in favoriteList ?? []) {
          element['isSelected'] = true;
        }
      }
      isSelectAll.value = !isSelectAll.value;
      setState(() {});
    }
  }
}
