import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/food_delivery_screens_app_package/";
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

    imgAppNameLogo = "${themeImages}img_app_name_logo.webp";
    imgEmptySearch = "${themeImages}img_empty_search.webp";
    imgLogoAmazonPay = "${themeImages}img_logo_amazon_pay.webp";

    icApple = "${themeIcons}ic_apple.webp";
    icBack = "${themeIcons}ic_back.webp";
    icHeart = "${themeIcons}ic_heart.webp";
    icLogoFasai = "${themeIcons}ic_logo_fasai.webp";
    icSetDeliveryLocation = "${themeIcons}ic_set_delivery_location.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_onboarding1.webp";
  static String imgOnBoarding2 = "${_pImages}img_onboarding2.webp";
  static String imgOnBoarding3 = "${_pImages}img_onboarding3.webp";

  static String imgAppNameLogo = "${themeImages}img_app_name_logo.webp";
  static String imgLogo = "${_pImages}img_logo.webp";

  static String imgCheckEmail = "${_pImages}img_check_email.webp";
  static String imgSetAddressLocation = "${_pImages}img_set_location.webp";
  static String imgUserProfile = "${_pImages}img_user_profile.webp";
  static String imgHomeBanner1 = "${_pImages}img_home_banner1.webp";
  static String imgHomeBanner2 = "${_pImages}img_home_banner2.webp";
  static String imgHomeBanner3 = "${_pImages}img_home_banner3.webp";
  static String imgOfferBanner = "${_pImages}img_offer_banner.webp";

  static String imgLogoBurger = "${_pImages}img_logo_burger.webp";
  static String imgLogoFrenchFries = "${_pImages}img_logo_french_fries.webp";
  static String imgLogoPizza = "${_pImages}img_logo_pizza.webp";
  static String imgLogoChinese = "${_pImages}img_logo_chinese.webp";

  static String imgLogoPizzaHut = "${_pImages}img_pizza_hut_logo.webp";
  static String imgLogoBurgerKing = "${_pImages}img_burger_king_logo.webp";
  static String imgLogoCafeCoffeeDayKing = "${_pImages}img_cafe_coffee_day_logo.webp";
  static String imgLogoKfc = "${_pImages}img_kfc_logo.webp";
  static String imgLogoMacDonald = "${_pImages}img_mac_donald_logo.webp";
  static String imgLogoStarbucks = "${_pImages}img_logo_starbucks.webp";
  static String imgLogoSushi = "${_pImages}img_logo_sushi.webp";
  static String imgLogoIceCream = "${_pImages}img_logo_ice_cream.webp";
  static String imgLogoMeat = "${_pImages}img_logo_meat.webp";
  static String imgLogoPancake = "${_pImages}img_logo_pancake.webp";
  static String imgLogoSandwich = "${_pImages}img_logo_sandwich.webp";

  static String imgLogoAmazonPay = "${themeImages}img_logo_amazon_pay.webp";
  static String imgLogoBank = "${_pImages}img_logo_bank.webp";
  static String imgLogoBank1 = "${_pImages}img_logo_bank1.webp";
  static String imgLogoFreeCharege = "${_pImages}img_logo_freecharege.webp";
  static String imgLogoMasterCard = "${_pImages}img_logo_master_card.webp";
  static String imgLogoPaytm = "${_pImages}img_logo_paytm.webp";
  static String imgLogoPhonePay = "${_pImages}img_logo_phone_pay.webp";
  static String imgLogoVisa = "${_pImages}img_logo_visa.webp";

  static String imgEmptySearch = "${themeImages}img_empty_search.webp";
  static String imgBgConfirmOrder = "${_pImages}img_bg_confirm_order.webp";
  static String imgEmptyCart = "${_pImages}img_empty_cart.webp";

  static String imgChickenSpeghetti = "${_pImages}img_chicken_spaghetii.webp";
  static String imgComboBurger = "${_pImages}img_combo_burger.webp";
  static String imgSmallMap = "${_pImages}img_small_map.webp";
  static String imgMap = "${_pImages}img_map.webp";
  static String imgSplash = "${_pImages}img_splash.webp";
  static String imgBgHomeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";

  /// ICONS ====================================================================
  static String icBack = "${themeIcons}ic_back.webp";
  static String icClose = "${_pIcons}ic_close.webp";
  static String icCurrentLocation = "${_pIcons}ic_current_location.webp";
  static String icDiscountOrange = "${_pIcons}ic_discount_orange.webp";
  static String icDownOrangeArrow = "${_pIcons}ic_down_orange_arrow.webp";
  static String icEmail = "${_pIcons}ic_email.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icApple = "${themeIcons}ic_apple.webp";
  static String icHeart = "${themeIcons}ic_heart.webp";
  static String icInfo = "${_pIcons}ic_info.webp";
  static String icSetDeliveryLocation = "${themeIcons}ic_set_delivery_location.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icHome = "${_pIcons}ic_home.webp";
  static String icCart = "${_pIcons}ic_cart.webp";
  static String icAccount = "${_pIcons}ic_account.webp";
  static String icRightOrangeArrow = "${_pIcons}ic_right_orange_arrow.webp";
  static String icStarYellow = "${_pIcons}ic_star_yellow.webp";
  static String icDiscount = "${_pIcons}ic_discount_orange.webp";
  static String icStarBlack = "${_pIcons}ic_star_black.webp";
  static String icLeaf = "${_pIcons}ic_leaf.webp";
  static String icVeg = "${_pIcons}ic_veg.webp";
  static String icLogoFasai = "${themeIcons}ic_logo_fasai.webp";
  static String icDocument = "${_pIcons}ic_document.webp";
  static String icMoney = "${_pIcons}ic_money.webp";
  static String icLocationBlack = "${_pIcons}ic_location_black.webp";
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icFavorite = "${_pIcons}ic_favorite.webp";
  static String icLogout = "${_pIcons}ic_logout.webp";
  static String icManageAddress = "${_pIcons}ic_manage_address.webp";
  static String icSell = "${_pIcons}ic_sell.webp";
  static String icSetting = "${_pIcons}ic_setting.webp";
  static String icMicrophone = "${_pIcons}ic_microphone.webp";
  static String icPickImage = "${_pIcons}ic_pick_image.webp";
  static String icEmoji = "${_pIcons}ic_emoji.webp";
  static String icRate = "${_pIcons}ic_rate.webp";
  static String icFilledRate = "${_pIcons}ic_filled_rate.webp";
  static String icRestaurant = "${_pIcons}ic_restaurant.webp";
  static String icDarkMode = "${_pIcons}ic_dark_mode.webp";
  static String icScreens = "${_pIcons}ic_screens.webp";
}
