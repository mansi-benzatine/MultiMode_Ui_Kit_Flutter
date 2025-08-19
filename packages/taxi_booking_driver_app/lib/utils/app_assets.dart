import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/taxi_booking_driver_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(ThemeData themeData) {
    themeIcons = themeData.brightness == Brightness.light ? _pIcons : _pDarkIcons;
    themeImages = themeData.brightness == Brightness.light ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    imgAppLogoWithName = "${themeImages}img_app_logo_with_name.webp";
    icGoToNext = "${themeIcons}ic_go_to_next.webp";
    icThumbsUp = "${themeIcons}ic_thumbs_up.webp";
  }

  /// IMAGES ===================================================================
  static String imgWelcome = "${_pImages}img_welcome.webp";
  static String imgAppLogoWithName = "${themeImages}img_app_logo_with_name.webp";
  static String imgDummyProfile = "${_pImages}img_dummy_profile.webp";
  static String imgDummyDriverProfile = "${_pImages}img_dummy_driver_profile.webp";
  static String imgMapHome = "${_pImages}img_map_home.webp";
  static String imgEnableLocation = "${_pImages}img_enable_location.webp";
  static String imgMapCustomerLocation = "${_pImages}img_map_customer_location.webp";
  static String imgMapArrivedAtLocation = "${_pImages}img_map_arrived_at_location.webp";
  static String imgMapArrivedDestination = "${_pImages}img_map_arrived_destination.webp";
  static String imgMapDestination = "${_pImages}img_map_destination.webp";
  static String imgDummyLocalId = "${_pImages}img_dummy_local_id.webp";
  static String imgDummyDrivingDetail = "${_pImages}img_dummy_driving_detail.webp";
  static String imgDummyDrivingLicence = "${_pImages}img_dummy_driving_licence.webp";
  static String imgDummyBank = "${_pImages}img_dummy_bank.webp";

  /// ICONS ====================================================================

  static String icBack = "${_pIcons}ic_back.webp";
  static String icCallRound = "${_pIcons}ic_call_round.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icGoToNext = "${themeIcons}ic_go_to_next.webp";
  static String icThumbsUp = "${themeIcons}ic_thumbs_up.webp";
  static String icGreyThumbUp = "${_pIcons}ic_grey_thumbs_up.webp";
  static String icEditRound = "${_pIcons}ic_edit_round.webp";
  static String icMenu = "${_pIcons}ic_menu.webp";
  static String icLocation = "${_pIcons}ic_location.webp";
  static String icWork = "${_pIcons}ic_work.webp";
  static String icSettings = "${_pIcons}ic_settings.webp";
  static String icNotification = "${_pIcons}ic_notification.webp";
  static String icLogout = "${_pIcons}ic_logout.webp";
  static String icWallet = "${_pIcons}ic_wallet.webp";
  static String icGift = "${_pIcons}ic_gift.webp";
  static String icPolicy = "${_pIcons}ic_policy.webp";
  static String icHome = "${_pIcons}ic_home.webp";
  static String icHistory = "${_pIcons}ic_history.webp";
  static String icCoupon = "${_pIcons}ic_coupon.webp";
  static String icCancel = "${_pIcons}ic_cancel.webp";
  static String icCheck = "${_pIcons}ic_check.webp";
  static String icPayment = "${_pIcons}ic_payment.webp";
  static String icReceipt = "${_pIcons}ic_receipt.webp";
  static String icSecurity = "${_pIcons}ic_security.webp";
  static String icSignOut = "${_pIcons}ic_signout.webp";
  static String icVerifyUser = "${_pIcons}ic_verified_user.webp";
  static String icDelete = "${_pIcons}ic_delete.webp";
  static String icDarkMode = "${_pIcons}ic_dark_mode.webp";
  static String icRedLogout = "${_pIcons}ic_red_logout.webp";
  static String icRedDelete = "${_pIcons}ic_red_delete.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icDollar = "${_pIcons}ic_dollar.webp";
  static String icClock = "${_pIcons}ic_clock.webp";
  static String icChat = "${_pIcons}ic_chat.webp";
  static String icAttachment = "${_pIcons}ic_attachment.webp";
  static String icVoiceRecording = "${_pIcons}ic_voice_recording.webp";
  static String icSend = "${_pIcons}ic_send.webp";
  static String icCalender = "${_pIcons}ic_calender.webp";
  static String icDrivingDetails = "${_pIcons}ic_driving_details.webp";
  static String icFillDollar = "${_pIcons}ic_fill_dollar.webp";
  static String icGovernment = "${_pIcons}ic_government_id.webp";
  static String icTickMark = "${_pIcons}ic_tick_mark.webp";
  static String icUpload = "${_pIcons}ic_upload.webp";
  static String icDocument = "${_pIcons}ic_document.webp";
  static String icMile = "${_pIcons}ic_mile.webp";
  static String icVisa = "${_pIcons}ic_visa.webp";
  static String icApple = "${_pIcons}ic_apple.webp";
  static String icPayPal = "${_pIcons}ic_paypal.webp";
  static String icGooglePay = "${_pIcons}ic_google_pay.webp";
}
