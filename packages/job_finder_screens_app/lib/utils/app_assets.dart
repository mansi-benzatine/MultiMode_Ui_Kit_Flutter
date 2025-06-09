import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/ui/app/my_app.dart';

import 'debug.dart';

class AppAssets {
  //Remove _p
  static const _path = "packages/job_finder_screens_app_package/";
  static const _pImages = "${_path}assets/images/";
  static const _pIcons = "${_path}assets/icons/";
  static const _pDarkImages = "${_path}assets/dark_images/";
  static const _pDarkIcons = "${_path}assets/dark_icons/";

  static String themeIcons = (Theme.of(JobFinderScreensApp.navigatorKey.currentContext!).brightness == Brightness.light) ? _pIcons : _pDarkIcons;
  static String themeImages = (Theme.of(JobFinderScreensApp.navigatorKey.currentContext!).brightness == Brightness.light) ? _pImages : _pDarkImages;

  static void refreshAssets() {
    themeIcons = (Theme.of(JobFinderScreensApp.navigatorKey.currentContext!).brightness == Brightness.light) ? _pIcons : _pDarkIcons;
    themeImages = (Theme.of(JobFinderScreensApp.navigatorKey.currentContext!).brightness == Brightness.light) ? _pImages : _pDarkImages;

    Debug.printLog("refreshAssets --- $themeIcons $themeImages");

    /// IMAGES
    imgOnBoarding1 = "${_pImages}img_on_boarding_1.webp";
    imgOnBoarding2 = "${_pImages}img_on_boarding_2.webp";
    imgOnBoarding3 = "${_pImages}img_on_boarding_3.webp";
    imgSplash = "${themeImages}img_splash.webp";
    imgPlaceHolderForgotPass = "${themeImages}img_place_holder_forgot_pass.webp";
    imgBgEmptyNotification = "${themeImages}img_bg_empty_notification.webp";
    imgBgEmptyMessage = "${themeImages}img_bg_empty_message.webp";

    /// ICONS
    // icAppBot = "${themeIcons}ic_app_bot.webp";
  }

  /// IMAGES ===================================================================
// static String onBoarding1 = "${themeImages}on_boarding_1.webp";
// static const imgComingSoon = "${_pImages}img_coming_soon.webp";
/*  static String imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";*/

  static String imgOnBoarding1 = "${themeImages}img_on_boarding_1.webp";
  static String imgOnBoarding2 = "${themeImages}img_on_boarding_2.webp";
  static String imgOnBoarding3 = "${themeImages}img_on_boarding_3.webp";
  static const imgBgWelcome = "${_pImages}img_bg_welcome.webp";
  static const imgPlaceHolderEnterOtp = "${_pImages}img_place_holder_enter_otp.webp";
  static String imgPlaceHolderForgotPass = "${themeImages}img_place_holder_forgot_pass.webp";
  static const imgPlaceHolderResetPass = "${_pImages}img_place_holder_reset_pass.webp";
  static const imgDummyProfile = "${_pImages}img_dummy_profile.webp";
  static const imgDummyFindJob = "${_pImages}img_dummy_find_job.webp";
  static const imgCardBackground = "${_pImages}img_card_background.webp";
  static const imgDummyCompanyGallery1 = "${_pImages}img_dummy_company_gallery1.webp";
  static const imgDummyCompanyGallery2 = "${_pImages}img_dummy_company_gallery2.webp";
  static const imgDummyCompanyGallery3 = "${_pImages}img_dummy_company_gallery3.webp";
  static const imgDummyCompanyGallery4 = "${_pImages}img_dummy_company_gallery4.webp";
  static const imgAvatarEmpReview1 = "${_pImages}img_avatar_emp_review.webp";
  static const imgAvatarEmpReview2 = "${_pImages}img_avatar_emp_review1.webp";
  static const imgAvatarEmpReview3 = "${_pImages}img_avatar_emp_review2.webp";
  static const imgSuccessfullyJobApplied = "${_pImages}img_successfully_job_applied.webp";
  static const imgBgNoSearchFound = "${_pImages}img_bg_no_search_found.webp";
  static String imgBgEmptyNotification = "${themeImages}img_bg_empty_notification.webp";
  static const imgAvatarMessage1 = "${_pImages}img_avatar_message1.webp";
  static const imgAvatarMessage2 = "${_pImages}img_avatar_message2.webp";
  static const imgAvatarMessage3 = "${_pImages}img_avatar_message3.webp";
  static const imgAvatarMessage4 = "${_pImages}img_avatar_message4.webp";
  static const imgAvatarMessage5 = "${_pImages}img_avatar_message5.webp";
  static const imgAvatarMessage6 = "${_pImages}img_avatar_message6.webp";
  static const imgAvatarMessage7 = "${_pImages}img_avatar_message7.webp";
  static const imgBgOutgoingVideoCall = "${_pImages}img_bg_outgoing_video_call.webp";
  static const imgBgIncomingVideoCall = "${_pImages}img_bg_incoming_video_call.webp";
  static String imgBgEmptyMessage = "${themeImages}img_bg_empty_message.webp";
  static const imgBgEmptySavedJobs = "${_pImages}img_bg_empty_saved_jobs.webp";
  static const imgBgLogout = "${_pImages}img_bg_logout.webp";
  static const imgBgBottomCallAction = "${_pImages}img_bg_bottom_call_action.webp";
  static const imgDeleteAccount = "${_pImages}img_delete_account.webp";
  static const imgBgHomeScreenPlain = "${_pImages}img_bg_home_screen_plain.webp";
  static String imgSplash = "${themeImages}img_splash.webp";

