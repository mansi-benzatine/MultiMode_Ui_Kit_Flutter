import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';

import '../../../dialogs/alerts/change_camera_type_dialog.dart';
import '../../../dialogs/alerts/change_theme_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../app/my_app.dart';
// import '../../introduction/view/introduction_screen.dart';
import '../../introdution/introdution_screen.dart';
import '../../languages_options/view/languages_options_screen.dart';
import '../../pro_version/view/pro_version_screen.dart';
import '../../qr_code_setting/view/qr_code_setting_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
          child: Column(
        children: [
          TopBar(this, title: Languages.of(context).txtSettings),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: 16.setWidth,
                right: 16.setWidth,
                top: 16.setHeight,
                bottom: 30.setHeight),
            child: Column(
              children: [
                _buildProWidget(),
                SizedBox(height: 16.setHeight),
                Divider(
                  color: CustomAppColor.of(context).containerBorder,
                  height: 1.setHeight,
                ),
                SizedBox(height: 16.setHeight),
                const _GeneralSettingWidget(),
                SizedBox(height: 25.setHeight),
                _ScanControlWidget(),
                SizedBox(height: 25.setHeight),
                const _SupprtUsWidget(),
                SizedBox(height: 25.setHeight),
                const _AboutUsWidget(),
                SizedBox(height: 25.setHeight),
              ],
            ),
          )),
        ],
      )),
    );
  }

  Widget _buildProWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProVersionScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).primary,
          borderRadius: BorderRadius.circular(12.setHeight),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 16.setWidth, vertical: 16.setHeight),
        child: Row(
          children: [
            Image.asset(
              AppAssets.icPro,
              width: 90.setWidth,
              fit: BoxFit.contain,
              color: CustomAppColor.of(context).txtWhite,
            ),
            SizedBox(width: 16.setWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtProVersion,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtWhite,
                  ),
                  SizedBox(height: 4.setHeight),
                  CommonText(
                    text: Languages.of(context).txtRemoveAds,
                    fontSize: 20.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtWhite,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: CustomAppColor.of(context).txtWhite,
              size: 20.setHeight,
            ),
          ],
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

class _GeneralSettingWidget extends StatelessWidget {
  const _GeneralSettingWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(12.setHeight),
        border: Border.all(
            color: CustomAppColor.of(context).containerBorder,
            width: 1.setHeight),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtGeneral.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          _buildQrCodeSettingsWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildIntroductionWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildThemeWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildLanguageSettingWidget(context),
        ],
      ),
    );
  }

  Widget _buildQrCodeSettingsWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const QrCodeSettingScreen()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.setWidth,
            height: 45.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.setHeight),
            child: Image.asset(
              AppAssets.icTabScan,
              width: 24.setWidth,
              height: 24.setHeight,
              color: CustomAppColor.of(context).txtWhite,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtQrCodeSettings,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Image.asset(
            AppAssets.icProSmall,
            width: 30.setWidth,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.setWidth),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: CustomAppColor.of(context).primary,
            size: 20.setHeight,
          ),
        ],
      ),
    );
  }

  Widget _buildIntroductionWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const IntroductionScreen()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.setWidth,
            height: 45.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.setHeight),
            child: Image.asset(
              AppAssets.icIntroduction,
              width: 24.setWidth,
              height: 24.setHeight,
              color: CustomAppColor.of(context).txtWhite,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtIntroduction,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: CustomAppColor.of(context).primary,
            size: 20.setHeight,
          ),
        ],
      ),
    );
  }

  Widget _buildThemeWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (dialogContext) =>
                ChangeThemeDialog(parentContext: context)).then((value) {
          if (value != null) {
            getIt
                .get<LocalStorageService>()
                .setBool(LocalStorageService.isLightTheme, value);
            Debug.printLog(
                "isLightTheme: ${getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false)}");
            if (context.mounted) {
              QrScannerApp.changeTheme(context, AppTheme.getTheme(context));
              (context as Element).markNeedsBuild();
            }
          }
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.setWidth,
            height: 45.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(10.setHeight),
            child: Image.asset(
              AppAssets.icTheme,
              width: 24.setWidth,
              height: 24.setHeight,
              color: CustomAppColor.of(context).txtWhite,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtTheme,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 16.setWidth),
          CommonText(
            text: Utils.isLightTheme()
                ? Languages.of(context).txtLight
                : Languages.of(context).txtDark,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).primary,
            textAlign: TextAlign.start,
          ),
          SizedBox(width: 5.setWidth),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: CustomAppColor.of(context).primary,
            size: 20.setHeight,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSettingWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LanguagesOptionsScreen()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.setWidth,
            height: 45.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(8.setHeight),
            child: Image.asset(
              AppAssets.icLanguageSetting,
              width: 24.setWidth,
              height: 24.setHeight,
              color: CustomAppColor.of(context).txtWhite,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtLanguageSetting,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 16.setWidth),
          CommonText(
            text: "🇺🇸",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).primary,
            textAlign: TextAlign.start,
          ),
          SizedBox(width: 8.setWidth),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: CustomAppColor.of(context).primary,
            size: 20.setHeight,
          ),
        ],
      ),
    );
  }
}

class _ScanControlWidget extends StatelessWidget {
  _ScanControlWidget();

