import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/mantra_yoga_screens_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";
  static const _pVideos = "${_path}assets/videos/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = (Theme.of(context).brightness == Brightness.light) ? _pIcons : _pDarkIcons;
    themeImages = (Theme.of(context).brightness == Brightness.light) ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    /// IMAGES
    // imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
    imgMan = "${themeImages}img_man.webp";
    imgWoman = "${themeImages}img_woman.webp";

    /// ICONS
    icBack = "${themeIcons}ic_back.webp";
    icApple = "${themeIcons}ic_apple.webp";
    icFacebook = "${themeIcons}ic_facebook.webp";
    icGoogle = "${themeIcons}ic_google.webp";
    icPause = "${themeIcons}ic_pause.webp";
    icPlay = "${themeIcons}ic_play.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${_pImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${_pImages}img_on_boarding_3.webp";
  static String imgLogoOutline = "${_pImages}img_logo_outline.webp";
  static String imgWelcome = "${_pImages}img_welcome.webp";
  static String imgCongratulation = "${_pImages}img_congratulation.webp";
  static String imgBeginners = "${_pImages}img_beginners.webp";
  static String imgBetterSleep = "${_pImages}img_better_sleep.webp";
  static String imgBodyBuilding = "${_pImages}img_body_building.webp";
  static String imgCongSetupProfile = "${_pImages}img_cong_setup_profile.webp";
  static String imgControlBloodPresure = "${_pImages}img_control_blood_presure.webp";
  static String imgExpert = "${_pImages}img_expert.webp";
  static String imgImproveHealth = "${_pImages}img_improve_health.webp";
  static String imgIntemediate = "${_pImages}img_intemediate.webp";
  static String imgMan = "${themeImages}img_man.webp";
  static String imgPostureCorrection = "${_pImages}img_posture_correction.webp";
  static String imgRelieveStress = "${_pImages}img_relieve_stress.webp";
  static String imgWeightLoss = "${_pImages}img_weight_loss.webp";
  static String imgWoman = "${_pImages}img_woman.webp";
  static String imgYogaDummy1 = "${_pImages}img_yoga_dummy_1.webp";
  static String imgDummyAnimation1 = "${_pImages}img_dummy_animation_1.webp";
  static String imgEmoji1 = "${_pImages}img_emoji_1.webp";
  static String imgEmoji2 = "${_pImages}img_emoji_2.webp";
  static String imgEmoji3 = "${_pImages}img_emoji_3.webp";
  static String imgEmoji4 = "${_pImages}img_emoji_4.webp";
  static String imgEmoji5 = "${_pImages}img_emoji_5.webp";
  static String imgEmoji6 = "${_pImages}img_emoji_6.webp";
  static String imgEmoji7 = "${_pImages}img_emoji_7.webp";
  static String imgEmoji8 = "${_pImages}img_emoji_8.webp";
  static String imgMeditationDummy1 = "${_pImages}img_meditation_dummy_1.webp";
  static String imgBgSubscriptionCard = "${_pImages}img_bg_subscription_card.webp";
  static String imgBgCardVisa = "${_pImages}img_bg_card_visa.webp";
  static String imgSubscriptionDone = "${_pImages}img_subscription_done.webp";
  static String imgLogout = "${_pImages}img_logout.webp";
  static String imgBgHomeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  /// ICONS ====================================================================

  static String icBack = "${themeIcons}ic_back.webp";
  static String icApple = "${themeIcons}ic_apple.webp";
  static String icFacebook = "${themeIcons}ic_facebook.webp";
  static String icGoogle = "${themeIcons}ic_google.webp";
  static String icUsername = "${_pIcons}ic_username.webp";
  static String icPassword = "${_pIcons}ic_password.webp";
  static String icPassEnable = "${_pIcons}ic_pass_enable.webp";
  static String icPassDisable = "${_pIcons}ic_pass_disable.webp";
  static String icEmail = "${_pIcons}ic_email.webp";
  static String icArrowDown = "${_pIcons}ic_arrow_down.webp";
  static String icCalender = "${_pIcons}ic_calender.webp";
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icLocation = "${_pIcons}ic_location.webp";
  static String icCall = "${_pIcons}ic_call.webp";
  static String icRadioSelected = "${_pIcons}ic_radio_selected.webp";
  static String icRadioUnSelected = "${_pIcons}ic_radio_un_selected.webp";
  static String icPolygonUp = "${_pIcons}ic_polygon_up.webp";
  static String icBottomAnalysis = "${_pIcons}ic_bottom_analysis.webp";
  static String icBottomDiscover = "${_pIcons}ic_bottom_discover.webp";
  static String icBottomHome = "${_pIcons}ic_bottom_home.webp";
  static String icBottomProfile = "${_pIcons}ic_bottom_profile.webp";
  static String icFloatingHistorySelected = "${_pIcons}ic_floting_history_selected.webp";
  static String icFloatingHistory = "${_pIcons}ic_floting_history.webp";
  static String icNotification = "${_pIcons}ic_notification.webp";
  static String icArchive = "${_pIcons}ic_archive.webp";
  static String icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static String icBottomProfileSelected = "${_pIcons}ic_bottom_profile_selected.webp";
  static String icBottomAnalysisSelected = "${_pIcons}ic_bottom_analysis_selected.webp";
  static String icBottomDiscoverSelected = "${_pIcons}ic_bottom_discover_selected.webp";
  static String icBottomHomeSelected = "${_pIcons}ic_bottom_home_selected.webp";
  static String icFilterSearch = "${_pIcons}ic_filter_search.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icClock = "${_pIcons}ic_clock.webp";
  static String icKcalBurned = "${_pIcons}ic_kcal_burne.webp";
  static String icMeditation = "${_pIcons}ic_meditation.webp";
  static String icMeditationRound = "${_pIcons}ic_meditation_round.webp";
  static String icKcalBurnedRound = "${_pIcons}ic_kcal_burne_round.webp";
  static String icClockRound = "${_pIcons}ic_clock_round.webp";
  static String icShare = "${_pIcons}ic_share.webp";
  static String icEye = "${_pIcons}ic_eye.webp";
  static String icVolume = "${_pIcons}ic_volume.webp";
  static String icBackward = "${_pIcons}ic_backward.webp";
  static String icMaximize = "${_pIcons}ic_maximize.webp";
  static String icMinimize = "${_pIcons}ic_minimize.webp";
  static String icPause = "${themeIcons}ic_pause.webp";
  static String icPlay = "${themeIcons}ic_play.webp";
  static String icNext = "${_pIcons}ic_next.webp";
  static String icPrevious = "${_pIcons}ic_previous.webp";
  static String icCompleted = "${_pIcons}ic_completed.webp";
  static String icPaymentWallet = "${_pIcons}ic_payment_wallet.webp";
  static String icPaymentApple = "${_pIcons}ic_payment_apple.webp";
  static String icPaymentGoogle = "${_pIcons}ic_payment_google.webp";
  static String icPaymentPaypal = "${_pIcons}ic_payment_paypal.webp";
  static String icPaymentVisa = "${_pIcons}ic_payment_visa.webp";
  static String icEditOutline = "${_pIcons}ic_edit_outline.webp";
  static String icRoundDone = "${_pIcons}ic_round_done.webp";
  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static String icCustomerService = "${_pIcons}ic_customer_service.webp";
  static String icFacebookHelpCenter = "${_pIcons}ic_facebook_help_center.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icTelegram = "${_pIcons}ic_telegram.webp";
  static String icWebsite = "${_pIcons}ic_website.webp";
  static String icTwitter = "${_pIcons}ic_twitter.webp";
  static String icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";

  /// VIDEOS ===================================================================
  static String videoYoga = "${_pVideos}video_yoga.mp4";
  static String videoMeditation = "${_pVideos}video_meditation.mp4";
}
