import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/chat_ai_app_package/";
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

    /// IMAGES
    imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
    imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
    imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
    imgWelcome = "${themeImages}img_welcome.webp";
    imgTapToChat = "${themeImages}img_tap_to_chat.webp";
    imgKing = "${themeImages}img_king.webp";

    /// ICONS
    icBack = "${themeIcons}ic_back.webp";
    icAiText = "${themeIcons}ic_ai_text.webp";
    icNotification = "${themeIcons}ic_notification.webp";
    icToolWritingAcademicWriter = "${themeIcons}ic_tool_writing_academic_writer.webp";
    icToolEntertainmentMovieScript = "${themeIcons}ic_tool_entertainment_movie_script.webp";
    icDone = "${themeIcons}ic_done.webp";
    icContactUsCustomerService = "${themeIcons}ic_contact_us_customer_service.webp";
    icContactUsFacebook = "${themeIcons}ic_contact_us_facebook.webp";
    icContactUsInstagram = "${themeIcons}ic_contact_us_instagram.webp";
    icContactUsTelegram = "${themeIcons}ic_contact_us_telegram.webp";
    icContactUsTwitter = "${themeIcons}ic_contact_us_twitter.webp";
    icContactUsWebsite = "${themeIcons}ic_contact_us_website.webp";
    icContactUsWhatsApp = "${themeIcons}ic_contact_us_whats_app.webp";
    icAppLogoRound = "${themeIcons}ic_app_logo_round.webp";
    icPrivacyPolicy = "${themeIcons}ic_privacy_policy.webp";
    icNotificationRound = "${themeIcons}ic_notification_round.webp";
    icHelpCenter = "${themeIcons}ic_help_center.webp";
    icLogout = "${themeIcons}ic_logout.webp";
    icTheme = "${themeIcons}ic_theme.webp";
    icProfile = "${themeIcons}ic_profile.webp";
    icSecurity = "${themeIcons}ic_security.webp";
    icLanguage = "${themeIcons}ic_language.webp";
    icInfo = "${themeIcons}ic_info.webp";
    icChat = "${themeIcons}ic_chat.webp";
    icShield = "${themeIcons}ic_shield.webp";
    icWallet = "${themeIcons}ic_wallet.webp";
    icAppleUnfilled = "${themeIcons}ic_apple_unfilled.webp";
    icHorizontalMore = "${themeIcons}ic_horizontal_more.webp";
    icPlus = "${themeIcons}ic_plus.webp";
    icSearch = "${themeIcons}ic_search.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
  static String imgWelcome = "${themeImages}img_welcome.webp";
  static String imgTapToChat = "${themeImages}img_tap_to_chat.webp";
  static String imgKing = "${themeImages}img_king.webp";

  static const imgBot = "${_pImages}img_bot.webp";
  static const imgBgPurchaseCard = "${_pImages}img_bg_purchase_card.webp";
  static const imgEmptyHistory = "${_pImages}img_empty_history.webp";
  static const imgDummyProfile = "${_pImages}img_dummy_profile.webp";
  static const imgBgSubscription1 = "${_pImages}img_bg_subscription_1.webp";
  static const imgBgSubscription2 = "${_pImages}img_bg_subscription_2.webp";
  static const imgBgSubscription3 = "${_pImages}img_bg_subscription_3.webp";
  static const imgBotPlaceholder = "${_pImages}img_bot_placeholder.webp";
  static const imgSearchEmpty = "${_pImages}img_search_empty_view.webp";
  static const imgBgCard = "${_pImages}img_bg_card.webp";

  static const imgUser1 = "${_pImages}img_user1.webp";
  static const imgUser2 = "${_pImages}img_user2.webp";
  static const imgUser3 = "${_pImages}img_user3.webp";
  static const imgUser4 = "${_pImages}img_user4.webp";
  static const imgUser5 = "${_pImages}img_user5.webp";

  /// ICONS ====================================================================
  static String icBack = "${themeIcons}ic_back.webp";
  static String icAiText = "${themeIcons}ic_ai_text.webp";
  static String icNotification = "${themeIcons}ic_notification.webp";
  static String icToolWritingAcademicWriter = "${themeIcons}ic_tool_writing_academic_writer.webp";
  static String icToolEntertainmentMovieScript = "${themeIcons}ic_tool_entertainment_movie_script.webp";
  static String icPrivacyPolicy = "${themeIcons}ic_privacy_policy.webp";
  static String icNotificationRound = "${themeIcons}ic_notification_round.webp";
  static String icHelpCenter = "${themeIcons}ic_help_center.webp";
  static String icLogout = "${themeIcons}ic_logout.webp";
  static String icDone = "${themeIcons}ic_done.webp";
  static String icContactUsCustomerService = "${themeIcons}ic_contact_us_customer_service.webp";
  static String icContactUsFacebook = "${themeIcons}ic_contact_us_facebook.webp";
  static String icContactUsInstagram = "${themeIcons}ic_contact_us_instagram.webp";
  static String icContactUsTelegram = "${themeIcons}ic_contact_us_telegram.webp";
  static String icContactUsTwitter = "${themeIcons}ic_contact_us_twitter.webp";
  static String icContactUsWebsite = "${themeIcons}ic_contact_us_website.webp";
  static String icContactUsWhatsApp = "${themeIcons}ic_contact_us_whats_app.webp";
  static String icAppLogoRound = "${themeIcons}ic_app_logo_round.webp";
  static String icTheme = "${themeIcons}ic_theme.webp";

  static const icNextRound = "${_pIcons}ic_next_round.webp";
  static const icApple = "${_pIcons}ic_apple.webp";
  static const icCheckBoxFill = "${_pIcons}ic_check_box_fill.webp";
  static const icCheckBoxUnFill = "${_pIcons}ic_check_box_un_fill.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icName = "${_pIcons}ic_name.webp";
  static const icPassword = "${_pIcons}ic_password.webp";
  static const icUnVisiblePassword = "${_pIcons}ic_un_visible_password.webp";
  static const icVisiblePassword = "${_pIcons}ic_visible_password.webp";
  static const icCongratulation = "${_pIcons}ic_congratulation.webp";

  static const icBottomFilledHistory = "${_pIcons}ic_bottom_filled_history.webp";
  static const icBottomUnFilledHistory = "${_pIcons}ic_bottom_unfilled_history.webp";
  static const icBottomFilledHome = "${_pIcons}ic_bottom_filled_home.webp";
  static const icBottomUnFilledHome = "${_pIcons}ic_bottom_unfilled_home.webp";
  static const icBottomFilledProfile = "${_pIcons}ic_bottom_filled_profile.webp";
  static const icBottomUnFilledProfile = "${_pIcons}ic_bottom_unfilled_profile.webp";
  static const icBottomFilledTools = "${_pIcons}ic_bottom_filled_tools.webp";
  static const icBottomUnFilledTools = "${_pIcons}ic_bottom_unfilled_tools.webp";
  static String icInfo = "${themeIcons}ic_info.webp";
  static String icChat = "${themeIcons}ic_chat.webp";
  static String icShield = "${themeIcons}ic_shield.webp";
  static const icShare = "${_pIcons}ic_share.webp";
  static const icClearChat = "${_pIcons}ic_clear_chat.webp";
  static const icVolume = "${_pIcons}ic_volume.webp";
  static const icEditChat = "${_pIcons}ic_edit_chat.webp";
  static const icCopy = "${_pIcons}ic_copy.webp";
  static String icSearch = "${themeIcons}ic_search.webp";
  static String icHorizontalMore = "${themeIcons}ic_horizontal_more.webp";
  static const icSquareFacebook = "${_pIcons}ic_square_facebook.webp";
  static const icSquareWhatsapp = "${_pIcons}ic_square_whatsapp.webp";
  static const icSquareTelegram = "${_pIcons}ic_square_telegram.webp";
  static const icSquareInstagram = "${_pIcons}ic_square_instagram.webp";
  static const icSquareTwitter = "${_pIcons}ic_square_twitter.webp";
  static String icProfile = "${themeIcons}ic_profile.webp";
  static String icSecurity = "${themeIcons}ic_security.webp";
  static String icLanguage = "${themeIcons}ic_language.webp";
  static String icWallet = "${themeIcons}ic_wallet.webp";
  static const icPayPal = "${_pIcons}ic_paypal.webp";
  static String icPlus = "${themeIcons}ic_plus.webp";
  static String icAppleUnfilled = "${themeIcons}ic_apple_unfilled.webp";
  static const icMastercard = "${_pIcons}ic_mastercard.webp";

  static const icFlagArabic = "${_pIcons}ic_flag_arbic.webp";
  static const icFlagChines = "${_pIcons}ic_flag_chines.webp";
  static const icFlagFrench = "${_pIcons}ic_flag_french.webp";
  static const icFlagIndia = "${_pIcons}ic_flag_india.webp";
  static const icFlagIndonesia = "${_pIcons}ic_flag_indonesia.webp";
  static const icFlagItalian = "${_pIcons}ic_flag_italian.webp";
  static const icFlagSpanish = "${_pIcons}ic_flag_span.webp";
  static const icFlagUK = "${_pIcons}ic_flag_uk.webp";
  static const icFlagUS = "${_pIcons}ic_flag_us.webp";
  static const icFlagRussia = "${_pIcons}ic_flag_russia.webp";
  static const icFlagGermany = "${_pIcons}ic_flag_germany.webp";

  static const icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static const icDelete = "${_pIcons}ic_delete.webp";
  static const icTrash = "${_pIcons}ic_trash.webp";
  static const icToolBusiness = "${_pIcons}ic_tool_business.webp";
  static const icToolBusinessAdvertisement = "${_pIcons}ic_tool_business_advertisement.webp";
  static const icToolBusinessEmail = "${_pIcons}ic_tool_business_email.webp";
  static const icToolBusinessInterviewerAnswers = "${_pIcons}ic_tool_business_interviewer_answers.webp";
  static const icToolBusinessJobPost = "${_pIcons}ic_tool_business_job_post.webp";
  static const icToolCode = "${_pIcons}ic_tool_code.webp";
  static const icToolCodeExplainCode = "${_pIcons}ic_tool_code_explain_code.webp";
  static const icToolCodeWriteCode = "${_pIcons}ic_tool_code_write_code.webp";
  static const icToolEntertainment = "${_pIcons}ic_tool_entertainment.webp";
  static const icToolEntertainmentJokes = "${_pIcons}ic_tool_entertainment_jokes.webp";
  static const icToolEntertainmentMusic = "${_pIcons}ic_tool_entertainment_music.webp";
  static const icToolEntertainmentPoems = "${_pIcons}ic_tool_entertainment_poems.webp";
  static const icToolEntertainmentStoryteller = "${_pIcons}ic_tool_entertainment_storyteller.webp";
  static const icToolPersonal = "${_pIcons}ic_tool_personal.webp";
  static const icToolPersonalApology = "${_pIcons}ic_tool_personal_apology.webp";
  static const icToolPersonalBirthday = "${_pIcons}ic_tool_personal_birthday.webp";
  static const icToolPersonalHealth = "${_pIcons}ic_tool_personal_health.webp";
  static const icToolPersonalInvitation = "${_pIcons}ic_tool_personal_invitation.webp";
  static const icToolRecipes = "${_pIcons}ic_tool_recipes.webp";
  static const icToolRecipesDietPlan = "${_pIcons}ic_tool_recipes_diet_plan.webp";
  static const icToolRecipesFoodRecipes = "${_pIcons}ic_tool_recipes_food_recipes.webp";
  static const icToolSocialMedia = "${_pIcons}ic_tool_social_media.webp";
  static const icToolSocialMediaFacebook = "${_pIcons}ic_tool_social_media_facebook.webp";
  static const icToolSocialMediaInstagram = "${_pIcons}ic_tool_social_media_instagram.webp";
  static const icToolSocialMediaLinkedin = "${_pIcons}ic_tool_social_media_linkedin.webp";
  static const icToolSocialMediaTelegram = "${_pIcons}ic_tool_social_media_telegram.webp";
  static const icToolSocialMediaTiktok = "${_pIcons}ic_tool_social_media_tiktok.webp";
  static const icToolSocialMediaTwitter = "${_pIcons}ic_tool_social_media_twitter.webp";
  static const icToolSocialMediaWhatsapp = "${_pIcons}ic_tool_social_media_whatsapp.webp";
  static const icToolTranslator = "${_pIcons}ic_tool_translator.webp";
  static const icToolTranslatorTranslator = "${_pIcons}ic_tool_translator_translator.webp";
  static const icToolWriting = "${_pIcons}ic_tool_writing.webp";
  static const icToolWritingArticles = "${_pIcons}ic_tool_writing_articles.webp";
  static const icToolWritingSummarize = "${_pIcons}ic_tool_writing_summarize.webp";
  static const icSend = "${_pIcons}ic_send.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";
  static const icCall = "${_pIcons}ic_phone.webp";
  static const icArrowLeft = "${_pIcons}ic_arrow_left.webp";
  static const icCalendar = "${_pIcons}ic_calendar.webp";
  static const icGender = "${_pIcons}ic_gender.webp";
}
