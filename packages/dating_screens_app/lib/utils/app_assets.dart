import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/dating_screens_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(ThemeData themeData) {
    themeIcons = themeData.brightness == Brightness.light ? _pIcons : _pDarkIcons;
    themeImages = themeData.brightness == Brightness.light ? _pImages : _pDarkImages;

    icApple = "${themeIcons}ic_apple.webp";
    icUser = "${themeIcons}ic_user.webp";
    icWebsite = "${themeIcons}ic_website.webp";

    imgBgProfile = "${themeImages}img_bg_profile.webp";
    imgEmptySearch = "${themeImages}img_empty_search.webp";
    imgLefBg = "${themeImages}img_bg_left.webp";
    imgRightBg = "${themeImages}img_bg_right.webp";
    imgCommunity = "${themeImages}img_community.webp";
    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
  }

  /// Icons ===================================================================
  static String icLogoMeetMe = "${_pIcons}ic_logo_meet_me.webp";
  static String icCheck = "${_pIcons}ic_check.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icApple = "${themeIcons}ic_apple.webp";
  static String icLock = "${_pIcons}ic_lock.webp";
  static String icLogo = "${_pIcons}ic_logo.webp";
  static String icMail = "${_pIcons}ic_mail.webp";
  static String icMan = "${_pIcons}ic_man.webp";
  static String icWomen = "${_pIcons}ic_women.webp";
  static String icBack = "${_pIcons}ic_back.webp";
  static String icEye = "${_pIcons}ic_eye.webp";
  static String icEyeSlash = "${_pIcons}ic_eye_slash.webp";
  static String icSelectedDiscover = "${_pIcons}ic_selected_discover.webp";
  static String icSelectedLikes = "${_pIcons}ic_selected_likes.webp";
  static String icSelectedChat = "${_pIcons}ic_selected_chat.webp";
  static String icSelectedProfile = "${_pIcons}ic_selected_profile.webp";
  static String icUnselectedDiscover = "${_pIcons}ic_unselected_discover.webp";
  static String icUnselectedLikes = "${_pIcons}ic_unselected_likes.webp";
  static String icUnselectedChat = "${_pIcons}ic_unselected_chat.webp";
  static String icUnselectedProfile = "${_pIcons}ic_unselected_profile.webp";
  static String icRefresh = "${_pIcons}ic_refresh.webp";
  static String icShare = "${_pIcons}ic_share.webp";
  static String icClose = "${_pIcons}ic_close.webp";
  static String icLike = "${_pIcons}ic_like.webp";
  static String icLocation = "${_pIcons}ic_location.webp";
  static String icCheckList = "${_pIcons}ic_checklist.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icPinkSearch = "${_pIcons}ic_pink_search.webp";
  static String icPinkClose = "${_pIcons}ic_pink_close.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icSnapchat = "${_pIcons}ic_snapchat.webp";
  static String icTiktok = "${_pIcons}ic_tiktok.webp";
  static String icTelegram = "${_pIcons}ic_telegram.webp";
  static String icPhoneCall = "${_pIcons}ic_phone_call.webp";
  static String icVideoCall = "${_pIcons}ic_video_call.webp";
  static String icEmoji = "${_pIcons}ic_emoji.webp";
  static String icAttachment = "${_pIcons}ic_attachment.webp";
  static String icClear = "${_pIcons}ic_clear.webp";
  static String icReport = "${_pIcons}ic_report.webp";
  static String icTrash = "${_pIcons}ic_trash.webp";
  static String icVolume = "${_pIcons}ic_volume.webp";
  static String icMicrophone = "${_pIcons}ic_microphone.webp";
  static String icPhone = "${_pIcons}ic_phone.webp";
  static String icNavigate = "${_pIcons}ic_navigate.webp";
  static String icSetting = "${_pIcons}ic_setting.webp";
  static String icOutlinedLocation = "${_pIcons}ic_outlined_location.webp";
  static String icDevice = "${_pIcons}ic_device.webp";
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icCoin = "${_pIcons}ic_coin.webp";
  static String icCommunity = "${_pIcons}ic_community.webp";
  static String icBell = "${_pIcons}ic_bell.webp";
  static String icFile = "${_pIcons}ic_file.webp";
  static String icHeadPhone = "${_pIcons}ic_headphone.webp";
  static String icSafety = "${_pIcons}ic_safety.webp";
  static String icUser = "${themeIcons}ic_user.webp";
  static String icAdd = "${_pIcons}ic_add.webp";
  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static String icWebsite = "${themeIcons}ic_website.webp";
  static String icTwitter = "${_pIcons}ic_twitter.webp";
  static String icDelete = "${_pIcons}ic_delete.webp";
  static String icDarkMode = "${_pIcons}ic_dark_mode.webp";
  static String icScreen = "${_pIcons}ic_blue_navigator.webp";

  /// Images ===================================================================
  static String imgSplash = "${_pImages}img_splash.webp";
  static String imgProfile = "${_pImages}img_profile.webp";
  static String imgProfile1 = "${_pImages}img_profile1.webp";
  static String imgBgProfile = "${themeImages}img_bg_profile.webp";
  static String imgEmptySearch = "${themeImages}img_empty_search.webp";
  static String imgCallBg = "${_pImages}img_call_bg.webp";
  static String imgLefBg = "${themeImages}img_bg_left.webp";
  static String imgRightBg = "${themeImages}img_bg_right.webp";
  static String imgCommunity = "${themeImages}img_community.webp";
  static String imgBgHomeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgUnlimitedChatAndVideoChat = "${_pImages}img_unlimited_chat_video_chat.webp";
}
