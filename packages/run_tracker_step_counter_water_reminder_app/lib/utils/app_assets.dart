import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/run_tracker_step_counter_water_reminder_app/";
  static const _pImages = "${_path}assets/images/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pJsons = "${_path}assets/jsons/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = _pIcons;
  static String themeImages = _pImages;

  static void refreshAssets(BuildContext context) {
    themeIcons = (Theme.of(context).brightness == Brightness.light)
        ? _pIcons
        : _pDarkIcons;
    themeImages = (Theme.of(context).brightness == Brightness.light)
        ? _pImages
        : _pDarkImages;

    icFill100 = "${themeIcons}ic_fill_100.webp";
    icFill150 = "${themeIcons}ic_fill_150.webp";
    icFill250 = "${themeIcons}ic_fill_250.webp";
    icFill500 = "${themeIcons}ic_fill_500.webp";

    icWaterBottle = "${themeIcons}ic_water_bottle.webp";
    Debug.printLog("refreshAssets --- $themeIcons $themeImages");
  }

  /// IMAGES ===================================================================
  static String imgOnBoarding1 = "${_pImages}img_onboarding1.webp";
  static String imgOnBoarding2 = "${_pImages}img_onboarding2.webp";
  static String imgOnBoarding3 = "${_pImages}img_onboarding3.webp";

  static String imgMapView = "${_pImages}img_map_view.webp";
  static String imgShareMapView = "${_pImages}img_share_mapview.webp";
  static String imgMap = "${_pImages}img_map.webp";
  static String imgLocationPermission =
      "${_pImages}img_location_permission_bg.webp";
  static String imgCount1 = "${_pImages}img_count_1.webp";
  static String imgCount2 = "${_pImages}img_count_2.webp";
  static String imgCount3 = "${_pImages}img_count_3.webp";
  static String imgCountGO = "${_pImages}img_count_go.webp";
  static String imgCounterBg = "${_pImages}img_counter_bg.webp";
  static String imgProfile = "${_pImages}img_profile.webp";
  static String imgThumpsUp = "${_pImages}img_thumps_up.webp";
  static String imgFinish = "${_pImages}img_finish.webp";
  static String img12Star = "${_pImages}img_1_2_star.webp";
  static String img3Star = "${_pImages}img_3_star.webp";
  static String img4Star = "${_pImages}img_4_star.webp";
  static String img5Star = "${_pImages}img_5_star.webp";
  static String imgShoe = "${_pImages}img_shoe.webp";

  /// ICONS ====================================================================
  static String icArrowSelect = "${_pIcons}ic_arrow_select.webp";
  static String icFemale = "${_pIcons}ic_female.webp";
  static String icMale = "${_pIcons}ic_male.webp";
  static String icShoeLogo = "${_pIcons}ic_shoes_logo.webp";
  static String icGreenWalking = "${_pIcons}ic_green_walking.webp";
  static String icRedWalking = "${_pIcons}ic_red_walking.webp";
  static String icYellowWalk = "${_pIcons}ic_yellow_walk.webp";
  static String icInfo = "${_pIcons}ic_info.webp";
  static String icBack = "${_pIcons}ic_back.webp";
  static String icBlackStar = "${_pIcons}ic_black_star.webp";
  static String icClock = "${_pIcons}ic_clock.webp";
  static String icInfoBlack = "${_pIcons}ic_info_black.webp";
  static String icRedWalk = "${_pIcons}ic_red_walk.webp";
  static String icRoad = "${_pIcons}ic_road.webp";
  static String icRun = "${_pIcons}ic_run.webp";
  static String icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static String icSelectedProfile = "${_pIcons}ic_selected_profile.webp";
  static String icSteps = "${_pIcons}ic_steps.webp";
  static String icUnselectedHome = "${_pIcons}ic_unselected_home.webp";
  static String icUnselectedProfile = "${_pIcons}ic_unselected_profile.webp";
  static String icWaterDrop = "${_pIcons}ic_waterdrop.webp";
  static String icFilter = "${_pIcons}ic_filter.webp";
  static String icGPS = "${_pIcons}ic_gps.webp";
  static String icShare = "${_pIcons}ic_share.webp";
  static String icNetwork = "${_pIcons}ic_network.webp";
  static String icLock = "${_pIcons}ic_lock.webp";
  static String icPause = "${_pIcons}ic_pause.webp";
  static String icLocation = "${_pIcons}ic_location.webp";
  static String icStop = "${_pIcons}ic_stop.webp";
  static String icDustbin = "${_pIcons}ic_dustbin.webp";
  static String icRestart = "${_pIcons}ic_refresh.webp";
  static String icBlueWalk = "${_pIcons}ic_blue_walk.webp";
  static String icGreenWalk = "${_pIcons}ic_green_walk.webp";
  static String icTopSpeed = "${_pIcons}ic_top_speed.webp";
  static String icSetting = "${_pIcons}ic_setting.webp";
  static String icNoads = "${_pIcons}ic_noads.webp";
  static String icGreenTick = "${_pIcons}ic_green_tick.webp";
  static String icAllLocation = "${_pIcons}ic_all_location.webp";
  static String icMode = "${_pIcons}ic_mode.webp";
  static String icSwap = "${_pIcons}ic_swap.webp";
  static String icNotifications = "${_pIcons}ic_notifications.webp";
  static String icCalender = "${_pIcons}ic_calender.webp";
  static String icEmail = "${_pIcons}ic_email.webp";
  static String icPrivacy = "${_pIcons}ic_privacy.webp";
  static String icStar = "${_pIcons}ic_star.webp";
  static String icTranslate = "${_pIcons}ic_translate.webp";
  static String icTurnOff = "${_pIcons}ic_turnoff.webp";
  static String icReset = "${_pIcons}ic_reset.webp";
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icGraph = "${_pIcons}ic_graph.webp";

  static String icEmpty100 = "${_pIcons}ic_empty_100.webp";
  static String icEmpty150 = "${_pIcons}ic_empty_150.webp";
  static String icEmpty250 = "${_pIcons}ic_empty_250.webp";
  static String icEmpty500 = "${_pIcons}ic_empty_500.webp";

  static String icFill100 = "${themeIcons}ic_fill_100.webp";
  static String icFill150 = "${themeIcons}ic_fill_150.webp";
  static String icFill250 = "${themeIcons}ic_fill_250.webp";
  static String icFill500 = "${themeIcons}ic_fill_500.webp";

  static String icFillPlus100 = "${_pIcons}ic_fill_plus_100.webp";
  static String icFillPlus150 = "${_pIcons}ic_fill_plus_150.webp";
  static String icFillPlus250 = "${_pIcons}ic_fill_plus_250.webp";
  static String icFillPlus500 = "${_pIcons}ic_fill_plus_500.webp";
  static String icUpArrow = "${_pIcons}ic_up_arrow.png";
  static String icWaterBottle = "${themeIcons}ic_water_bottle.webp";
  static String icWatch = "${_pIcons}ic_watch.webp";
  static String icSetTarget = "${_pIcons}ic_set_target.webp";
  //JSONS ======================================
  static String jsSuccess = "${_pJsons}js_success.json";
}