  /// ICONS ====================================================================
// static String icBack = "${themeIcons}ic_back.webp";
// static const icBottomBarHistory = "${_pIcons}ic_bottom_bar_history.webp";
  static const icBack = "${_pIcons}ic_back.webp";
  static String icNextRound = "${_pIcons}ic_next_round.webp";
  // static String icNextRound = "${themeIcons}ic_next_round.webp";
  static const icRadioCheck = "${_pIcons}ic_radio_check.webp";
  static const icCompanySelected = "${_pIcons}ic_company_selected.webp";
  static const icJobSeekerSelected = "${_pIcons}ic_job_seeker_selected.webp";
  static const icCompanyUnSelected = "${_pIcons}ic_company_un_selected.webp";
  static const icJobSeekerUnSelected = "${_pIcons}ic_job_seeker_un_selected.webp";
  static const icRadioUnCheck = "${_pIcons}ic_radio_un_check.webp";
  static const icCheckSelected = "${_pIcons}ic_check_selected.webp";
  static const icCheckUnSelected = "${_pIcons}ic_check_un_selected.webp";
  static const icApple = "${_pIcons}ic_apple.webp";
  static const icFacebook = "${_pIcons}ic_facebook.webp";
  static const icGoogle = "${_pIcons}ic_google.webp";
  static const icEmail = "${_pIcons}ic_email.webp";
  static const icPass = "${_pIcons}ic_pass.webp";
  static const icUser = "${_pIcons}ic_user.webp";
  static const icHidePass = "${_pIcons}ic_hide_pass.webp";
  static const icShowPass = "${_pIcons}ic_show_pass.webp";
  static const icRolesEducationUnSelected = "${_pIcons}ic_roles_education_un_selected.webp";
  static const icRolesFinanceSelected = "${_pIcons}ic_roles_finance_selected.webp";
  static const icRolesHealthSelected = "${_pIcons}ic_roles_health_selected.webp";
  static const icRolesDesignUnSelected = "${_pIcons}ic_roles_design_un_selected.webp";
  static const icArrowDown = "${_pIcons}ic_arrow_down.webp";
  static const icJobTitle = "${_pIcons}ic_job_title.webp";
  static const icTypeTimeUnSelected = "${_pIcons}ic_type_time_un_selected.webp";
  static const icRadioUnSelected = "${_pIcons}ic_radio_un_selected.webp";
  static const icCall = "${_pIcons}ic_call.webp";
  static const icTypeInternshipSelected = "${_pIcons}ic_type_internship_selected.webp";
  static const icTypeTimeSelected = "${_pIcons}ic_type_time_selected.webp";
  static const icLocation = "${_pIcons}ic_location.webp";
  static const icCreateAccountSuccess = "${_pIcons}ic_create_account_success.webp";
  static const icRolesProgrammerSelected = "${_pIcons}ic_roles_programmer_selected.webp";
  static const icRolesEducationSelected = "${_pIcons}ic_roles_education_selected.webp";
  static const icRadioSelected = "${_pIcons}ic_radio_selected.webp";
  static const icRolesDesignSelected = "${_pIcons}ic_roles_design_selected.webp";
  static const icRolesFinanceUnSelected = "${_pIcons}ic_roles_finance_un_selected.webp";
  static const icTypeFreelancerUnSelected = "${_pIcons}ic_type_freelancer_un_selected.webp";
  static const icRolesRestaurantUnSelected = "${_pIcons}ic_roles_restaurant_un_selected.webp";
  static const icCalender = "${_pIcons}ic_calender.webp";
  static const icRolesProgrammerUnSelected = "${_pIcons}ic_roles_programmer_un_selected.webp";
  static const icTypeInternshipUnSelected = "${_pIcons}ic_type_internship_un_selected.webp";
  static const icRolesHealthUnSelected = "${_pIcons}ic_roles_health_un_selected.webp";
  static const icEdit = "${_pIcons}ic_edit.webp";
  static const icRolesRestaurantSelected = "${_pIcons}ic_roles_restaurant_selected.webp";
  static const icTypeContractUnSelected = "${_pIcons}ic_type_contract_un_selected.webp";
  static const icTypeContractSelected = "${_pIcons}ic_type_contract_selected.webp";
  static const icTypeFreelancerSelected = "${_pIcons}ic_type_freelancer_selected.webp";
  static const icSearch = "${_pIcons}ic_search.webp";
  static const icProfile = "${_pIcons}ic_profile.webp";
  static const icNotification = "${_pIcons}ic_notification.webp";
  static const icFilter = "${_pIcons}ic_filter.webp";
  static const icChat = "${_pIcons}ic_chat.webp";
  static const icHome = "${_pIcons}ic_home.webp";
  static const icApplication = "${_pIcons}ic_application.webp";
  static const icBookmark = "${_pIcons}ic_bookmark.webp";
  static const icBookmarkAdd = "${_pIcons}ic_bookmark_add.webp";
  static const icBookmarkUnsaved = "${_pIcons}ic_bookmark_unsaved.webp";
  static const icAvatarKickstarter = "${_pIcons}ic_avatar_kickstarter.webp";
  static const icAvatarMeetup = "${_pIcons}ic_avatar_meetup.webp";
  static const icAvatarTwitch = "${_pIcons}ic_avatar_twitch.webp";
  static const icAvatarVkontakte = "${_pIcons}ic_avatar_vkontakte.webp";
  static const icAvatarXing = "${_pIcons}ic_avatar_xing.webp";
  static const icAvatarAcademia = "${_pIcons}ic_avatar_academia.webp";
  static const icWebsite = "${_pIcons}ic_website.webp";
  static const icWallet = "${_pIcons}ic_wallet.webp";
  static const icPerson = "${_pIcons}ic_persons.webp";
  static const icDate = "${_pIcons}ic_date.webp";
  static const icFilledLocation = "${_pIcons}ic_filled_location.webp";
  static const icUpload = "${_pIcons}ic_upload.webp";
  static const icExperience = "${_pIcons}ic_experience.webp";
  static const icDocument = "${_pIcons}ic_document.webp";
  static const icSwap = "${_pIcons}ic_swap.webp";
  static const icTrophy = "${_pIcons}ic_trophy.webp";
  static const icHistory = "${_pIcons}ic_history.webp";
  static const icCategory = "${_pIcons}ic_category.webp";
  static const icClose = "${_pIcons}ic_close.webp";
  static const icDownArrow = "${_pIcons}ic_down_arrow.webp";
  static const icAttachment = "${_pIcons}ic_attachment.webp";
  static const icFilledCall = "${_pIcons}ic_filled_call.webp";
  static const icEndCall = "${_pIcons}ic_end_call.webp";
  static const icSwapCamera = "${_pIcons}ic_swap_camera.webp";
  static const icVideoCall = "${_pIcons}ic_video_call.webp";
  static const icRecording = "${_pIcons}ic_recording.webp";
  static const icVoiceRecording = "${_pIcons}ic_voice_recording.webp";
  static const icPdf = "${_pIcons}ic_pdf.webp";
  static const icSend = "${_pIcons}ic_send.webp";
  static const icEmoji = "${_pIcons}ic_emoji.webp";
  static const icDoubleCheck = "${_pIcons}ic_double_check.webp";
  static const icCheck = "${_pIcons}ic_check.webp";
  static const icCV = "${_pIcons}ic_cv.webp";
  static const icFilledDelete = "${_pIcons}ic_filled_delete.webp";
  static const icAboutUs = "${_pIcons}ic_about_us.webp";
  static const icWorkExperience = "${_pIcons}ic_work_experience.webp";
  static const icAboutMe = "${_pIcons}ic_about_me.webp";
  static const icAdd = "${_pIcons}ic_add.webp";
  static const icDelete = "${_pIcons}ic_delete.webp";
  static const icUpdate = "${_pIcons}ic_update.webp";
  static const icEducationQualification = "${_pIcons}ic_education_qualification.webp";
  static const icLanguages = "${_pIcons}ic_languages.webp";
  static const icFilledPassword = "${_pIcons}ic_filled_password.webp";
  static const icStatus = "${_pIcons}ic_status.webp";
  static const icLogout = "${_pIcons}ic_logout.webp";
  static const icTermsAndConditions = "${_pIcons}ic_terms_conditions.webp";
  static const icFilledNotification = "${_pIcons}ic_filled_notification.webp";
  static const icPrivacyPolicy = "${_pIcons}ic_privacy_policy.webp";
  static const icMode = "${_pIcons}ic_mode.webp";
  static const icTechnicalSkills = "${_pIcons}ic_technical_skills.webp";
  static const icRightArrow = "${_pIcons}ic_right_arrow.webp";
  static const icEditPencil = "${_pIcons}ic_edit_pencil.webp";
  static const icEditSquare = "${_pIcons}ic_edit_square.webp";
  static const icCloseSquare = "${_pIcons}ic_close_square.webp";
  static const icUniversity = "${_pIcons}ic_university.webp";
  static const icFilledDocument = "${_pIcons}ic_filled_document.webp";
  static const icScreen = "${_pIcons}ic_screen.webp";
  static const icWhiteLocation = "${_pIcons}ic_white_location.webp";
  static const icTypePartTimeSelected = "${_pIcons}ic_type_part_selected.webp";
  static const icTypePartTimeUnSelected = "${_pIcons}ic_type_part_unselected.webp";
}
