import 'package:cinemix_screens_app/utils/preference.dart';
import 'package:cinemix_screens_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/cinemix_screens_app/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? _pIcons : _pDarkIcons;
    themeImages = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? _pImages : _pDarkImages;

    icApple = "${themeIcons}ic_apple.webp";
    icCustomer = "${themeIcons}ic_customer.webp";
    icGlobal = "${themeIcons}ic_global.webp";
    icWallet = "${themeIcons}ic_wallet.webp";
    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
  }

  /// IMAGES ===================================================================
  static String imgOnboarding1 = "${_pImages}img_onboarding1.webp";
  static String imgOnboarding2 = "${_pImages}img_onboarding2.webp";
  static String imgOnboarding3 = "${_pImages}img_onboarding3.webp";
  static String imgBgHOmeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  static String imgGetStarted1 = "${_pImages}img_get_started1.webp";
  static String imgGetStarted2 = "${_pImages}img_get_started2.webp";
  static String imgGetStarted3 = "${_pImages}img_get_started3.webp";
  static String imgGetStarted4 = "${_pImages}img_get_started4.webp";
  static String imgGetStarted5 = "${_pImages}img_get_started5.webp";
  static String imgGetStarted6 = "${_pImages}img_get_started6.webp";
  static String imgGetStarted7 = "${_pImages}img_get_started7.webp";
  static String imgGetStarted8 = "${_pImages}img_get_started8.webp";
  static String imgGetStarted9 = "${_pImages}img_get_started9.webp";

  static String imgInterest1 = "${_pImages}img_interest1.webp";
  static String imgInterest2 = "${_pImages}img_interest2.webp";
  static String imgInterest3 = "${_pImages}img_interest3.webp";
  static String imgInterest4 = "${_pImages}img_interest4.webp";
  static String imgInterest5 = "${_pImages}img_interest5.webp";
  static String imgInterest6 = "${_pImages}img_interest6.webp";
  static String imgInterest7 = "${_pImages}img_interest7.webp";
  static String imgInterest8 = "${_pImages}img_interest8.webp";

  static String imgDummyImage = "${_pImages}img_dummy_image.webp";
  static String imgChris = "${_pImages}img_chris.webp";
  static String imgDummySport = "${_pImages}img_dummy_sport.webp";
  static String imgLanguageDummy = "${_pImages}img_language_dummy.webp";
  static String imgSearchNotFound = "${_pImages}img_search_not_found.webp";
  static String imgPremium = "${_pImages}img_premium.webp";
  static String imgEmpty = "${_pImages}img_empty.webp";

  /// Icons ===================================================================
  static String icEye = "${_pIcons}ic_eye.webp";
  static String icEyeSlash = "${_pIcons}ic_eye_slash.webp";
  static String icKey = "${_pIcons}ic_key.webp";
  static String icMail = "${_pIcons}ic_mail.webp";
  static String icProfile = "${_pIcons}ic_profile.webp";
  static String icResetPassword = "${_pIcons}ic_reset_password.webp";
  static String icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icTelecast = "${_pIcons}ic_telecast.webp";
  static String icAppLogo = "${_pIcons}ic_app_logo.webp";
  static String icFingerprint = "${_pIcons}ic_fingerprint.webp";
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icGender = "${_pIcons}ic_gender.webp";
  static String icCall = "${_pIcons}ic_call.webp";
  static String icProfileTick = "${_pIcons}ic_profile_tick.webp";
  static String icEmoji = "${_pIcons}ic_emoji.webp";
  static String icHome = "${_pIcons}ic_home.webp";
  static String icDownload = "${_pIcons}ic_download.webp";
  static String icShare = "${_pIcons}ic_share.webp";
  static String icRating = "${_pIcons}ic_rating.webp";
  static String icGauge = "${_pIcons}ic_gauge.webp";
  static String icSkipBack = "${_pIcons}ic_skip_back.webp";
  static String icSkipForward = "${_pIcons}ic_skip_forward.webp";
  static String icNext = "${_pIcons}ic_next.webp";
  static String icEpisode = "${_pIcons}ic_episode.webp";
  static String icLock = "${_pIcons}ic_lock.webp";
  static String icMsg = "${_pIcons}ic_msg.webp";
  static String icTrash = "${_pIcons}ic_trash.webp";
  static String icWallet = "${themeIcons}ic_wallet.webp";
  static String icPaypal = "${_pIcons}ic_paypal.webp";
  static String icMoon = "${_pIcons}ic_moon.webp";
  static String icLogout = "${_pIcons}ic_logout.webp";
  static String icLanguage = "${_pIcons}ic_language.webp";
  static String icPremium = "${_pIcons}ic_premium.webp";
  static String icAddList = "${_pIcons}ic_add_list.webp";
  static String icCustomer = "${themeIcons}ic_customer.webp";
  static String icCrown = "${_pIcons}ic_crown.webp";
  static String icGlobal = "${themeIcons}ic_global.webp";
  static String icHelpCenter = "${_pIcons}ic_help_center.webp";
  static String icNotification = "${_pIcons}ic_notification.webp";
  static String icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";

  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static String icTwitter = "${_pIcons}ic_twitter.webp";
  static String icX = "${_pIcons}ic_x.webp";
  static String icTelegram = "${_pIcons}ic_telegram.webp";
  static String icTiktok = "${_pIcons}ic_tik_tok.webp";
  static String icTwitch = "${_pIcons}ic_twitch.webp";
  static String icMasterCard = "${_pIcons}ic_master_card.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icApple = "${themeIcons}ic_apple.webp";
}
