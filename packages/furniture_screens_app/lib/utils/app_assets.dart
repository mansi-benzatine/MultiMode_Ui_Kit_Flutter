import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/furniture_screens_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";
  static const _pAnimation = "${_path}assets/animation/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(ThemeData themeData) {
    themeIcons = themeData.brightness == Brightness.light ? _pIcons : _pDarkIcons;
    themeImages = themeData.brightness == Brightness.light ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
  }

  /// IMAGES ===================================================================
  static const imgOnboarding1 = "${_pImages}img_onboarding1.webp";
  static const imgOnboarding2 = "${_pImages}img_onboarding2.webp";
  static const imgOnboarding3 = "${_pImages}img_onboarding3.webp";
  static const imgGetStart = "${_pImages}img_get_start.webp";
  static const imgBg = "${_pImages}img_bg.webp";
  static const imgDummySofa = "${_pImages}img_dummy_sofa.webp";
  static const imgDummyChair = "${_pImages}img_dummy_chair.webp";
  static const imgDummyPot = "${_pImages}img_dummy_pot.webp";
  static const imgDummyLamp = "${_pImages}img_dummy_lamp.webp";
  static const imgAppLogo = "${_pImages}img_app_logo.webp";
  static const imgHomeBanner = "${_pImages}img_home_banner.webp";
  static const imgSearchEmpty = "${_pImages}img_search_empty.webp";
  static const imgNotificationEmpty = "${_pImages}img_notification_empty.webp";
  static const imgEmptyCategoryDetails = "${_pImages}img_empty_category_details.webp";
  static const imgDummySofa1 = "${_pImages}img_dummy_sofa1.webp";
  static const imgDummyProfile = "${_pImages}img_dummy_profile.webp";
  static const imgWhatsapp = "${_pImages}img_whatsapp.webp";
  static const imgFacebook = "${_pImages}img_facebook.webp";
  static const imgInstagram = "${_pImages}img_instagram.webp";
  static const imgTelegram = "${_pImages}img_telegram.webp";
  static const imgTwitter = "${_pImages}img_twitter.webp";
  static const imgLiveTracking = "${_pImages}img_live_tracking.webp";
  static const imgEmptyOrder = "${_pImages}img_empty_order.webp";
  static const imgEmptyCart = "${_pImages}img_empty_cart.webp";
  static const imgCardView = "${_pImages}img_card_view.webp";
  static String imgBgHOmeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  /// ICONS ====================================================================
  static const icApple = "${_pIcons}ic_apple.webp";
  static const icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static const icCloseEye = "${_pIcons}ic_close_eye.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icOpenEye = "${_pIcons}ic_open_eye.webp";
  static const icPassword = "${_pIcons}ic_password.webp";
  static const icUser = "${_pIcons}ic_user.webp";
  static const icFillUser = "${_pIcons}ic_fill_user.webp";
  static const icStar = "${_pIcons}ic_star.webp";
  static const icSelectedCart = "${_pIcons}ic_selected_cart.webp";
  static const icUnselectedCart = "${_pIcons}ic_unselected_cart.webp";
  static const icMyOrder = "${_pIcons}ic_my_order.webp";
  static const icSelectedMyOrder = "${_pIcons}ic_selected_my_order.webp";
  static const icSelectedOrder = "${_pIcons}ic_selected_order.webp";
  static const icUnselectedOrder = "${_pIcons}ic_unselected_order.webp";
  static const icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static const icUnselectedHome = "${_pIcons}ic_unselected_home.webp";
  static const icUnselectedProfile = "${_pIcons}ic_unselected_profile.webp";
  static const icSelectedProfile = "${_pIcons}ic_selected_profile.webp";

  static const icDummyChair = "${_pIcons}ic_dummy_chair.webp";
  static const icDummyLamp = "${_pIcons}ic_dummy_lamp.webp";
  static const icDummyOfficeChair = "${_pIcons}ic_dummy_office_chair.webp";
  static const icDummySofa = "${_pIcons}ic_dummy_sofa.webp";
  static const icDummyCupboard = "${_pIcons}ic_dummy_cupboard.webp";
  static const icDummyBookcases = "${_pIcons}ic_dummy_bookcases.webp";
  static const icDummyDiningTable = "${_pIcons}ic_dummy_dinning_table.webp";
  static const icDummySwing = "${_pIcons}ic_dummy_swing.webp";
  static const icDummyVase = "${_pIcons}ic_dummy_vase.webp";
  static const icDummyDrawer = "${_pIcons}ic_dummy_drawer.webp";
  static const icDummyMirror = "${_pIcons}ic_dummy_mirror.webp";
  static const icDummyStool = "${_pIcons}ic_dummy_stool.webp";

  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icSearch = "${_pIcons}ic_search.webp";
  static const icFilter = "${_pIcons}ic_filter.webp";
  static const icCheck = "${_pIcons}ic_check.webp";
  static const icWallet = "${_pIcons}ic_wallet.webp";
  static const icPercent = "${_pIcons}ic_percent.webp";
  static const icShoppingCart = "${_pIcons}ic_shopping_cart.webp";
  static const icShare = "${_pIcons}ic_share.webp";
  static const icTrash = "${_pIcons}ic_trash.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";
  static const icBuilding = "${_pIcons}ic_buliding.webp";
  static const icHome = "${_pIcons}ic_home.webp";
  static const icOffice = "${_pIcons}ic_office.webp";
  static const icDocument = "${_pIcons}ic_document.webp";
  static const icTruck = "${_pIcons}ic_truck.webp";
  static const icBox = "${_pIcons}ic_box.webp";
  static const icGps = "${_pIcons}ic_gps.webp";
  static const icBoxTick = "${_pIcons}ic_box_tick.webp";
  static const icTick = "${_pIcons}ic_tick.webp";

  static const icLocation = "${_pIcons}ic_location.webp";
  static const icMoon = "${_pIcons}ic_moon.webp";
  static const icLanguages = "${_pIcons}ic_languages.webp";
  static const icHelpCenter = "${_pIcons}ic_help_center.webp";
  static const icLogout = "${_pIcons}ic_logout.webp";
  static const icUserEdit = "${_pIcons}ic_user_edit.webp";
  static const icPaymentMethod = "${_pIcons}ic_payment_method.webp";
  static const icDiscount = "${_pIcons}ic_discount.webp";
  static const icPrivacyPolicy = "${_pIcons}ic_privacy_policy.webp";
  static const icCall = "${_pIcons}ic_call.webp";
  static const icArrow = "${_pIcons}ic_arrow.webp";
  static const icApple1 = "${_pIcons}ic_apple1.webp";
  static const icPaypal = "${_pIcons}ic_paypal.webp";
  static const icCustomerService = "${_pIcons}ic_customer_service.webp";
  static String icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";

  static const animArrow = "${_pAnimation}anim_arrow.json";
}
