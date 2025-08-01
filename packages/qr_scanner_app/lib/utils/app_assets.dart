import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/qr_scanner_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = (Theme.of(context).brightness == Brightness.light) ? _pIcons : _pDarkIcons;
    themeImages = (Theme.of(context).brightness == Brightness.light) ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    /// IMAGES
    // imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
    // imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
    // imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";

    /// ICONS
    icBack = "${themeIcons}ic_back.webp";
    icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${_pImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${_pImages}img_on_boarding_3.webp";

  static const imgDummyQr = "${_pImages}img_dummy_qr.webp";

  /// ICONS ====================================================================
  static String icBack = "${themeIcons}ic_back.webp";

  static const icTabCreate = "${_pIcons}ic_bottombar_plus.webp";
  static const icTabHistory = "${_pIcons}ic_history.webp";
  static const icTabFavorite = "${_pIcons}ic_bottombar_star.webp";
  static const icTabSetting = "${_pIcons}ic_setting.webp";

  static const icTabCreateSelected = "${_pIcons}ic_bottombar_plus_selected.webp";
  static const icTabHistorySelected = "${_pIcons}ic_history_selected.webp";
  static const icTabFavoriteSelected = "${_pIcons}ic_bottombar_star_selected.webp";
  static const icTabSettingSelected = "${_pIcons}ic_setting_selected.webp";

  static const icTabScan = "${_pIcons}ic_bottombar_scan.webp";
  static const icGallery = "${_pIcons}ic_gallery.webp";

  static const icWifi = "${_pIcons}ic_wifi.webp";
  static const icWebsite = "${_pIcons}ic_website.webp";
  static const icText = "${_pIcons}ic_text.webp";
  static const icSms = "${_pIcons}ic_sms.webp";
  static const icLocation = "${_pIcons}ic_location.webp";
  static const icEvent = "${_pIcons}ic_event.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icContentClipboard = "${_pIcons}ic_content_clipboard.webp";
  static const icContact = "${_pIcons}ic_contact.webp";
  static const icCall = "${_pIcons}ic_call.webp";
  static const icBarcode = "${_pIcons}ic_barcode.webp";
  static const icApp = "${_pIcons}ic_app.webp";
  static const icTopBarScan = "${_pIcons}ic_top_bar_scan.webp";

  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icExcel = "${_pIcons}ic_excel.webp";
  static const icGoogleMeet = "${_pIcons}ic_google_meet.webp";
  static const icInstagram = "${_pIcons}ic_instagram.webp";
  static const icOutlook = "${_pIcons}ic_outlook.webp";
  static const icSharePoint = "${_pIcons}ic_share_point.webp";
  static const icTeams = "${_pIcons}ic_teams.webp";
  static const icWhatsApp = "${_pIcons}ic_whats_app.webp";
  static const icEdge = "${_pIcons}ic_edge.webp";

  static const icBarcodeOtherCode = "${_pIcons}ic_barcode_2d_code.webp";
  static const icBarcodeDummy = "${_pIcons}ic_barcode_dummy.webp";
  static const icDelete = "${_pIcons}ic_delete.webp";
  static const icDate = "${_pIcons}ic_calendar.webp";
  static const icTime = "${_pIcons}ic_time.webp";
  static const icDeleteHistoryDialog = "${_pIcons}ic_delete_history_dialog.webp";
  static const icPro = "${_pIcons}ic_pro.webp";
  static const icProSmall = "${_pIcons}ic_pro_small.webp";
  static const icIntroduction = "${_pIcons}ic_introduction.webp";
  static const icTheme = "${_pIcons}ic_theme.webp";
  static const icLanguageSetting = "${_pIcons}ic_language_setting.webp";
  static const icAutoWebSearch = "${_pIcons}ic_auto_web_search.webp";
  static const icCameraType = "${_pIcons}ic_camera_type.webp";
  static const icClipboardToClipboard = "${_pIcons}ic_clipboard_to_clipboard.webp";
  static const icPlaySound = "${_pIcons}ic_play_sound.webp";
  static const icVibrate = "${_pIcons}ic_vibrate.webp";
  static const icFeedback = "${_pIcons}ic_feedback.webp";
  static const icShare = "${_pIcons}ic_share.webp";
  static const icPrivacyPolicy = "${_pIcons}ic_privacy_policy.webp";
  static const icAppVersion = "${_pIcons}ic_app_version.webp";
  static const icNoAds = "${_pIcons}ic_no_ads.webp";
  static const icCustomize = "${_pIcons}ic_customize_color.webp";
  static const icCustomizeQrDesign = "${_pIcons}ic_customize_qr_code_design.webp";
  static const icQrCodeSetting = "${_pIcons}ic_qr_code_setting.webp";
  static const icFlipCamera = "${_pIcons}ic_flip_camera.webp";

  static String icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
  static String icNoDataFoundFavorite = "${themeIcons}ic_no_data_found_favorite.webp";
}
