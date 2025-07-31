import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/run_tracker_screens_app/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;
  static void refreshAssets(ThemeData themeData) {
    themeIcons = themeData.brightness == Brightness.light
        ? _pIcons
        : _pDarkIcons;
    themeImages = themeData.brightness == Brightness.light
        ? _pImages
        : _pDarkImages;

    imgEmptyHistory = "${themeImages}img_empty_history.webp";
    icLockWhiteDot = "${themeIcons}ic_lock_white_dot.webp";
    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_onboarding1.webp";
  static String imgOnBoarding2 = "${_pImages}img_onboarding2.webp";
  static String imgOnBoarding3 = "${_pImages}img_onboarding3.webp";

  static String imgFemale = "${_pImages}img_female.webp";
  static String imgMale = "${_pImages}img_male.webp";
  static String imgEmptyHistory = "${themeImages}img_empty_history.webp";

  static String imgLoading = "${_pImages}img_loading.webp";
  static String imgMap = "${_pImages}img_map.webp";
  static String imgGrid = "${_pImages}img_grid.webp";
  static String imgMapPermission = "${_pImages}img_map_permission.webp";
  static String imgBgCountDown = "${_pImages}img_bg_count_down.webp";
  static String imgMap1 = "${_pImages}img_map1.webp";
  static String imgFinish = "${_pImages}img_finish.webp";
  static String imgAchievementShareBg =
      "${_pImages}img_achievement_share_bg.webp";
  static String imgAchievementMedal = "${_pImages}img_achievement_medal.webp";
  static String imgSubscriptionBg = "${_pImages}img_subscription_bg.webp";
  static String imgItIsTimeToRun = "${_pImages}img_it_is_time_run.webp";
  static String imgBgHomeScreen = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${_pImages}img_splash.webp";

  /// ICONS ====================================================================
  static String icGreenRoundNavigator =
      "${_pIcons}ic_green_round_navigator.webp";
  static String icPrimaryNavigator = "${_pIcons}ic_primary_navigator.webp";
  static String icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static String icSelectedReports = "${_pIcons}ic_selected_reports.webp";
  static String icSelectedHistory = "${_pIcons}ic_selected_history.webp";
  static String icSelectedSetting = "${_pIcons}ic_selected_setting.webp";
  static String icUnSelectedHome = "${_pIcons}ic_unselected_home.webp";
  static String icUnSelectedReport = "${_pIcons}ic_unselected_reports.webp";
  static String icUnSelectedHistory = "${_pIcons}ic_unselected_history.webp";
  static String icUnSelectedSetting = "${_pIcons}ic_unselected_setting.webp";
  static String icTime = "${_pIcons}ic_time.webp";
  static String icAverageSpeed = "${_pIcons}ic_average_speed.webp";
  static String icCalories = "${_pIcons}ic_calories.webp";
  static String icSpeedometer = "${_pIcons}ic_speedometer.webp";
  static String icRoad = "${_pIcons}ic_road.webp";
  static String icDistance = "${_pIcons}ic_distance.webp";
  static String icMap = "${_pIcons}ic_map.webp";
  static String icWhiteTime = "${_pIcons}ic_white_time.webp";
  static String icStar = "${_pIcons}ic_star.webp";
  static String icDustbin = "${_pIcons}ic_dustbin.webp";
  static String icSelected = "${_pIcons}ic_selected.webp";
  static String icRunShoes = "${_pIcons}ic_run_shoes.webp";
  static String icPlay = "${_pIcons}ic_primary_play.webp";
  static String icPause = "${_pIcons}ic_primary_pause.webp";
  static String icCount1 = "${_pIcons}ic_count1.webp";
  static String icCount2 = "${_pIcons}ic_count2.webp";
  static String icCount3 = "${_pIcons}ic_count3.webp";
  static String icCountGo = "${_pIcons}ic_count_go.webp";
  static String icBack = "${_pIcons}ic_back.webp";
  static String icGps = "${_pIcons}ic_gps.webp";
  static String icSatellite = "${_pIcons}ic_satellite.webp";
  static String icExpand = "${_pIcons}ic_expand.png";
  static String icResume = "${_pIcons}ic_resume.webp";
  static String icStop = "${_pIcons}ic_stop.webp";
  static String icUndo = "${_pIcons}ic_undo.webp";
  static String icLock = "${_pIcons}ic_lock.webp";
  static String icLockOpen = "${_pIcons}ic_lock_open.webp";
  static String icLocation = "${_pIcons}ic_location.webp";
  static String icUnit = "${_pIcons}ic_unit.webp";
  static String icDailyGoal = "${_pIcons}ic_daily_goal.webp";
  static String icReminder = "${_pIcons}ic_reminder.webp";
  static String icRightNavigator = "${_pIcons}ic_right_navigator.webp";
  static String icLanguage = "${_pIcons}ic_language.webp";
  static String icGoogle = "${_pIcons}ic_google.webp";
  static String icAchievements = "${_pIcons}ic_achievements.webp";
  static String icRefresh = "${_pIcons}ic_refresh.webp";
  static String icRateUs = "${_pIcons}ic_rate_us.webp";
  static String icContactUs = "${_pIcons}ic_contact_us.webp";
  static String icSubscription = "${_pIcons}ic_subscription.webp";
  static String icPrivacyPolicy = "${_pIcons}ic_privacy_policy.webp";
  static String icRepeat = "${_pIcons}ic_repeat.webp";
  static String icAlarm = "${_pIcons}ic_alarm.webp";
  static String icAchievement = "${_pIcons}ic_achievement.webp";
  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icMoreCircle = "${_pIcons}ic_more_circle.webp";
  static String icMoon = "${_pIcons}ic_moon.webp";
  static String icLockWhiteDot = "${themeIcons}ic_lock_white_dot.webp";
  static String icScreens = "${_pIcons}ic_screens.webp";
}
