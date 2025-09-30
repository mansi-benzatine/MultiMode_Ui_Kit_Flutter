import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/utils/preference.dart';
import 'package:stoxy_screens_app_package/utils/service_locator.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/stoxy_screens_app_package/";
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
    imgCommonBackgroundPlain = "${themeImages}img_common_bg_plain.webp";
    imgGetStarted = "${themeImages}img_get_started.webp";
    imgDummyCard = "${themeImages}img_dummy_card.webp";

    /// ICONS
    icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
    imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${_pImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${_pImages}img_on_boarding_3.webp";
  static String imgBgOnBoarding = "${themeImages}img_bg_onboarding.webp";
  static String imgCommonBackground = "${themeImages}img_common_bg.webp";
  static String imgSignUpBackground = "${themeImages}img_bg_sign_up.webp";
  static String imgCommonBackgroundPlain = "${themeImages}img_common_bg_plain.webp";

  static String imgGetStarted = "${themeImages}img_get_started.webp";

  static String imgTopLogin = "${themeImages}img_top_login.webp";
  static String imgTopSignUp = "${themeImages}img_top_sign_up.webp";
  static String imgForgotPassword = "${themeImages}img_forgot_password.webp";
  static String imgResetPassword = "${themeImages}img_verify_otp.webp";
  static String imgVerifyOtp = "${themeImages}img_reset_password.webp";

  static const imgDummyQr = "${_pImages}img_dummy_qr.webp";
  static const imgWelcome = "${_pImages}img_welcom_bg.webp";
  static const imgDummyGirl = "${_pImages}img_dummy_girl.webp";
  static String imgDummyCard = "${themeImages}img_dummy_card.webp";

  static String imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";

  static const imgSearchEmpty = "${_pImages}img_search_empty.webp";
  static const imgNotificationEmpty = "${_pImages}img_notification_empty.webp";
  static const imgNew1 = "${_pImages}img_news1.webp";
  static const imgNew2 = "${_pImages}img_news2.webp";
  static String imgBgHOmeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  /// ICONS ====================================================================
  static String icBack = "${_pIcons}ic_back.webp";
  static const icApple = "${_pIcons}ic_apple.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static const icCall = "${_pIcons}ic_call.webp";
  static const icPhone = "${_pIcons}ic_call_outline.webp";

  static const icPasswordKey = "${_pIcons}ic_password_key.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icEye = "${_pIcons}ic_eye.webp";
  static const icEyeClose = "${_pIcons}ic_eye_slash.webp";
  static const icUserName = "${_pIcons}ic_profile.webp";
  static const icCheck = "${_pIcons}ic_check.webp";
  static const icMusic = "${_pIcons}ic_music.webp";
  static const icProfile = "${_pIcons}ic_profile.webp";

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
  static const icBottomNews = "${_pIcons}ic_bottom_news.webp";
  static const icBottomNewsSelected = "${_pIcons}ic_bottom_news_selected.webp";
  static const icBottomPortfolio = "${_pIcons}ic_bottom_portfolio.webp";
  static const icBottomPortfolioSelected = "${_pIcons}ic_bottom_portfolio_selected.webp";
  static const icBottomProfile = "${_pIcons}ic_bottom_profile.webp";
  static const icBottomProfileSelected = "${_pIcons}ic_bottom_profile_selected.png.webp";
  static const icBottomSwap = "${_pIcons}ic_bottom_swap.webp";

  static const icHomeTop = "${_pIcons}ic_home_top.webp";

  static const icNotificationInfo = "${_pIcons}ic_notification_info.webp";
  static const icNotificationSecurityAlert = "${_pIcons}ic_notification_security_alert.webp";
  static const icNotificationUser = "${_pIcons}ic_notification_user.webp";
  static const icNotificationWallet = "${_pIcons}ic_notification_wallet.webp";

  static const icStockAdobe = "${_pIcons}ic_stock_adobe.webp";
  static const icStockAmazon = "${_pIcons}ic_stock_amazone.webp";
  static const icStockDisney = "${_pIcons}ic_stock_disney.webp";
  static const icStockMacdonald = "${_pIcons}ic_stock_macdonald.webp";
  static const icStockMedium = "${_pIcons}ic_stock_medium.webp";
  static const icStockMeta = "${_pIcons}ic_stock_meta.webp";
  static const icStockMicrosoft = "${_pIcons}ic_stock_microsoft.webp";
  static const icStockNetflix = "${_pIcons}ic_stock_netflix.webp";
  static const icStockPayPal = "${_pIcons}ic_stock_paypal.webp";
  static const icStockPintrest = "${_pIcons}ic_stock_pintrest.webp";
  static const icStockSpotify = "${_pIcons}ic_stock_spotify.webp";
  static const icStockTwitter = "${_pIcons}ic_stock_twitter.webp";
  static const icStockYoutube = "${_pIcons}ic_stock_youtube.webp";

  static const icShuffle = "${_pIcons}ic_shuffle.webp";
  static const icMore = "${_pIcons}ic_more.webp";
  static const icDownloadMusic = "${_pIcons}ic_download_music.webp";
  static const icAddPlus = "${_pIcons}ic_add_plus.webp";
  static const icRepeatMusic = "${_pIcons}ic_repeate_music.webp";

  static const icGoAdsFree = "${_pIcons}ic_go_ads_free.webp";
  static const icShare = "${_pIcons}ic_share.webp";
  static const icPremium = "${_pIcons}ic_premium.webp";
  static const icWaveSmall = "${_pIcons}ic_wave_small.webp";

  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icSearch = "${_pIcons}ic_search.webp";
  static const icClose = "${_pIcons}ic_close.webp";

  static const icLogout = "${_pIcons}ic_logout.webp";
  static const icFavourite = "${_pIcons}ic_favourite.webp";
  static const icPremiumProfile = "${_pIcons}ic_premium_profile.webp";
  static const icTheme = "${_pIcons}ic_theme.webp";
  static const icPrivacy = "${_pIcons}ic_privacy.webp";
  static const icPayment = "${_pIcons}ic_payment.webp";
  static const icLanguage = "${_pIcons}ic_language.webp";
  static const icFaq = "${_pIcons}ic_faq.webp";
  static const icEditProfile = "${_pIcons}ic_edit_profile.webp";
  static const icDeleteAccount = "${_pIcons}ic_delete_account.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";

  static const icWallet = "${_pIcons}ic_wallet.webp";
  static const icVisa = "${_pIcons}ic_visa.webp";
  static const icVibrate = "${_pIcons}ic_vibrate.webp";
  static const icSound = "${_pIcons}ic_sound.webp";
  static const icSecuritySafe = "${_pIcons}ic_security_safe.webp";
  static const icPlaylist = "${_pIcons}ic_playlist.webp";
  static const icPayPal = "${_pIcons}ic_paypal.webp";
  static const icNewFeatures = "${_pIcons}ic_new_features.webp";

  static String icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
  static String icNoDataFoundFavorite = "${themeIcons}ic_no_data_found_favorite.webp";

  static const icGetStarted = "${_pIcons}ic_get_started.webp";
  static const icProfileEdit = "${_pIcons}ic_profile_edit.webp";
  static const icMarketCap = "${_pIcons}ic_market_cap.webp";
  static const icLow = '${_pIcons}ic_low.webp';
  static const icHigh = "${_pIcons}ic_high.webp";
  static const icEarning = "${_pIcons}ic_earning.webp";
  static const icDottedChart = "${_pIcons}ic_dotted_chart.webp";
  static const icCandleChart = "${_pIcons}ic_candle_chart.webp";
  static const icHorizontalMore = "${_pIcons}ic_horizontal_more.webp";
  static const icFillCandle = "${_pIcons}ic_fill_candle.webp";
  static const icFillFilter = "${_pIcons}ic_fill_filter.webp";
  static const icTwitter = "${_pIcons}ic_twitter.webp";
  static const icCustomerService = "${_pIcons}ic_customer_service.webp";
  static const icWebsite = "${_pIcons}ic_website.webp";
  static const icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static const icInstagram = "${_pIcons}ic_instagram.webp";
  static const icTelegram = "${_pIcons}ic_telegram.webp";
  static String icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";
}
