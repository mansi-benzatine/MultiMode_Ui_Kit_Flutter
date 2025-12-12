import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/preference.dart';
import 'package:mivi_screens_app/utils/service_locator.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/mivi_screens_app/";
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
    imgWhiteBg = "${themeImages}img_white_bg.webp";

    icAppIcon = "${themeIcons}ic_app_icon.webp";
    icSearchNotFound = "${themeIcons}ic_search_not_found.webp";
    icWebsite = "${themeIcons}ic_website.webp";
    icCustomer = "${themeIcons}ic_customer.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnboarding1 = "${_pImages}img_onboarding1.webp";
  static String imgOnboarding2 = "${_pImages}img_onboarding2.webp";
  static String imgOnboarding3 = "${_pImages}img_onboarding3.webp";
  static String imgOnboarding4 = "${_pImages}img_onboarding4.webp";
  static String imgBgHOmeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  static String imgGetStart1 = "${_pImages}img_get_start1.webp";
  static String imgGetStart2 = "${_pImages}img_get_start2.webp";
  static String imgGetStart3 = "${_pImages}img_get_start3.webp";
  static String imgGetStart4 = "${_pImages}img_get_start4.webp";
  static String imgGetStart5 = "${_pImages}img_get_start5.webp";
  static String imgGetStart6 = "${_pImages}img_get_start6.webp";
  static String imgGetStart7 = "${_pImages}img_get_start7.webp";
  static String imgGetStart8 = "${_pImages}img_get_start8.webp";
  static String imgGetStart9 = "${_pImages}img_get_start9.webp";
  static String imgGetStart10 = "${_pImages}img_get_start10.webp";
  static String imgGetStart11 = "${_pImages}img_get_start11.webp";
  static String imgGetStart12 = "${_pImages}img_get_start12.webp";

  static String imgChooseImage1 = "${_pImages}img_choose_image1.webp";
  static String imgChooseImage2 = "${_pImages}img_choose_image2.webp";
  static String imgChooseImage3 = "${_pImages}img_choose_image3.webp";
  static String imgChooseImage4 = "${_pImages}img_choose_image4.webp";
  static String imgChooseImage5 = "${_pImages}img_choose_image5.webp";
  static String imgChooseImage6 = "${_pImages}img_choose_image6.webp";
  static String imgChooseImage7 = "${_pImages}img_choose_image7.webp";

  static String imgMusic1 = "${_pImages}img_music1.webp";
  static String imgMusic2 = "${_pImages}img_music2.webp";
  static String imgMusic3 = "${_pImages}img_music3.webp";
  static String imgMusic4 = "${_pImages}img_music4.webp";

  static String imgRecentProject1 = "${_pImages}img_recent_project1.webp";
  static String imgRecentProject2 = "${_pImages}img_recent_project2.webp";
  static String imgRecentProject3 = "${_pImages}img_recent_project3.webp";
  static String imgRecentProject4 = "${_pImages}img_recent_project4.webp";

  static String imgWhiteBg = "${themeImages}img_white_bg.webp";
  static String imgDummy = "${_pImages}img_dummy.webp";

  /// Icons ===================================================================
  static String icRightDoubleArrow = "${_pIcons}ic_right_double_arrow.webp";
  static String icAppIcon = "${themeIcons}ic_app_icon.webp";
  static String icResetSuccessfully = "${_pIcons}ic_reset_successfully.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icCamera = "${_pIcons}ic_camera.webp";
  static String icUpload = "${_pIcons}ic_upload.webp";
  static String icBack = "${_pIcons}ic_back.webp";
  static String icList = "${_pIcons}ic_list.webp";
  static String icGrid = "${_pIcons}ic_grid.webp";
  static String icAdd = "${_pIcons}ic_add.webp";
  static String icBg = "${_pIcons}ic_bg.webp";
  static String icCanvas = "${_pIcons}ic_canvas.webp";
  static String icFilter = "${_pIcons}ic_filter.webp";
  static String icText = "${_pIcons}ic_text.webp";
  static String icMusic = "${_pIcons}ic_music.webp";
  static String icUndo = "${_pIcons}ic_undo.webp";
  static String icPlay = "${_pIcons}ic_play.webp";
  static String icSpeed = "${_pIcons}ic_speed.webp";
  static String icVolume = "${_pIcons}ic_volume.webp";
  static String icTrim = "${_pIcons}ic_trim.webp";
  static String icSplit = "${_pIcons}ic_split.webp";
  static String icAdjust = "${_pIcons}ic_adjust.webp";
  static String icTransition = "${_pIcons}ic_transition.webp";
  static String icCrop = "${_pIcons}ic_crop.webp";
  static String icDuplicate = "${_pIcons}ic_duplicate.webp";
  static String icFullview = "${_pIcons}ic_fullview.webp";
  static String icSticker = "${_pIcons}ic_sticker.webp";
  static String icRedo = "${_pIcons}ic_redo.webp";
  static String icMyDay = "${_pIcons}ic_my_day.webp";
  static String icITune = "${_pIcons}ic_itune.webp";
  static String icImport = "${_pIcons}ic_import.webp";
  static String icFavorite = "${_pIcons}ic_favorite.webp";
  static String icTextHeight = "${_pIcons}ic_text_height.webp";
  static String icTextSpace = "${_pIcons}ic_text_space.webp";
  static String icTextLineHeight = "${_pIcons}ic_text_line_height.webp";
  static String icVerticalCompress = "${_pIcons}ic_vertical_compress.webp";
  static String icRightRotate = "${_pIcons}ic_right_rotate.webp";
  static String icLeftRotate = "${_pIcons}ic_left_rotate.webp";
  static String icHorizontalCompress = "${_pIcons}ic_horizontal_compress.webp";
  static String icCustomer = "${themeIcons}ic_customer.webp";
  static String icMiviPro = "${_pIcons}ic_mivi_pro.webp";
  static String icRoundLogout = "${_pIcons}ic_round_logout.webp";
  static String icAboutMivi = "${_pIcons}ic_about_mivi.webp";
  static String icWebsite = "${themeIcons}ic_website.webp";
  static String icLanguage = "${_pIcons}ic_language.webp";
  static String icTelegram = "${_pIcons}ic_telegram.webp";
  static String icDark = "${_pIcons}ic_dark.webp";
  static String icCheckMark = "${_pIcons}ic_check_mark.webp";
  static String icLogout = "${_pIcons}ic_logout.webp";
  static String icSecurity = "${_pIcons}ic_security.webp";
  static String icUser = "${_pIcons}ic_user.webp";
  static String icSearchNotFound = "${themeIcons}ic_search_not_found.webp";
  static String icBlueNavigator = "${_pIcons}ic_blue_navigator.webp";

  static String icApple = "${_pIcons}ic_apple.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icYoutube = "${_pIcons}ic_youtube.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icTwitter = "${_pIcons}ic_twitter.webp";
  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";

  static String icUnSelectedHome = "${_pIcons}ic_unselected_home.webp";
  static String icUnSelectedTemplates = "${_pIcons}ic_unselected_templates.webp";
  static String icUnselectedSetting = "${_pIcons}ic_unselected_setting.webp";
  static String icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static String icSelectedTemplates = "${_pIcons}ic_selected_templates.webp";
  static String icSelectedSetting = "${_pIcons}ic_selected_setting.webp";
}
