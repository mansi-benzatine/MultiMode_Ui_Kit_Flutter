import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/car_shop_screens_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";
  static const _p3dModels = "${_path}assets/car_3d_model/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(ThemeData themeData) {
    themeIcons = themeData.brightness == Brightness.light ? _pIcons : _pDarkIcons;
    themeImages = themeData.brightness == Brightness.light ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    /// IMAGES
    imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
    imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
    imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
    imgTopLogin = "${themeImages}img_top_login.webp";
    imgTopSignUp = "${themeImages}img_top_sign_up.webp";
    imgForgotPassword = "${themeImages}img_forgot_password.webp";
    imgResetPassword = "${themeImages}img_verify_otp.webp";
    imgVerifyOtp = "${themeImages}img_reset_password.webp";

    /// ICONS
    icBack = "${themeIcons}ic_back.webp";
    icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
    imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
  static String imgTopLogin = "${themeImages}img_top_login.webp";
  static String imgTopSignUp = "${themeImages}img_top_sign_up.webp";
  static String imgForgotPassword = "${themeImages}img_forgot_password.webp";
  static String imgResetPassword = "${themeImages}img_verify_otp.webp";
  static String imgVerifyOtp = "${themeImages}img_reset_password.webp";

  static const imgDummyQr = "${_pImages}img_dummy_qr.webp";
  static const imgWelcome = "${_pImages}img_welcom_bg.webp";
  static const imgDummyGirl = "${_pImages}img_dummy_girl.webp";
  static const imgUsedCar = "${_pImages}img_used_car.webp";
  static const imgNewCar = "${_pImages}img_new_car.webp";
  static const imgSellCar = "${_pImages}img_sell_car.webp";
  static const imgTesla = "${_pImages}img_tesla.webp";
  static const imgTesla2 = "${_pImages}img_tesla_2.webp";
  static const imgTeslaFull = "${_pImages}img_tesla_full.webp";

  static const imgMercedes = "${_pImages}img_mercedes.webp";
  static const imgMercedes2 = "${_pImages}img_mercedes2.webp";

  static const imgMostSearch1 = "${_pImages}img_most_search_1.webp";
  static const imgMostSearch2 = "${_pImages}img_most_search_2.webp";
  static const imgMostSearch3 = "${_pImages}img_most_search_3.webp";

  static const imgToyota = "${_pImages}img_toyota.webp";
  static const imgToyota2 = "${_pImages}img_toyota_2.webp";

  static const imgCarExterior1 = "${_pImages}car_exterior_1.webp";
  static const imgCarExterior2 = "${_pImages}car_exterior_2.webp";
  static const imgCarExterior3 = "${_pImages}car_exterior_3.webp";
  static const imgCarExterior4 = "${_pImages}car_exterior_4.webp";

  static const imgCarInterior1 = "${_pImages}car_interior_1.webp";
  static const imgCarInterior2 = "${_pImages}car_interior_2.webp";
  static const imgCarInterior3 = "${_pImages}car_interior_3.webp";
  static const imgCarInterior4 = "${_pImages}car_interior_4.webp";

  static const imgSellCarTop = "${_pImages}img_sell_car_top.webp";
  static const imgSellCarInst1 = "${_pImages}ic_sell_car_inst_1.webp";
  static const imgSellCarInst2 = "${_pImages}ic_sell_car_inst_2.webp";
  static const imgSellCarInst3 = "${_pImages}ic_sell_car_inst_3.webp";
  static const imgSellCarInst4 = "${_pImages}ic_sell_car_inst_4.webp";

  static const imgNews1 = "${_pImages}img_news_1.webp";
  static const imgNews2 = "${_pImages}img_news_2.webp";
  static const imgNewsFull = "${_pImages}img_news_full.webp";

  static String imgTrustedBySellers = "${themeImages}img_trusted_by_sellers.webp";
  static String imgRotationBar = "${_pImages}img_rotation_bar.webp";

  static String imgAnim1 = "${_pImages}img_anim1.webp";
  static String imgAnim2 = "${_pImages}img_anim2.webp";
  static String imgAnim3 = "${_pImages}img_anim3.webp";
  static String imgAnim4 = "${_pImages}img_anim4.webp";
  static String imgAnim5 = "${_pImages}img_anim5.webp";
  static String imgAnim6 = "${_pImages}img_anim6.webp";
  static String imgAnim7 = "${_pImages}img_anim7.webp";

  static String imgBgHomeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  /// ICONS ====================================================================
  static String icBack = "${themeIcons}ic_back.webp";
  static const icApple = "${_pIcons}ic_apple.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";

  static const icEye = "${_pIcons}ic_eye.webp";
  static const icEyeClose = "${_pIcons}ic_eye_close.webp";
  static String icAudi = "${themeIcons}ic_audi.webp";
  static const icBmw = "${_pIcons}ic_bmw.webp";
  static const icFerrari = "${_pIcons}ic_ferrari.webp";
  static const icJaguar = "${_pIcons}ic_jaguar.webp";
  static const icLamborghini = "${_pIcons}ic_lamborghini.webp";
  static const icMercedes = "${_pIcons}ic_mercedes.webp";
  static const icTesla = "${_pIcons}ic_tesla.webp";
  static const icToyota = "${_pIcons}ic_toyota.webp";
  static const icLandRover = "${_pIcons}ic_land_rover.webp";
  static const icLexus = "${_pIcons}ic_lexus.webp";

  static const icProfileEdit = "${_pIcons}ic_profile_edit.webp";

  static const icTabFavourite = "${_pIcons}ic_tab_favourite.webp";
  static const icTabFavouriteSelected = "${_pIcons}ic_tab_favourite_selected.webp";
  static const icTabHome = "${_pIcons}ic_tab_home.webp";
  static const icTabHomeSelected = "${_pIcons}ic_tab_home_selected.webp";
  static const icTabNews = "${_pIcons}ic_tab_news.webp";
  static const icTabNewsSelected = "${_pIcons}ic_tab_news_selected.webp";
  static const icTabProfile = "${_pIcons}ic_tab_profile.webp";
  static const icTabProfileSelected = "${_pIcons}ic_tab_profile_selected.webp";

  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icSearch = "${_pIcons}ic_search.webp";
  static const icClose = "${_pIcons}ic_close.webp";

  static const icCongrats = "${_pIcons}ic_congrats.webp";
  static const icKnow = "${_pIcons}ic_know.webp";
  static const icOffer = "${_pIcons}ic_offer.webp";
  static const icWarning = "${_pIcons}ic_warning.webp";
  static const icSpeed = "${_pIcons}ic_speed.webp";
  static const icSeat = "${_pIcons}ic_seat.webp";
  static const icEngine = "${_pIcons}ic_engine.webp";
  static const icCarDesign = "${_pIcons}ic_car_design.webp";
  static const icCarDesign2 = "${_pIcons}ic_car_design2.webp";
  static const icCarDesign3 = "${_pIcons}ic_car_design3.webp";

  static const icVs = "${_pIcons}ic_vs.webp";
  static const icRateEmoji0 = "${_pIcons}rate_emoji_0.png";
  static const icRateEmoji1 = "${_pIcons}rate_emoji_1.png";
  static const icRateEmoji2 = "${_pIcons}rate_emoji_2.png";
  static const icRateEmoji3 = "${_pIcons}rate_emoji_3.png";
  static const icRateEmoji4 = "${_pIcons}rate_emoji_4.png";
  static const icRateEmoji5 = "${_pIcons}rate_emoji_5.png";
  static const icSuccess = "${_pIcons}ic_success.webp";

  static const icSort = "${_pIcons}ic_sort.webp";
  static const icFilter = "${_pIcons}ic_filter.webp";

  static const icSellCarInst1 = "${_pIcons}ic_sell_car_inst_1.webp";
  static const icSellCarInst2 = "${_pIcons}ic_sell_car_inst_2.webp";
  static const icSellCarInst3 = "${_pIcons}ic_sell_car_inst_3.webp";
  static const icSellCarInst4 = "${_pIcons}ic_sell_car_inst_4.webp";

  static const icHelpProfile = "${_pIcons}ic_help_profile.webp";
  static const icLangProfile = "${_pIcons}ic_lang_profile.webp";
  static const icLogout = "${_pIcons}ic_logout.webp";
  static const icMyVehicleProfile = "${_pIcons}ic_my_vehicle_profile.webp";
  static const icNotificationProfile = "${_pIcons}ic_notification_profile.webp";
  static const icPrivacyProfile = "${_pIcons}ic_privacy_profile.webp";
  static const icProfile = "${_pIcons}ic_profile.webp";
  static const icProfileFill = "${_pIcons}ic_profile_fill.webp";
  static const icDarkModeProfile = "${_pIcons}ic_dark_mode_profile.webp";

  static const icCustomerService = "${_pIcons}ic_customer_service.webp";
  static const icFb = "${_pIcons}ic_fb.webp";
  static const icInstagram = "${_pIcons}ic_instagram.webp";
  static const icTwitter = "${_pIcons}ic_twitter.webp";
  static const icWebsite = "${_pIcons}ic_website.webp";
  static const icWp = "${_pIcons}ic_wp.webp";

  static const icSendMsg = "${_pIcons}ic_send_msg.webp";
  static const icMic = "${_pIcons}ic_mic.webp";
  static const icFavourite = "${_pIcons}ic_favourite.webp";
  static const icFilledFavourite = "${_pIcons}ic_filled_favorite.webp";

  static const icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";
  static String icNoDataFoundHistory = "${themeIcons}ic_no_data_found_history.webp";
  static String icNoDataFoundFavorite = "${themeIcons}ic_no_data_found_favorite.webp";

  static const teslaModelSPriorDesign = "${_p3dModels}tesla_model_s_prior_design.glb";
}
