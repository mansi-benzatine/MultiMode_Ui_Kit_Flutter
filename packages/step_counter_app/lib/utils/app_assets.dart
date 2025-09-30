import 'package:flutter/material.dart';

import 'debug.dart';
import 'preference.dart';
import 'service_locator.dart';

class AppAssets {
  static const _path = "packages/step_counter_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false) ? _pIcons : _pDarkIcons;
    themeImages = getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false) ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    /// IMAGES
    imgNoDataFound = "${themeImages}img_no_data_found.png";
    imgEmptyStepHistory = "${themeImages}img_empty_step_history.png";
    imgEmptyCaloriesHistory = "${themeImages}img_empty_calories_history.png";
    imgEmptyDistanceHistory = "${themeImages}img_empty_distance_history.png";
    imgWatch = "${themeImages}img_watch.png";

    /// ICONS
    icPreviousProfileSetup = "${themeIcons}ic_previous_profile_setup.webp";
    icDeleteHistory = "${themeIcons}ic_delete_history.webp";
    icWaterTracker = "${themeIcons}ic_water_tracker.webp";
    icPrivacyPolicy = "${themeIcons}ic_privacy_policy.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${_pImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${_pImages}img_on_boarding_3.webp";
  static String imgNoDataFound = "${themeImages}img_no_data_found.png";
  static String imgEmptyStepHistory = "${themeImages}img_empty_step_history.png";
  static String imgBgStepsResult = "${_pImages}img_bg_steps_result.webp";
  static String imgBgCalorieResult = "${_pImages}img_bg_calorie_result.webp";
  static String imgEmptyCaloriesHistory = "${themeImages}img_empty_calories_history.png";
  static String imgEmptyDistanceHistory = "${themeImages}img_empty_distance_history.png";
  static String imgBgDistanceResult = "${_pImages}img_bg_distance_result.webp";
  static String imgBgSleepResult = "${_pImages}img_bg_sleep_result.webp";
  static String imgBgWaterResult = "${_pImages}img_bg_water_result.webp";
  static String imgWatch = "${themeImages}img_watch.png";
  static String imgWaterGlasses = "${_pImages}img_water_glasses.png";
  static String imgBgAchievementSuccess = "${_pImages}img_bg_achivement_success.webp";
  static String imgCrown = "${_pImages}img_crown.webp";

  /// ICONS ====================================================================

  static String icBack = "${_pIcons}ic_back.webp";
  static String icNext = "${_pIcons}ic_next.webp";
  static String icNextProfileSetup = "${_pIcons}ic_next_profile_setup.webp";
  static String icPreviousProfileSetup = "${themeIcons}ic_previous_profile_setup.webp";
  static String icSetupProfileDOB = "${_pIcons}ic_setup_profile_dob.webp";
  static String icSetupProfileGender = "${_pIcons}ic_setup_profile_gender.webp";
  static String icSetupProfileGoal = "${_pIcons}ic_setup_profile_goal.webp";
  static String icSetupProfileHeight = "${_pIcons}ic_setup_profile_height.webp";
  static String icSetupProfileLanguage = "${_pIcons}ic_setup_profile_langugae.webp";
  static String icSetupProfileNotification = "${_pIcons}ic_setup_profile_notification.webp";
  static String icSetupProfileWeight = "${_pIcons}ic_setup_profile_weight.webp";
  static String icMan = "${_pIcons}ic_man.webp";
  static String icWomen = "${_pIcons}ic_women.webp";
  static String icCheckRound = "${_pIcons}ic_check_round.webp";
  static String icTriangleRight = "${_pIcons}ic_triangle_right.webp";
  static String icDoneProfileSetup = "${_pIcons}ic_done_profile_setup.webp";
  static String icBottomBarHistorySelected = "${_pIcons}ic_bottom_bar_history_selected.webp";
  static String icBottomBarHomeSelected = "${_pIcons}ic_bottom_bar_home_selected.webp";
  static String icBottomBarProfileSelected = "${_pIcons}ic_bottom_bar_profile_selected.webp";
  static String icBottomBarSettingSelected = "${_pIcons}ic_bottom_bar_setting_selected.webp";
  static String icBottomBarHistory = "${_pIcons}ic_bottom_bar_history.webp";
  static String icBottomBarHome = "${_pIcons}ic_bottom_bar_home.webp";
  static String icBottomBarProfile = "${_pIcons}ic_bottom_bar_profile.webp";
  static String icBottomBarSetting = "${_pIcons}ic_bottom_bar_setting.webp";
  static String icWater = "${_pIcons}ic_water.webp";
  static String icAchievements = "${_pIcons}ic_achievements.webp";
  static String icCalories = "${_pIcons}ic_calories.webp";
  static String icClock = "${_pIcons}ic_clock.webp";
  static String icDistance = "${_pIcons}ic_distance.webp";
  static String icFire = "${_pIcons}ic_fire.webp";
  static String icFootStep = "${_pIcons}ic_foot_step.webp";
  static String icPinLocation = "${_pIcons}ic_pin_location.webp";
  static String icSleep = "${_pIcons}ic_sleep.webp";
  static String icSteps = "${_pIcons}ic_steps.webp";
  static String icTimes = "${_pIcons}ic_times.webp";
  static String icArrowRight = "${_pIcons}ic_arrow_right.webp";
  static String icDelete = "${_pIcons}ic_delete.webp";
  static String icHourMinDottedLine = "${_pIcons}ic_hour_min_dotted_line.webp";
  static String icKcalDottedLine = "${_pIcons}ic_kcal_dotted_line.webp";
  static String icKmDottedLine = "${_pIcons}ic_km_dotted_line.webp";
  static String icDeleteHistory = "${themeIcons}ic_delete_history.webp";
  static String icClose = "${_pIcons}ic_close.webp";
  static String icRoundDiamond = "${_pIcons}ic_round_diamond.webp";
  static String icRoundKing = "${_pIcons}ic_round_king.webp";
  static String icRoundStar = "${_pIcons}ic_round_star.webp";
  static String icRoundTrue = "${_pIcons}ic_round_true.webp";
  static String icAchievementsMedal = "${_pIcons}ic_achievements_medal.webp";
  static String icDarkMode = "${_pIcons}ic_dark_mode.webp";
  static String icFeedback = "${_pIcons}ic_feedback.webp";
  static String icGoogleFit = "${_pIcons}ic_google_fit.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icHistoryProfile = "${_pIcons}ic_history_profile.webp";
  static String icInstructions = "${_pIcons}ic_instructions.webp";
  static String icPrivacyPolicy = "${themeIcons}ic_privacy_policy.webp";
  static String icRemoveAds = "${_pIcons}ic_remove_ads.webp";
  static String icSync = "${_pIcons}ic_sync.webp";
  static String icWaterTracker = "${themeIcons}ic_water_tracker.webp";
  static String icWakeUp = "${_pIcons}ic_wake_up.webp";
  static String icArrowDropDown = "${_pIcons}ic_arrow_drop_down.webp";
  static String icFirstDayOfWeek = "${_pIcons}ic_first_day_of_week.webp";
  static String icGetInBed = "${_pIcons}ic_get_in_bed.webp";
  static String icSensitivity = "${_pIcons}ic_sensitivity.png";
  static String icStepLength = "${_pIcons}ic_step_length.webp";
  static String icUnit = "${_pIcons}ic_unit.webp";
  static String icAlarmClock = "${_pIcons}ic_alarm_clock.webp";
  static String icRepeat = "${_pIcons}ic_repeat.webp";
  static String icPersonMove = "${_pIcons}ic_person_move.webp";
  static String icCalender = "${_pIcons}ic_calender.webp";
  static String icReport = "${_pIcons}ic_report.webp";
  static String icShare = "${_pIcons}ic_share.webp";
  static String icBedTime = "${_pIcons}ic_bed_time.webp";
  static String icSleepResult = "${_pIcons}ic_sleep_result.webp";
  static String icWaterResult = "${_pIcons}ic_water_result.webp";
  static String icAchievementDailyStep = "${_pIcons}ic_achievement_daily_step.webp";
  static String icAchievementTotalDays = "${_pIcons}ic_achievement_total_days.webp";
  static String icAchievementTotalDistance = "${_pIcons}ic_achievement_total_distance.webp";

  static String icDailyStepMedal = "${_pIcons}ic_daily_step_medal.webp";
  static String icDailyStepMedalInactive = "${_pIcons}ic_daily_step_medal_inactive.webp";

  static String icTotalDistanceMedal = "${_pIcons}ic_total_distance_medal.webp";
  static String icTotalDistanceMedalInactive = "${_pIcons}ic_total_distance_medal_inactive.webp";

  static String icTotalDaysMedal = "${_pIcons}ic_total_days_medal.webp";
  static String icTotalDaysMedalInactive = "${_pIcons}ic_total_days_medal_inactive.webp";

  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icMoreCircle = "${_pIcons}ic_more_circle.webp";
}
