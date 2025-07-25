import 'package:flutter/material.dart';

import '../ui/app/my_app.dart';

class AppAssets {
  static const _path = "packages/social_smart_social_media_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pVideos = "${_path}assets/videos/";

  static String themeImages = (Theme.of(MyApp.navigatorKey.currentContext!).brightness == Brightness.light) ? _pImages : _pDarkImages;
  static String themeIcons = (Theme.of(MyApp.navigatorKey.currentContext!).brightness == Brightness.light) ? _pIcons : _pDarkIcons;

  static void refreshAssets() {
    final context = MyApp.navigatorKey.currentContext;
    if (context == null) {
      debugPrint("AppAssets.refreshAssets: context is null.");
      return;
    }

    themeImages = (Theme.of(context).brightness == Brightness.light) ? _pImages : _pDarkImages;
    themeIcons = (Theme.of(context).brightness == Brightness.light) ? _pIcons : _pDarkIcons;

    imgOnboarding1 = "${themeImages}img_onboarding1.webp";
    imgOnboarding2 = "${themeImages}img_onboarding2.webp";
    imgOnboarding3 = "${themeImages}img_onboarding3.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnboarding1 = "${themeImages}img_onboarding1.webp";
  static String imgOnboarding2 = "${themeImages}img_onboarding2.webp";
  static String imgOnboarding3 = "${themeImages}img_onboarding3.webp";

  static const imgWelcomeBg = "${_pImages}img_welcome.webp";
  static String imgNewPasswordBg = "${themeImages}img_create_new_password.webp";
  static const imgCongratulationDialogBg = "${_pImages}img_successful.webp";
  static const imgBirthday = "${_pImages}img_birthday.webp";
  static String imgForgotPassword = "${themeImages}img_forgot_password.webp";
  static const imgProfile = "${_pImages}img_profile.webp";
  static const imgHome = "${_pImages}img_home.webp";
  static const imgProfile2 = "${_pImages}img_profile2.webp";
  static const imgProfile3 = "${_pImages}img_profile3.webp";
  static const imgProfile4 = "${_pImages}img_profile4.webp";
  static const imgProfile5 = "${_pImages}img_profile5.webp";
  static const imgProfile7 = "${_pImages}img_profile7.webp";
  static const imgProfile10 = "${_pImages}img_profile10.webp";
  static const imgProfile40 = "${_pImages}img_profile40.webp";
  static const imgProfile69 = "${_pImages}img_profile69.webp";
  static const imgProfile70 = "${_pImages}img_profile70.webp";
  static const imgProfile72 = "${_pImages}img_profile72.webp";
  static const imgProfile83 = "${_pImages}img_profile83.webp";
  static const imgProfile84 = "${_pImages}img_profile84.webp";
  static const imgProfile85 = "${_pImages}img_profile85.webp";
  static const imgProfile86 = "${_pImages}img_profile86.webp";
  static const imgProfile87 = "${_pImages}img_profile87.webp";
  static const imgProfile92 = "${_pImages}img_profile92.webp";
  static const imgCreateContent = "${_pImages}img_create_content.webp";
  static const imgAccountCreateSuccessfully = "${_pImages}img_account_create_successfully.webp";

  static const imgAvatar1 = "${_pImages}img_avatar1.webp";
  static const imgAvatar2 = "${_pImages}img_avatar2.webp";
  static const imgAvatar3 = "${_pImages}img_avatar3.webp";
  static const imgAvatar4 = "${_pImages}img_avatar4.webp";
  static const imgAvatar5 = "${_pImages}img_avatar5.webp";
  static const imgAvatar6 = "${_pImages}img_avatar6.webp";
  static const imgAvatar7 = "${_pImages}img_avatar7.webp";
  static const imgAvatar8 = "${_pImages}img_avatar8.webp";
  static const imgAvatar9 = "${_pImages}img_avatar9.webp";
  static const imgAvatar10 = "${_pImages}img_avatar10.webp";
  static const imgLikes = "${_pImages}img_likes.webp";

  static const imgSound1 = "${_pImages}img_sound1.webp";
  static const imgSound2 = "${_pImages}img_sound2.webp";
  static const imgSound3 = "${_pImages}img_sound3.webp";
  static const imgSound4 = "${_pImages}img_sound4.webp";
  static const imgSound5 = "${_pImages}img_sound5.webp";
  static const imgUpload = "${_pImages}img_upload.webp";

  static const imgEffect1 = "${_pImages}img_effect1.webp";
  static const imgEffect2 = "${_pImages}img_effect2.webp";
  static const imgEffect3 = "${_pImages}img_effect3.webp";
  static const imgEffect4 = "${_pImages}img_effect4.webp";
  static const imgEffect5 = "${_pImages}img_effect5.webp";

  static const imgTrendingSound1 = "${_pImages}img_trending_sound1.webp";
  static const imgTrendingSound2 = "${_pImages}img_trending_sound2.webp";
  static const imgTrendingSound3 = "${_pImages}img_trending_sound3.webp";
  static const imgTrendingSound4 = "${_pImages}img_trending_sound4.webp";
  static const imgTrendingSound5 = "${_pImages}img_trending_sound5.webp";

  static const imgFood2 = "${_pImages}img_food2.webp";
  static const imgFood3 = "${_pImages}img_food3.webp";
  static const imgFood4 = "${_pImages}img_food4.webp";

  static const imgFruits2 = "${_pImages}img_fruits2.webp";
  static const imgFruits3 = "${_pImages}img_fruits3.webp";
  static const imgFruits5 = "${_pImages}img_fruits5.webp";

  static const imgMedia1 = "${_pImages}img_media1.webp";
  static const imgMedia2 = "${_pImages}img_media2.webp";
  static const imgMedia3 = "${_pImages}img_media3.webp";
  static const imgMedia4 = "${_pImages}img_media4.webp";
  static const imgMedia5 = "${_pImages}img_media5.webp";
  static const imgMedia6 = "${_pImages}img_media6.webp";
  static const imgMedia7 = "${_pImages}img_media7.webp";

  static const imgCallBg = "${_pImages}img_call_bg.webp";
  static const imgChatImage = "${_pImages}img_chat_image.webp";
  static const imgChatImage2 = "${_pImages}img_chat_image2.webp";
  static const imgEditContent = "${_pImages}img_edit_content.webp";

  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static String icApple = "${themeIcons}ic_apple.webp";
  static const icLock = "${_pIcons}ic_lock.webp";
  static const icMsg = "${_pIcons}ic_message.webp";
  static const icProfile = "${_pIcons}ic_profile.webp";
  static const icFemale = "${_pIcons}ic_female.webp";
  static const icMale = "${_pIcons}ic_male.webp";
  static const icCalender = "${_pIcons}ic_calender.webp";
  static const icMail = "${_pIcons}ic_mail.webp";
  static const icLocation = "${_pIcons}ic_location.webp";
  static const icProfileEdit = "${_pIcons}ic_profile_edit.webp";
  static const icProfileFilled = "${_pIcons}ic_profile_filled.webp";
  static const icDiscovery = "${_pIcons}ic_discovery.webp";
  static const icFlag = "${_pIcons}ic_flag.webp";
  static const icHome = "${_pIcons}ic_home.webp";
  static const icLive = "${_pIcons}ic_live.webp";
  static const icMusic = "${_pIcons}ic_music.webp";
  static const icSearchFilled = "${_pIcons}ic_search.webp";
  static const icShare = "${_pIcons}ic_share.webp";
  static const icSound = "${_pIcons}ic_sound.webp";
  static const icChat = "${_pIcons}ic_chat.webp";
  static const icCreate = "${_pIcons}ic_create.webp";
  static const icLike = "${_pIcons}ic_like.webp";
  static const icComment = "${_pIcons}ic_chat_filled.webp";
  static const icRepost = "${_pIcons}ic_repost.webp";
  static const icCopyLink = "${_pIcons}ic_copy_link.webp";
  static const icNotInterested = "${_pIcons}ic_not_interest.webp";
  static const icSaveVideo = "${_pIcons}ic_save_video.webp";
  static const icGif = "${_pIcons}ic_gif.webp";
  static const icInstagram = "${_pIcons}ic_instagram.webp";
  static const icTwitter = "${_pIcons}ic_twitter.webp";
  static const icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static const icSearch = "${_pIcons}ic_search_filled.webp";
  static const icSend = "${_pIcons}ic_send.webp";
  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icEmoji = "${_pIcons}ic_emoji.webp";
  static const icCategory = "${_pIcons}ic_category.webp";
  static const icProfileAdd = "${_pIcons}ic_add_user.webp";
  static const icSavePost = "${_pIcons}ic_bookmark.webp";
  static const icPlay = "${_pIcons}ic_play.webp";
  static const icVoice = "${_pIcons}ic_voice.webp";
  static const icVideo = "${_pIcons}ic_video.webp";
  static const icCall = "${_pIcons}ic_call.webp";
  static const icImage = "${_pIcons}ic_image.webp";
  static const icEmojiFilled = "${_pIcons}ic_emoji_filled.webp";
  static const icHashTag = "${_pIcons}ic_hashtag.webp";
  static const icViewer = "${_pIcons}ic_viewer.webp";
  static const icClose = "${_pIcons}ic_close.webp";
  static const icVideoPlay = "${_pIcons}ic_video_play.webp";
  static const icBeauty = "${_pIcons}ic_beauty.webp";
  static const icCameraFlip = "${_pIcons}ic_camera_flip.webp";
  static const icEffect = "${_pIcons}ic_effects.webp";
  static const icFilter = "${_pIcons}ic_filter.webp";
  static const icFlash = "${_pIcons}ic_flash.webp";
  static const icPhoto = "${_pIcons}ic_photo.webp";
  static const icUpload = "${_pIcons}ic_upload.webp";
  static const icTimer = "${_pIcons}ic_timer.webp";
  static const icSpeed = "${_pIcons}ic_speed.webp";
  static const icCreateVideo = "${_pIcons}ic_create_video.webp";
  static const icSaved = "${_pIcons}ic_saved.webp";
  static const icUnsaved = "${_pIcons}ic_unsaved.webp";
  static const icHashTagFilled = "${_pIcons}ic_hashtag_filled.webp";
  static const icMention = "${_pIcons}ic_mention.webp";
  static const icMoreOption = "${_pIcons}ic_more_option.webp";
  static const icPaper = "${_pIcons}ic_paper.webp";
  static const icSent = "${_pIcons}ic_sent.webp";
  static const icSetting = "${_pIcons}ic_setting.webp";
  static const icVideos = "${_pIcons}ic_videos.webp";
  static const icInstagramFilled = "${_pIcons}ic_instagram_filled.webp";
  static const icTwitterFilled = "${_pIcons}ic_twitter_filled.webp";
  static const icWhatAppFilled = "${_pIcons}ic_whatsapp_filled.webp";
  static const icFacebookFilled = "${_pIcons}ic_facebook_filled.webp";
  static const icRose = "${_pIcons}ic_rose.webp";
  static const icStar = "${_pIcons}ic_star.webp";
  static const icGift = "${_pIcons}ic_gift.webp";
  static const icQNA = "${_pIcons}ic_qna.webp";
  static const icExplore = "${_pIcons}ic_explore.webp";
  static const icGroupChat = "${_pIcons}ic_group_chat.webp";
  static const icAddToChat = "${_pIcons}ic_add_to_chat.webp";
  static const icActivity = "${_pIcons}ic_activity.webp";
  static const icHeartFilled = "${_pIcons}ic_heart_filled.webp";
  static const icViewerFilled = "${_pIcons}ic_viewer_filled.webp";
  static const icVolume = "${_pIcons}ic_volume.webp";
  static const icCloseCall = "${_pIcons}ic_close_square.webp";
  static const icCameraClose = "${_pIcons}ic_camera_close.webp";
  static const icAddProfile = "${_pIcons}ic_profile_add.webp";
  static const icRightArrow = "${_pIcons}ic_right_arrow.webp";
  static const icAdd = "${_pIcons}ic_add.webp";
  static const icUsername = "${_pIcons}ic_username.webp";
  static const icBio = "${_pIcons}ic_bio.webp";
  static const icDelete = "${_pIcons}ic_delete.webp";
  static const icDocument = "${_pIcons}ic_document.webp";
  static const icInfo = "${_pIcons}ic_info_square.webp";
  static const icLogout = "${_pIcons}ic_logout.webp";
  static const icMoreCircle = "${_pIcons}ic_more_circle.webp";
  static const icPassword = "${_pIcons}ic_password.webp";
  static const icPrivacyPolicy = "${_pIcons}ic_shield_done.webp";
  static const icTickSquare = "${_pIcons}ic_tick_square.webp";
  static const icShow = "${_pIcons}ic_show.webp";
  static const icArrowDown = "${_pIcons}ic_arrow_down.webp";
  static const icWebsite = "${_pIcons}ic_website.webp";
  static const icInstagramFill = "${_pIcons}ic_instagram_fill.webp";
  static const icCustomerService = "${_pIcons}ic_customer_service.webp";
  static const icActiveChat = "${_pIcons}ic_active_chat.webp";
  static const icActiveProfile = "${_pIcons}ic_active_profile.webp";
  static const icActiveDiscovery = "${_pIcons}ic_active_discovery.webp";
  static const icActiveHome = "${_pIcons}ic_active_home.webp";
  static const icHeart = "${_pIcons}ic_heart.webp";
  static const icPlus = "${_pIcons}ic_plus.webp";
  static const icOk = "${_pIcons}ic_ok.webp";
  static const icSubTitle = "${_pIcons}ic_subtitle.webp";
  static const icFont = "${_pIcons}ic_font.webp";
  static const icFlip = "${_pIcons}ic_flip.webp";
  static const icAddImage = "${_pIcons}ic_add_image.webp";
  static const icRecordVoice = "${_pIcons}ic_record_voice.webp";
  static const icDraft = "${_pIcons}ic_draft.webp";
  static const icFilledLock = "${_pIcons}ic_filled_lock.webp";
  static const icTwoUser = "${_pIcons}ic_two_user.webp";
  static const icFace = "${_pIcons}ic_face.webp";
  static const icHashTagAvatar = "${_pIcons}ic_hashtag_avatar.webp";
  static const icArrow = "${_pIcons}ic_arrow.webp";
  static const icRecordFilled = "${_pIcons}ic_record_filled.webp";
  static const icCamera = "${_pIcons}ic_camera.webp";
  static const icEyeLock = "${_pIcons}ic_eye_lock.webp";
  static const icFacebookColored = "${_pIcons}ic_facebook_color.webp";
  static const icWrong = "${_pIcons}ic_cloase.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";
  static const icTrueMark = "${_pIcons}ic_true_mark.webp";
  static const icLiveTo = "${_pIcons}ic_live_to.webp";
  static const icLikeWhite = "${_pIcons}ic_like_white.webp";

  static const vdReel1 = "${_pVideos}video_reel1.mov";
  static const vdReel2 = "${_pVideos}video_reel2.mov";
}
