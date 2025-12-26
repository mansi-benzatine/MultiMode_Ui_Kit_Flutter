import 'package:bitx_app/utils/preference.dart';
import 'package:bitx_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/bitx_app/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? _pIcons : _pDarkIcons;
    themeImages = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    /// IMAGES
    imgSignUpBackground = "${themeImages}img_bg_sign_up.webp";
    imgBgOnBoarding = "${themeImages}img_bg_onboarding.webp";
    imgCommonBackground = "${themeImages}img_common_bg.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${_pImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${_pImages}img_on_boarding_3.webp";
  static String imgBgOnBoarding = "${themeImages}img_bg_onboarding.webp";
  static String imgCommonBackground = "${themeImages}img_common_bg.webp";
  static String imgSignUpBackground = "${themeImages}img_bg_sign_up.webp";
  static String imgBgProfileSetup = "${_pImages}img_bg_profile_setup.webp";

  static String imgTopLogin = "${themeImages}img_top_login.webp";
  static String imgTopSignUp = "${themeImages}img_top_sign_up.webp";
  static String imgForgotPassword = "${themeImages}img_forgot_password.webp";
  static String imgResetPassword = "${themeImages}img_verify_otp.webp";
  static String imgVerifyOtp = "${themeImages}img_reset_password.webp";

  static const imgDummyQr = "${_pImages}img_dummy_qr.webp";
  static const imgWelcome = "${_pImages}img_welcom_bg.webp";
  static const imgDummyGirl = "${_pImages}img_dummy_girl.webp";

  static String imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";
  static const imgCongratulation = "${_pImages}img_congratulation.webp";
  static const imgDummyVisaCard = "${_pImages}img_dummy_visa_card.webp";

  static const imgSearchEmpty = "${_pImages}img_search_empty.webp";
  static const imgNotificationEmpty = "${_pImages}img_notification_empty.webp";
  static const imgMarketEmpty = "${_pImages}img_empty_market.webp";

  static const imgFacebook = "${_pImages}img_facebook.webp";
  static const imgInstagram = "${_pImages}img_instagram.webp";
  static const imgTelegram = "${_pImages}img_telegram.webp";
  static const imgTwitter = "${_pImages}img_twitter.webp";
  static const imgWhatsapp = "${_pImages}img_whatsapp.webp";

  /// ICONS ====================================================================
  static String icBack = "${_pIcons}ic_back.webp";
  static const icApple = "${_pIcons}ic_apple.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static const icPhone = "${_pIcons}ic_call_outline.webp";

  static const icPasswordKey = "${_pIcons}ic_password_key.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icEye = "${_pIcons}ic_eye.webp";
  static const icEyeClose = "${_pIcons}ic_eye_slash.webp";
  static const icCheck = "${_pIcons}ic_check.webp";

  static const icMale = "${_pIcons}ic_male.webp";
  static const icFemale = "${_pIcons}ic_female.webp";
  static const icSmallLocation = "${_pIcons}ic_small_location.webp";
  static const icSmallCalendar = "${_pIcons}ic_small_calendar.webp";
  static const icSmallCall = "${_pIcons}ic_small_call.webp";

  static const icGallery = "${_pIcons}ic_gallery.webp";
  static const icFlashSlash = "${_pIcons}ic_flash_slash.webp";
  static const icFlash = "${_pIcons}ic_flash.webp";

  static const icCamera = "${_pIcons}ic_camera.webp";

  static const icBottomHome = "${_pIcons}ic_bottom_home.webp";
  static const icBottomHomeSelected = "${_pIcons}ic_bottom_home_selected.webp";
  static const icBottomWallet = "${_pIcons}ic_bottom_wallet.webp";
  static const icBottomWalletSelected = "${_pIcons}ic_bottom_wallet_selected.webp";
  static const icBottomMarket = "${_pIcons}ic_bottom_market.webp";
  static const icBottomMarketSelected = "${_pIcons}ic_bottom_market_selected.webp";
  static const icBottomProfile = "${_pIcons}ic_bottom_profile.webp";
  static const icBottomProfileSelected = "${_pIcons}ic_bottom_profile_selected.webp";
  static const icBottomSwap = "${_pIcons}ic_bottom_swap.webp";

  static const icNotificationSecurity = "${_pIcons}ic_notification_security.webp";
  static const icNotificationWallet = "${_pIcons}ic_notification_wallet.webp";
  static const icNotificationPassword = "${_pIcons}ic_notification_password.webp";
  static const icNotificationCreditCard = "${_pIcons}ic_notification_credit_card.webp";
  static const icNotificationNewUpdate = "${_pIcons}ic_notification_new_update.webp";
  static const icNotificationProfile = "${_pIcons}ic_notification_profile.webp";

  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icSearch = "${_pIcons}ic_search.webp";

  static const icLogout = "${_pIcons}ic_logout.webp";

  static const icTheme = "${_pIcons}ic_theme.webp";
  static const icPayment = "${_pIcons}ic_payment.webp";
  static const icLanguage = "${_pIcons}ic_language.webp";
  static const icFaq = "${_pIcons}ic_faq.webp";
  static const icEditProfile = "${_pIcons}ic_edit_profile.webp";
  static const icDeleteAccount = "${_pIcons}ic_delete_account.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";

  static const icWallet = "${_pIcons}ic_wallet.webp";
  static const icVisa = "${_pIcons}ic_visa.webp";
  static const icSecuritySafe = "${_pIcons}ic_security_safe.webp";
  static const icPayPal = "${_pIcons}ic_paypal.webp";

  static const icProfileEdit = "${_pIcons}ic_profile_edit.webp";

  static const icEarning = "${_pIcons}ic_earning.webp";
  static const icHorizontalMore = "${_pIcons}ic_horizontal_more.webp";
  static const icFillCandle = "${_pIcons}ic_fill_candle.webp";
  static const icFillFilter = "${_pIcons}ic_fill_filter.webp";
  static const icTwitter = "${_pIcons}ic_twitter.webp";
  static const icCustomerService = "${_pIcons}ic_customer_service.webp";
  static const icWebsite = "${_pIcons}ic_website.webp";
  static const icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static const icInstagram = "${_pIcons}ic_instagram.webp";
  static const icTelegram = "${_pIcons}ic_telegram.webp";
  static const icAppLogo = "${_pIcons}ic_app_logo.webp";
  static const icRealTimeTrading = "${_pIcons}ic_real_time_trading.webp";
  static const icSecureStorage = "${_pIcons}ic_secure_storage.webp";
  static const icInstantSwap = "${_pIcons}ic_instant_swap.webp";
  static const icArrowUp = "${_pIcons}ic_arrow_up.webp";
  static const icArrowDown = "${_pIcons}ic_arrow_down.webp";

  static const icDeposit = "${_pIcons}ic_deposit.webp";
  static const icTransfer = "${_pIcons}ic_transfer.webp";
  static const icExchange = "${_pIcons}ic_exchange.webp";
  static const icWithdraw = "${_pIcons}ic_withdraw.webp";
  static const icEquity = "${_pIcons}ic_equity.webp";
  static const icAvailable = "${_pIcons}ic_available.webp";
  static const icInOrder = "${_pIcons}ic_in_order.webp";
  static const icDollar = "${_pIcons}ic_dollar.webp";

  static const icBtZec = "${_pIcons}ic_bt_zec.webp";
  static const icBtUsdt = "${_pIcons}ic_bt_usdt.webp";
  static const icBtMash = "${_pIcons}ic_bt_mash.webp";
  static const icBtItc = "${_pIcons}ic_bt_ltc.webp";
  static const icBtEth = "${_pIcons}ic_bt_eth.webp";
  static const icBtDash = "${_pIcons}ic_bt_dash.webp";
  static const icBtBtc = "${_pIcons}ic_bt_btc.webp";
  static const icBtBnb = "${_pIcons}ic_bt_bnb.png";
}
