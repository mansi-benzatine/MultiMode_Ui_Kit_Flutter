import 'package:baby_bloom_app/utils/preference.dart';
import 'package:baby_bloom_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/baby_bloom_app/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? _pIcons : _pDarkIcons;
    themeImages = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true) ? _pImages : _pDarkImages;
    imgOnBoarding1 = "${themeImages}img_onboarding1.webp";
    imgOnBoarding2 = "${themeImages}img_onboarding2.webp";
    imgOnBoarding3 = "${themeImages}img_onboarding3.webp";
    imgBackground = "${themeImages}img_background.webp";
    imgProfileSetupBackground = "${themeImages}img_profile_setup_background.webp";
    imgProfileSetupBackground2 = "${themeImages}img_profile_setup_background2.webp";
    imgHomeBackground = "${themeImages}img_home_background.webp";
    imgWeightFrame = "${themeImages}img_weight_frame.webp";
    imgBannerMom = "${themeImages}img_banner_mom.webp";
    imgBannerBaby = "${themeImages}img_banner_baby.webp";
    imgExploreWeek = "${themeImages}img_explore_week.webp";

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
  }

  /// IMAGES ===================================================================

  static String imgOnBoarding1 = "${themeImages}img_onboarding1.webp";
  static String imgOnBoarding2 = "${themeImages}img_onboarding2.webp";
  static String imgOnBoarding3 = "${themeImages}img_onboarding3.webp";

  static String imgGetStart = "${_pImages}img_get_start.webp";
  static String imgBackground = "${themeImages}img_background.webp";
  static String imgProfileSetupBackground = "${themeImages}img_profile_setup_background.webp";
  static String imgProfileSetupSuccessfully = "${_pImages}img_profile_setup_successfully.webp";
  static String imgProfileSetupBackground2 = "${themeImages}img_profile_setup_background2.webp";
  static String imgHomeBackground = "${themeImages}img_home_background.webp";
  static String imgExploreWeek = "${themeImages}img_explore_week.webp";

  static String imgDummyProfile = "${_pImages}img_dummy_profile.webp";
  static String imgSetYourDueDate = "${_pImages}img_set_your_due_date.webp";
  static String imgWeightFrame = "${themeImages}img_weight_frame.webp";
  static String imgHomeCarousel = "${_pImages}img_home_carousel.webp";
  static String imgWeeklyUpdateBackground = "${_pImages}img_weekly_update_background.webp";
  static String imgBannerMom = "${themeImages}img_banner_mom.webp";
  static String imgBannerBaby = "${themeImages}img_banner_baby.webp";
  static String imgExerciseVideo = "${_pImages}img_exercise_video.webp";
  static String imgVaccination = "${_pImages}img_vaccination.webp";
  static String img3dModel = "${_pImages}img_3d_model.webp";
  static String imgDietChart = "${_pImages}img_diet_chart.webp";
  static String imgPillReminder = "${_pImages}img_pill_reminder.webp";
  static String imgWeight = "${_pImages}img_weight.webp";
  static String imgKickCount = "${_pImages}img_kick_count.webp";
  static String imgSize = "${_pImages}img_size.webp";
  static String imgBabyNames = "${_pImages}img_baby_names.webp";
  static String imgContractions = "${_pImages}img_contractions.webp";
  static String imgFaq = "${_pImages}img_faq.webp";
  static String imgModelBaby = "${_pImages}img_model_baby.webp";
  static String imgBaby = "${_pImages}img_baby.webp";

  static String imgGrapes = "${_pImages}img_grapes.webp";
  static String imgRotator = "${_pImages}img_rotator.webp";
  static String imgRaspberry = "${_pImages}img_raspberry.webp";
  static String imgBlueBerries = "${_pImages}img_blueberries.webp";

  static String imgStoreHaircare = "${_pImages}img_store_haircare.webp";
  static String imgStoreStretchMark = "${_pImages}img_store_stretch_mark.webp";
  static String imgStoreVitamin = "${_pImages}img_store_vitamin.webp";
  static String imgStoreBath = "${_pImages}img_store_bath.webp";
  static String imgStoreDailyWellness = "${_pImages}img_store_daily_wellness.webp";
  static String imgStoreCloths = "${_pImages}img_store_cloths.webp";

  static String imgArticle1 = "${_pImages}img_article1.webp";
  static String imgArticle2 = "${_pImages}img_article2.webp";
  static String imgArticle3 = "${_pImages}img_article3.webp";

  static String imgBanner1 = "${_pImages}img_banner1.webp";
  static String imgBanner2 = "${_pImages}img_banner2.webp";
  static String imgBanner3 = "${_pImages}img_banner3.webp";
  static String imgBanner4 = "${_pImages}img_banner4.webp";

  static String imgBannerWeek4 = "${_pImages}img_banner_week4.webp";
  static String imgBannerWeek5 = "${_pImages}img_banner_week5.webp";
  static String imgBannerWeek8 = "${_pImages}img_banner_week8.webp";

  static String imgBgUpgradePlan = "${_pImages}img_bg_upgrade_plan.webp";
  static String imgContainerUpgradePlan = "${_pImages}img_container_upgrade_plan.webp";
  static String imgCrown = "${_pImages}img_crown.webp";
  static String imgRoundFrame = "${_pImages}img_round_frame.webp";
  static String img3dBaby = "${_pImages}img_3d_baby.webp";

  ///ICONS ======================================================
  static String icHeartDrag = "${_pIcons}ic_heart_drag.webp";
  static String icApple = "${_pIcons}ic_apple.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icGlobal = "${_pIcons}ic_global.webp";
  static String icWhatsApp = "${_pIcons}ic_whatsapp.webp";
  static String icTwitter = "${_pIcons}ic_twitter.webp";
  static String icArrowLeft = "${_pIcons}ic_arrow_left.webp";
  static String icCongratulation = "${_pIcons}ic_congratulation.webp";
  static String icEye = "${_pIcons}ic_eye.webp";
  static String icEyeSlash = "${_pIcons}ic_eye_slash.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icLock = "${_pIcons}ic_lock.webp";
  static String icMail = "${_pIcons}ic_mail.webp";
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icUser = "${_pIcons}ic_user.webp";
  static String icLovingMother = "${_pIcons}ic_loving_mother.webp";
  static String icPregnantWomen = "${_pIcons}ic_pregnant_women.webp";
  static String icVideo = "${_pIcons}ic_video.webp";
  static String icWeight = "${_pIcons}ic_weight.webp";
  static String icArticle = "${_pIcons}ic_article.webp";
  static String icSize = "${_pIcons}ic_size.webp";
  static String icLength = "${_pIcons}ic_length.webp";
  static String icRaspberry = "${_pIcons}ic_raspberry.webp";
  static String icAdd = "${_pIcons}ic_add.webp";
  static String icReminder = "${_pIcons}ic_reminder.webp";
  static String icMilestone = "${_pIcons}ic_milestone.webp";
  static String icVisit = "${_pIcons}ic_visits.webp";
  static String icHeart = "${_pIcons}ic_heart.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icUpgrade = "${_pIcons}ic_upgrade.webp";
  static String icMedicine = "${_pIcons}ic_medicine.webp";
  static String icInjection = "${_pIcons}ic_injection.webp";
  static String icContraction = "${_pIcons}ic_contraction.webp";
  static String icFilledHeart = "${_pIcons}ic_filled_heart.webp";
  static String icCalender = "${_pIcons}ic_calender.webp";
  static String icUnfilledWeight = "${_pIcons}ic_unfilled_weight.webp";
  static String icInfo = "${_pIcons}ic_info.webp";
  static String icLanguage = "${_pIcons}ic_language.webp";
  static String icLogout = "${_pIcons}ic_logout.webp";
  static String icMsg = "${_pIcons}ic_msg.webp";
  static String icMoon = "${_pIcons}ic_moon.webp";
  static String icNotification = "${_pIcons}ic_notification.webp";
  static String icProfile = "${_pIcons}ic_profile.webp";
  static String icShield = "${_pIcons}ic_shield.webp";
  static String icStar = "${_pIcons}ic_star.webp";
  static String icMark = "${_pIcons}ic_mark.webp";
  static String icPlanActivate = "${_pIcons}ic_plan_activate.webp";
  static String icMasterCard = "${_pIcons}ic_master_card.webp";
  static String icUnfilledApple = "${_pIcons}ic_unfilled_apple.webp";
  static String icEmojiSad = "${_pIcons}ic_emoji_sad.webp";
  static String icGooglePay = "${_pIcons}ic_google_pay.webp";
  static String icPaypal = "${_pIcons}ic_paypal.webp";
  static String icAddSecondary = "${_pIcons}ic_add_secondary.webp";
  static String icClock = "${_pIcons}ic_clock.webp";
  static String icBack = "${_pIcons}ic_back.webp";
  static String icColorVisit = "${_pIcons}ic_color_visit.webp";
  static String icEmptyNotification = "${_pIcons}ic_empty_notification.webp";
  static String icSadEmoji = "${_pIcons}ic_sad_emoji.webp";

  static String icBoth = "${_pIcons}ic_both.webp";
  static String icBoy = "${_pIcons}ic_boy.webp";
  static String icGirl = "${_pIcons}ic_girl.webp";
  static String icFemale = "${_pIcons}ic_female.webp";
  static String icMale = "${_pIcons}ic_male.webp";

  static String icRate0 = "${_pIcons}ic_rate0.webp";
  static String icRate1 = "${_pIcons}ic_rate1.webp";
  static String icRate2 = "${_pIcons}ic_rate2.webp";
  static String icRate3 = "${_pIcons}ic_rate3.webp";
  static String icRate4 = "${_pIcons}ic_rate4.webp";
  static String icRate5 = "${_pIcons}ic_rate5.webp";

  static String icUnselectedHome = "${_pIcons}ic_unselected_home.webp";
  static String icUnselectedShoppingCart = "${_pIcons}ic_unselected_shopping_cart.webp";
  static String icUnselectedCalendar = "${_pIcons}ic_unselected_calendar.webp";
  static String icUnselectedTools = "${_pIcons}ic_unselected_tools.webp";
  static String icUnselectedExplore = "${_pIcons}ic_unselected_discover.webp";
  static String icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static String icSelectedShoppingCart = "${_pIcons}ic_selected_shopping_cart.webp";
  static String icSelectedCalendar = "${_pIcons}ic_selected_calendar.webp";
  static String icSelectedTools = "${_pIcons}ic_selected_tools.webp";
  static String icSelectedExplore = "${_pIcons}ic_selected_discover.webp";
}
