import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodels/edit_language_data.dart';

class EditLanguagesScreen extends StatefulWidget {
  final bool isShowEditAlert;
  const EditLanguagesScreen({super.key, this.isShowEditAlert = false});
  static Route<void> route({bool isShowEditAlert = false}) {
    return MaterialPageRoute(
        builder: (_) => EditLanguagesScreen(
              isShowEditAlert: isShowEditAlert,
            ));
  }

  @override
  State<EditLanguagesScreen> createState() => _EditLanguagesScreenState();
}

class _EditLanguagesScreenState extends State<EditLanguagesScreen> implements TopBarClickListener {
  List<Language> languageList = [
    Language("English"),
    Language("Korean"),
    Language("Urdu"),
    Language("Japanese"),
  ];

  final TextEditingController _languageController = TextEditingController();
  bool _isDialogOpen = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isShowEditAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showMatchDialog();
      });
    }
  }

  void _showMatchDialog() {
    setState(() {
      _isDialogOpen = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSwipeCard,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 5.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).passionContainerBg,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.close, color: CustomAppColor.of(context).txtPink),
                    ),
                  ),
                ),
                SizedBox(height: 5.setHeight),
                CommonText(
                  text: Languages.of(context).txtAddLanguages.toUpperCase(),
                  fontWeight: FontWeight.w800,
                  fontSize: 22.setFontSize,
                  textColor: CustomAppColor.of(context).txtVelvetPink,
                ),
                Divider(color: CustomAppColor.of(context).divider),
                SizedBox(height: 24.setHeight),
                CommonTextFormField(
                  controller: _languageController,
                  hintText: Languages.of(context).txtEnterLanguageYouKnow,
                ),
                SizedBox(height: 24.setHeight),
                CommonButton(
                  text: Languages.of(context).txtAdd.toUpperCase(),
                  onTap: () {},
                  height: 50.buttonHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    ).then((_) {
      if (_isDialogOpen) {
        print('LogoutDialog dismissed: Popping MyProfileScreen');
        setState(() {
          _isDialogOpen = false;
        });
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isDialogOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isDialogOpen) {
          print('PopScope: System back button pressed, isDialogOpen=$_isDialogOpen');
          Navigator.of(context).pop();
          setState(() {
            _isDialogOpen = false;
          });
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                isShowBack: true,
                title: Languages.of(context).txtEditLanguages,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 10.setWidth,
                          runSpacing: 5.setHeight,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: languageList.map((language) {
                            return Chip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide.none,
                              ),
                              label: CommonText(
                                text: language.name,
                                fontWeight: FontWeight.w700,
                                fontSize: 15.setFontSize,
                                textColor: CustomAppColor.of(context).txtVelvet,
                              ),
                              backgroundColor: CustomAppColor.of(context).passionContainerBg,
                              deleteIcon: const Icon(Icons.close),
                              onDeleted: () {
                                setState(() {
                                  languageList.remove(language);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: InkWell(
                  onTap: () => _showAddLanguageAlert(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14.setHeight),
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomAppColor.of(context).txtVelvetPink),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.icAdd,
                          width: 22.setWidth,
                          height: 22.setHeight,
                          color: CustomAppColor.of(context).txtVelvetPink,
                        ),
                        SizedBox(width: 10.setWidth),
                        CommonText(
                          text: Languages.of(context).txtAddLanguages.toUpperCase(),
                          fontWeight: FontWeight.w800,
                          fontSize: 15.setFontSize,
                          textColor: CustomAppColor.of(context).txtVelvetPink,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                  child: CommonButton(onTap: () => Navigator.pop(context), text: Languages.of(context).txtUpdate.toUpperCase()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAddLanguageAlert() {
    _languageController.clear();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 24.setWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgSwipeCard,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 5.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).passionContainerBg,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (dialogContext.mounted) {
                          Navigator.pop(dialogContext);
                        }
                      },
                      child: Icon(Icons.close, color: CustomAppColor.of(context).txtPink),
                    ),
                  ),
                ),
                SizedBox(height: 5.setHeight),
                CommonText(
                  text: Languages.of(context).txtAddLanguages.toUpperCase(),
                  fontWeight: FontWeight.w800,
                  fontSize: 22.setFontSize,
                  textColor: CustomAppColor.of(context).txtVelvetPink,
                ),
                Divider(color: CustomAppColor.of(context).divider),
                SizedBox(height: 24.setHeight),
                CommonTextFormField(
                  controller: _languageController,
                  hintText: Languages.of(context).txtEnterLanguageYouKnow,
                ),
                SizedBox(height: 24.setHeight),
                CommonButton(
                  text: Languages.of(context).txtAdd.toUpperCase(),
                  onTap: () {
                    if (dialogContext.mounted) {
                      Navigator.pop(dialogContext);
                    }
                  },
                  height: 50.buttonHeight,
                ),
              ],
            ),
          ),
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
