import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/grokit_screens_app/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";
  static const _pJson = "${_path}assets/json/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(ThemeData themeData) {
    themeIcons = themeData.brightness == Brightness.light ? _pIcons : _pDarkIcons;
    themeImages = themeData.brightness == Brightness.light ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
    imgLocation = "${themeImages}img_location.webp";
    imgResetPassword = "${themeImages}img_reset_password.webp";
    imgForgotPassword = "${themeImages}img_forgot_password.webp";
    imgResetPasswordSuccess = "${themeImages}img_reset_password_success.webp";
    icApple1 = "${themeIcons}ic_apple1.webp";
    icCustomer = "${themeIcons}ic_customer.webp";
    icAmazonPay = "${themeIcons}ic_amazon_pay.webp";
    icDeliveryBoy = "${themeIcons}ic_delivery_boy.webp";
  }

  /// IMAGES ===================================================================

  static const imgOnboarding1 = "${_pImages}img_onboarding1.webp";
  static const imgOnboarding2 = "${_pImages}img_onboarding2.webp";
  static const imgOnboarding3 = "${_pImages}img_onboarding3.webp";

  static const imgTopbar = "${_pImages}img_topbar.webp";
  static const imgBgHOmeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static const imgSplash = "${_pImages}img_splash.webp";

  static const imgWhatsapp = "${_pImages}img_whatsapp.webp";
  static const imgFacebook = "${_pImages}img_facebook.webp";
  static const imgInstagram = "${_pImages}img_instagram.webp";
  static const imgTelegram = "${_pImages}img_telegram.webp";
  static const imgTwitter = "${_pImages}img_twitter.webp";
  static const imgDummyProfile = "${_pImages}img_dummy_profile.webp";
  static const imgEmptySearch = "${_pImages}img_empty_search.webp";

  static String imgLocation = "${themeImages}img_location.webp";
  static String imgResetPassword = "${themeImages}img_reset_password.webp";
  static String imgForgotPassword = "${themeImages}img_forgot_password.webp";
  static String imgResetPasswordSuccess = "${themeImages}img_reset_password_success.webp";

  static const imgBeautyCosmetic = "${_pImages}img_beauty_cosmetic.webp";
  static const imgBeautyEyeBeauty = "${_pImages}img_beauty_eye_beauty.webp";
  static const imgBeautyNails = "${_pImages}img_beauty_nails.webp";
  static const imgBeautyLipstick = "${_pImages}img_beauty_lipstick.webp";
  static const imgBeautyGlowKits = "${_pImages}img_beauty_glow_kits.webp";
  static const imgBeautyFreshFace = "${_pImages}img_beauty_fresh_face.webp";

  static const imgSnack1 = "${_pImages}img_snack1.webp";
  static const imgSnack = "${_pImages}img_snack.webp";

  static const imgKitchen = "${_pImages}img_kitchen.webp";
  static const imgKitchen1 = "${_pImages}img_kitchen1.webp";

  static const imgJuice = "${_pImages}img_juice.webp";
  static const imgJuice1 = "${_pImages}img_juice1.webp";

  static const imgVeggie = "${_pImages}img_veggie.webp";
  static const imgVeggie1 = "${_pImages}img_veggie1.webp";
  static const imgVeggie2 = "${_pImages}img_veggie2.webp";
  static const imgVeggie3 = "${_pImages}img_veggie3.webp";
  static const imgVeggie4 = "${_pImages}img_veggie4.webp";
  static const imgVeggie5 = "${_pImages}img_veggie5.webp";

  static const imgDairy = "${_pImages}img_dairy.webp";
  static const imgDairy1 = "${_pImages}img_dairy1.webp";

  static const imgRecentVeggie = "${_pImages}img_recent_veggie.webp";
  static const imgRecentOil = "${_pImages}img_recent_oil.webp";
  static const imgRecentSnack = "${_pImages}img_recent_snack.webp";
  static const imgRecentBakery = "${_pImages}img_recent_bakery.webp";
  static const imgRecentDairy = "${_pImages}img_recent_dairy.webp";
  static const imgRecentFlours = "${_pImages}img_recent_flours.webp";

  static const imgMap = "${_pImages}img_map.webp";
  static const imgDiscountCard = "${_pImages}img_discount_card.webp";

  static const imgBanner = "${_pImages}img_banner.webp";
  static const imgBanner1 = "${_pImages}img_banner1.webp";
  static const imgBanner2 = "${_pImages}img_banner2.webp";

  static const imgCategoryAll = "${_pImages}img_category_all.webp";
  static const imgCategoryCutsSprouts = "${_pImages}img_category_cuts_sprouts.webp";
  static const imgCategoryExotics = "${_pImages}img_category_exotics.webp";
  static const imgCategoryFruits = "${_pImages}img_category_fruits.webp";
  static const imgCategorySeasonal = "${_pImages}img_category_seasonal.webp";
  static const imgCategoryVegetable = "${_pImages}img_category_vegetable.webp";

  static const imgDeliveryMap = "${_pImages}img_delivery_map.webp";
  static const imgEmptyCart = "${_pImages}img_empty_cart.webp";
  static const imgDeliveryBoy = "${_pImages}img_delivery_boy.webp";

  /// ICONS ====================================================================
  static const icApple = "${_pIcons}ic_apple.webp";
  static String icApple1 = "${themeIcons}ic_apple1.webp";
  static const icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static const icCloseEye = "${_pIcons}ic_close_eye.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icOpenEye = "${_pIcons}ic_open_eye.webp";
  static const icPassword = "${_pIcons}ic_password.webp";
  static const icUser = "${_pIcons}ic_user.webp";
  static const icFillUser = "${_pIcons}ic_fill_user.webp";
  static const icSimpleGoogle = "${_pIcons}ic_simple_google.webp";
  static const icCall = "${_pIcons}ic_call.webp";
  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icSearch = "${_pIcons}ic_search.webp";
  static const icFilter = "${_pIcons}ic_filter.webp";
  static const icCheck = "${_pIcons}ic_check.webp";
  static const icWallet = "${_pIcons}ic_wallet.webp";
  static const icPercent = "${_pIcons}ic_percent.webp";
  static const icShare = "${_pIcons}ic_share.webp";
  static const icTrash = "${_pIcons}ic_trash.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";
  static const icGps = "${_pIcons}ic_gps.webp";
  static const icLocation = "${_pIcons}ic_location.webp";
  static const icMicroPhone = "${_pIcons}ic_microphone.webp";
  static const icBack = "${_pIcons}ic_back.webp";
  static const icPrimaryArrow = "${_pIcons}ic_primary_arrow.webp";
  static const icDiscount = "${_pIcons}ic_discount.webp";
  static const icBoxEdit = "${_pIcons}ic_box_edit.webp";
  static String icDeliveryBoy = "${themeIcons}ic_delivery_boy.webp";
  static const icEndCall = "${_pIcons}ic_end_call.webp";
  static const icMute = "${_pIcons}ic_mute.webp";
  static const icSpeaker = "${_pIcons}ic_speaker.webp";
  static const icMoon = "${_pIcons}ic_moon.webp";
  static const icCalender = "${_pIcons}ic_calendar.webp";
  static const icHeart = "${_pIcons}ic_heart.webp";
  static const icInfoCircle = "${_pIcons}ic_info_circle.webp";
  static const icLanguage = "${_pIcons}ic_language_square.webp";
  static const icLogout = "${_pIcons}ic_logout.webp";
  static const icMessageQuestion = "${_pIcons}ic_message_question.webp";
  static const icShieldSecurity = "${_pIcons}ic_shield_security.webp";
  static const icShoppingCart = "${_pIcons}ic_shopping_cart.webp";
  static const icTag = "${_pIcons}ic_tag.webp";
  static String icCustomer = "${themeIcons}ic_customer.webp";
  static String icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";

  static const icUnselectedHome = "${_pIcons}ic_unselected_home.webp";
  static const icUnselectedCategory = "${_pIcons}ic_unselected_category.webp";
  static const icUnselectedBag = "${_pIcons}ic_unselected_bag.webp";
  static const icUnselectedUser = "${_pIcons}ic_unselected_user.webp";
  static const icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static const icSelectedCategory = "${_pIcons}ic_selected_category.webp";
  static const icSelectedBag = "${_pIcons}ic_selected_bag.webp";
  static const icSelectedUser = "${_pIcons}ic_selected_user.webp";

  static const icTabAll = "${_pIcons}ic_tab_all.webp";
  static const icTabVeggie = "${_pIcons}ic_tab_veggie.webp";
  static const icTabFruits = "${_pIcons}ic_tab_fruits.webp";
  static const icTabDairy = "${_pIcons}ic_tab_dairy.webp";
  static const icTabBaby = "${_pIcons}ic_tab_baby.webp";
  static const icTabSnack = "${_pIcons}ic_tab_snack.webp";

  static String icAmazonPay = "${themeIcons}ic_amazon_pay.webp";
  static const icMasterCard = "${_pIcons}ic_master_card.webp";
  static const icPayPal = "${_pIcons}ic_paypal.webp";
  static const icVisa = "${_pIcons}ic_visa.webp";

  static const jsAddToCart = "${_pJson}js_add_to_cart.json";
  static const jsCrackers = "${_pJson}js_crackers.json";
}
