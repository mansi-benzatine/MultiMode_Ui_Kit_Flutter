import 'package:flowly_app/utils/preference.dart';
import 'package:flowly_app/utils/service_locator.dart';
import 'package:flutter/material.dart';

import 'debug.dart';

class AppAssets {
  static const _path = "packages/flowly_app/";
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

    imgOnboarding1 = "${themeImages}img_onboarding_1.webp";
    imgOnboarding2 = "${themeImages}img_onboarding_2.webp";
    imgOnboarding3 = "${themeImages}img_onboarding_3.webp";
    imgBgNavbar = "${themeImages}img_bg_navbar.webp";
    imgFertileBg = "${themeImages}img_fertile_bg.webp";
    imgHomeDefaultBg = "${themeImages}img_home_default_bg.webp";
    imgNonPeriodBg = "${themeImages}img_non_period_bg.webp";
    imgOvulationBg = "${themeImages}img_ovulation_bg.webp";

    icEmptyBookmark = "${themeIcons}ic_empty_bookmark.webp";
    icSearchNotFound = "${themeIcons}ic_search_not_found.webp";
  }

  /// IMAGES ===================================================================
  static String imgOnboarding1 = "${themeImages}img_onboarding_1.webp";
  static String imgOnboarding2 = "${themeImages}img_onboarding_2.webp";
  static String imgOnboarding3 = "${themeImages}img_onboarding_3.webp";

  static String imgBgNavbar = "${themeImages}img_bg_navbar.webp";
  static String imgDummyProfile = "${_pImages}img_dummy_profile.webp";

  static String imgWaterDrop = "${_pImages}img_water_drop.webp";

  static String imgFertileBg = "${themeImages}img_fertile_bg.webp";
  static String imgHomeDefaultBg = "${themeImages}img_home_default_bg.webp";
  static String imgNonPeriodBg = "${themeImages}img_non_period_bg.webp";
  static String imgOvulationBg = "${themeImages}img_ovulation_bg.webp";

  static String imgSelfCare1 = "${_pImages}img_self_care1.webp";
  static String imgSelfCare2 = "${_pImages}img_self_care2.webp";
  static String imgSelfCare3 = "${_pImages}img_self_care3.webp";
  static String imgSelfCare4 = "${_pImages}img_self_care4.webp";

  /// Icons ===================================================================
  static String icEdit = "${_pIcons}ic_edit.webp";
  static String icNote = "${_pIcons}ic_note.webp";
  static String icWaterDropPrimary = "${_pIcons}ic_water_drop_primary.webp";
  static String icNextFertile = "${_pIcons}ic_next_fertile.webp";
  static String icCalendar = "${_pIcons}ic_calendar.webp";
  static String icMedicineCapsule = "${_pIcons}ic_medicine_capsule.webp";
  static String icMedicineRound = "${_pIcons}ic_medicine_round.webp";
  static String icOvulation = "${_pIcons}ic_ovulation.webp";
  static String icVideoPlay = "${_pIcons}ic_video_play.webp";
  static String icBookmark = "${_pIcons}ic_bookmark.webp";
  static String icSearch = "${_pIcons}ic_search.webp";
  static String icEmptyBookmark = "${themeIcons}ic_empty_bookmark.webp";
  static String icBack = "${_pIcons}ic_back.webp";
  static String icSearchNotFound = "${themeIcons}ic_search_not_found.webp";
  static String icBirthday = "${_pIcons}ic_birthday.webp";
  static String icCustomer = "${_pIcons}ic_customer.webp";
  static String icFacebook = "${_pIcons}ic_facebook.webp";
  static String icGlobal = "${_pIcons}ic_global.webp";
  static String icWhatsapp = "${_pIcons}ic_whatsapp.webp";
  static String icInfo = "${_pIcons}ic_info.webp";
  static String icLanguage = "${_pIcons}ic_language.webp";
  static String icInstagram = "${_pIcons}ic_instagram.webp";
  static String icLogout = "${_pIcons}ic_logout.webp";
  static String icHelpCenter = "${_pIcons}ic_help_center.webp";
  static String icMoon = "${_pIcons}ic_moon.webp";
  static String icNotification = "${_pIcons}ic_notification.webp";
  static String icProfile = "${_pIcons}ic_profile.webp";
  static String icShield = "${_pIcons}ic_shield.webp";
  static String icStar = "${_pIcons}ic_star.webp";
  static String icEmail = "${_pIcons}ic_email.webp";
  static String icUpgradePlan = "${_pIcons}ic_upgrade_plan.webp";
  static String icDelete = "${_pIcons}ic_delete.webp";

  static String icNoDischarge = "${_pIcons}ic_no_discharge.webp";
  static String icCreamyDischarge = "${_pIcons}ic_creamy_discharge.webp";
  static String icStickyDischarge = "${_pIcons}ic_sticky_discharge.webp";
  static String icUnusualDischarge = "${_pIcons}ic_unusual_discharge.webp";
  static String icClumpyDischarge = "${_pIcons}ic_clumpy_discharge.webp";
  static String icEggWhiteDischarge = "${_pIcons}ic_eggwhite_discharge.webp";
  static String icWateryDischarge = "${_pIcons}ic_watery_discharge.webp";

  static String icHeadacheSymptoms = "${_pIcons}ic_headache_symptom.webp";
  static String icBackacheSymptoms = "${_pIcons}ic_backache_symptom.webp";
  static String icFatigueSymptoms = "${_pIcons}ic_fatigue_symptom.webp";
  static String icVaginalItchingSymptoms = "${_pIcons}ic_vaginal_itching_symptom.webp";
  static String icDiarrheasSymptoms = "${_pIcons}ic_diarrheas_symptoms.webp";
  static String icCravingSymptoms = "${_pIcons}ic_cravings_symptoms.webp";
  static String icNauseaSymptoms = "${_pIcons}ic_nausea_symptoms.webp";
  static String icOverSleepSymptoms = "${_pIcons}ic_over_sleep_symptoms.webp";

  static String icLowMenstrualFlow = "${_pIcons}ic_low_menstrual_flow.webp";
  static String icMediumMenstrualFlow = "${_pIcons}ic_medium_menstrual_flow.webp";
  static String icHighMenstrualFlow = "${_pIcons}ic_high_menstrual_flow.webp";

  static String icWorriedEmoji = "${_pIcons}ic_worried_emoji.webp";
  static String icMoodSwingEmoji = "${_pIcons}ic_mood_swing_emoji.webp";
  static String icIrritatedEmoji = "${_pIcons}ic_irritated_emoji.webp";
  static String icClamEmoji = "${_pIcons}ic_clam_emoji.webp";
  static String icTiredEmoji = "${_pIcons}ic_tired_emoji.webp";

  static String icSelectedHome = "${_pIcons}ic_selected_home.webp";
  static String icSelectedSelfCare = "${_pIcons}ic_selected_self_care.webp";
  static String icSelectedMyReport = "${_pIcons}ic_selected_my_report.webp";
  static String icSelectedProfile = "${_pIcons}ic_selected_profile.webp";
}