  final ValueNotifier<bool> isPlaySound = ValueNotifier(true);
  final ValueNotifier<bool> isVibrate = ValueNotifier(true);
  final ValueNotifier<bool> isAutoWebSearch = ValueNotifier(false);
  final ValueNotifier<bool> isClipboardToClipboard = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(12.setHeight),
        border: Border.all(
            color: CustomAppColor.of(context).containerBorder,
            width: 1.setHeight),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtScanControls.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          _buildPlaySoundWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildVibrateWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildClipboardToClipboardWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildAutoWebSearchWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildCameraTypeWidget(context),
        ],
      ),
    );
  }

  Widget _buildPlaySoundWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icPlaySound,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtPlaySound,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        ValueListenableBuilder(
          valueListenable: isPlaySound,
          builder: (context, value, child) {
            return Switch(
              value: value,
              activeColor: CustomAppColor.of(context).txtWhite,
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveThumbColor: CustomAppColor.of(context).txtWhite,
              inactiveTrackColor:
                  CustomAppColor.of(context).switchInactiveTrackColor,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: (value) {
                isPlaySound.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildVibrateWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icVibrate,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtVibrate,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        ValueListenableBuilder(
          valueListenable: isVibrate,
          builder: (context, value, child) {
            return Switch(
              value: value,
              activeColor: CustomAppColor.of(context).txtWhite,
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveThumbColor: CustomAppColor.of(context).txtWhite,
              inactiveTrackColor:
                  CustomAppColor.of(context).switchInactiveTrackColor,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: (value) {
                isVibrate.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildClipboardToClipboardWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icClipboardToClipboard,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtClipboardToClipboard,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        ValueListenableBuilder(
          valueListenable: isClipboardToClipboard,
          builder: (context, value, child) {
            return Switch(
              value: value,
              activeColor: CustomAppColor.of(context).txtWhite,
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveThumbColor: CustomAppColor.of(context).txtWhite,
              inactiveTrackColor:
                  CustomAppColor.of(context).switchInactiveTrackColor,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: (value) {
                isClipboardToClipboard.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildAutoWebSearchWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icAutoWebSearch,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtAutoWebSearch,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        ValueListenableBuilder(
          valueListenable: isAutoWebSearch,
          builder: (context, value, child) {
            return Switch(
              value: value,
              activeColor: CustomAppColor.of(context).txtWhite,
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveThumbColor: CustomAppColor.of(context).txtWhite,
              inactiveTrackColor:
                  CustomAppColor.of(context).switchInactiveTrackColor,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: (value) {
                isAutoWebSearch.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildCameraTypeWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => ChangeCameraTypeDialog(parentContext: context));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.setWidth,
            height: 45.setHeight,
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).primary,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(10.setHeight),
            child: Image.asset(
              AppAssets.icCameraType,
              width: 24.setWidth,
              height: 24.setHeight,
              color: CustomAppColor.of(context).txtWhite,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 16.setWidth),
          Expanded(
            child: CommonText(
              text: Languages.of(context).txtCameraType,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(width: 16.setWidth),
          CommonText(
            text: Languages.of(context).txtRare,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).primary,
          ),
          SizedBox(width: 5.setWidth),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: CustomAppColor.of(context).primary,
            size: 20.setHeight,
          ),
        ],
      ),
    );
  }
}

class _SupprtUsWidget extends StatelessWidget {
  const _SupprtUsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(12.setHeight),
        border: Border.all(
            color: CustomAppColor.of(context).containerBorder,
            width: 1.setHeight),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtSupportUs.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          _buildFeedbackWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildRateUsWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildShareWidget(context),
        ],
      ),
    );
  }

  Widget _buildFeedbackWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icFeedback,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtFeedback,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: CustomAppColor.of(context).primary,
          size: 20.setHeight,
        ),
      ],
    );
  }

  Widget _buildRateUsWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.star_rounded,
            color: CustomAppColor.of(context).txtWhite,
            size: 30.setHeight,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtRateUs,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: CustomAppColor.of(context).primary,
          size: 20.setHeight,
        ),
      ],
    );
  }

  Widget _buildShareWidget(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icShare,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtShareWithFriends,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: CustomAppColor.of(context).primary,
          size: 20.setHeight,
        ),
      ],
    );
  }
}

class _AboutUsWidget extends StatelessWidget {
  const _AboutUsWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(12.setHeight),
        border: Border.all(
            color: CustomAppColor.of(context).containerBorder,
            width: 1.setHeight),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtAboutUs.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          _buildPrivacyPolicyWidget(context),
          SizedBox(height: 10.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1.setHeight,
          ),
          SizedBox(height: 10.setHeight),
          _buildAppVersionWidget(context),
        ],
      ),
    );
  }

  Widget _buildPrivacyPolicyWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icPrivacyPolicy,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        CommonText(
          text: Languages.of(context).txtPrivacyPolicy,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget _buildAppVersionWidget(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45.setWidth,
          height: 45.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icAppVersion,
            width: 24.setWidth,
            height: 24.setHeight,
            color: CustomAppColor.of(context).txtWhite,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: 16.setWidth),
        Expanded(
          child: CommonText(
            text: Languages.of(context).txtAppVersion,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 16.setWidth),
        CommonText(
          text: "V 1.0.0",
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).primary,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
