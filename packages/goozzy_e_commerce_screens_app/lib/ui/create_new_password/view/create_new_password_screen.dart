import 'package:flutter/material.dart';

import '../../../../../utils/sizer_utils.dart';
import '../../../dialogs/alert/common_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final bool isShowAlert;
  const CreateNewPasswordScreen({super.key, this.isShowAlert = false});
  static Route route({bool isShowAlert = false}) {
    return MaterialPageRoute(builder: (context) => CreateNewPasswordScreen(isShowAlert: isShowAlert));
  }

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool _isDialogOpen = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isShowAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showCongratulationsDialog();
      });
    }
  }

  void _showCongratulationsDialog() {
    setState(() {
      _isDialogOpen = true;
    });
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return CommonDialog(
          icon: Image.asset(
            AppAssets.imgCongratulation,
            width: AppSizes.setWidth(120),
            height: AppSizes.setHeight(120),
          ),
          titleText: CommonText(
            text: Languages.of(context).congratulation,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(24),
            textColor: CustomAppColor.of(context).txtPurple,
          ),
          descriptionText: CommonText(
            text: Languages.of(context).yourAccountIsReady,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(14),
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          showLoader: true,
        );
      },
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
          Navigator.of(context).pop(); // Pop the dialog
          setState(() {
            _isDialogOpen = false;
          });
          Navigator.of(context).pop(); // Pop MyProfileScreen
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: SingleChildScrollView(
          child: SizedBox(
            width: AppSizes.fullWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
              child: Column(
                children: [
                  IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(50)),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => Navigator.pop(context),
                          icon: Image.asset(
                            AppAssets.icLeftArrow,
                            width: AppSizes.setWidth(20),
                            height: AppSizes.setHeight(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.imgAppLogo,
                    width: AppSizes.setWidth(80),
                    height: AppSizes.setHeight(80),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                    child: CommonText(
                      text: Languages.of(context).createNewPassword,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(24),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.setHeight(20), left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
                    child: CommonText(
                      text: Languages.of(context).enterNewPassword,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  ),
                  Image.asset(
                    AppAssets.imgNewPassword,
                    height: AppSizes.setHeight(195),
                    width: AppSizes.setWidth(275),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(32)),
                    child: CommonTextFormField(
                      borderColor: CustomAppColor.of(context).textFieldBorder,
                      leadingIcon: Image.asset(
                        AppAssets.icPassword,
                        width: AppSizes.setHeight(20),
                        height: AppSizes.setHeight(20),
                      ),
                      hintText: Languages.of(context).password,
                      isPasswordField: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
                    child: CommonTextFormField(
                      borderColor: CustomAppColor.of(context).textFieldBorder,
                      leadingIcon: Image.asset(
                        AppAssets.icPassword,
                        width: AppSizes.setHeight(20),
                        height: AppSizes.setHeight(20),
                      ),
                      hintText: Languages.of(context).confirmNewPassword,
                      isPasswordField: true,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(40), bottom: AppSizes.setHeight(30)),
                      child: CommonButton(
                        onTap: () {
                          dialogCongratulation(context);
                        },
                        btnText: Languages.of(context).updatePassword,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void dialogCongratulation(BuildContext context) {
    final dialogContext = context;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return CommonDialog(
          icon: Image.asset(
            AppAssets.imgCongratulation,
            width: AppSizes.setWidth(120),
            height: AppSizes.setHeight(120),
          ),
          titleText: CommonText(
            text: Languages.of(context).congratulation,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.setFontSize(24),
            textColor: CustomAppColor.of(context).txtPurple,
          ),
          descriptionText: CommonText(
            text: Languages.of(context).yourAccountIsReady,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(14),
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          showLoader: true,
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (dialogContext.mounted) {
        Navigator.of(dialogContext, rootNavigator: true).pop();
      }
    });
  }
}
