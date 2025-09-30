import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/preference.dart';
import 'package:musify_app_package/utils/service_locator.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/musify_app_package/";
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
    imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
    imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
    imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
    imgCommonBackground = "${themeImages}img_common_bg.webp";
    imgCommonBackgroundPlain = "${themeImages}img_common_bg_plain.webp";
    imgGetStarted = "${themeImages}img_get_started.webp";
    imgDummyCard = "${themeImages}img_dummy_card.webp";

    /// ICONS
    icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
    imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
  static String imgCommonBackground = "${themeImages}img_common_bg.webp";
  static String imgCommonBackgroundPlain = "${themeImages}img_common_bg_plain.webp";

  static String imgGetStarted = "${themeImages}img_get_started.webp";

  static String imgTopLogin = "${themeImages}img_top_login.webp";
  static String imgTopSignUp = "${themeImages}img_top_sign_up.webp";
  static String imgForgotPassword = "${themeImages}img_forgot_password.webp";
  static String imgResetPassword = "${themeImages}img_verify_otp.webp";
  static String imgVerifyOtp = "${themeImages}img_reset_password.webp";

  static String imgDuaLipa = "${_pImages}img_dua_lipa.webp";
  static String imgEDSheeran = "${_pImages}img_e_d_sheeran.webp";
  static String imgJustinBieber = "${_pImages}img_justin_bieber.webp";
  static String imgRihanna = "${_pImages}img_rihanna.webp";
  static String imgSelenaGomez = "${_pImages}img_selena_gomez.webp";
  static String imgTaylorSwift = "${_pImages}img_taylor_swift.webp";

  static String imgMusic1 = "${_pImages}img_music_1.webp";
  static String imgMusic2 = "${_pImages}img_music_2.webp";
  static String imgMusic3 = "${_pImages}img_music_3.webp";

  static String imgPodcast1 = "${_pImages}img_podcast_1.webp";
  static String imgPodcast2 = "${_pImages}img_podcast_2.webp";
  static String imgPodcast3 = "${_pImages}img_podcast_3.webp";
  static String imgPodcast4 = "${_pImages}img_podcast_4.webp";
  static String imgPodcast5 = "${_pImages}img_podcast_5.webp";

  static String imgPodcastCat1 = "${_pImages}img_podcas_cat_1.webp";
  static String imgPodcastCat2 = "${_pImages}img_podcas_cat_2.webp";
  static String imgPodcastCat3 = "${_pImages}img_podcas_cat_3.webp";
  static String imgPodcastCat4 = "${_pImages}img_podcas_cat_4.webp";

  static const imgDummyQr = "${_pImages}img_dummy_qr.webp";
  static const imgWelcome = "${_pImages}img_welcom_bg.webp";
  static const imgDummyGirl = "${_pImages}img_dummy_girl.webp";
  static String imgDummyCard = "${themeImages}img_dummy_card.webp";

  static String imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";

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
  static const icCheckBorder = "${_pIcons}ic_check_border.webp";
  static const icMusic = "${_pIcons}ic_music.webp";
  static const icPlay = "${_pIcons}ic_play.webp";

  static const icFavouriteBottomBar = "${_pIcons}ic_favourite_bottombar.webp";
  static const icFavouriteBottomBarSelected = "${_pIcons}ic_favourite_bottombar_selected.webp";
  static const icHomeBottomBar = "${_pIcons}ic_home_bottombar.webp";
  static const icHomeBottomBarSelected = "${_pIcons}ic_home_bottombar_selected.webp";
  static const icMyMusicBottomBarSelected = "${_pIcons}ic_my_music_bottombar_selected.webp";
  static const icMyMusicBottomBar = "${_pIcons}ic_my_music_bottombar.webp";
  static const icProfileBottomBar = "${_pIcons}ic_profile_bottombar.webp";
  static const icProfileBottomBarSelected = "${_pIcons}ic_profile_bottombar_selected.webp";

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
}
