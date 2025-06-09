import 'package:flutter/material.dart';

import 'language_en.dart';

abstract class Languages {
  static final fallback = LanguageEn();

  static Languages? maybeOf(BuildContext context) => Localizations.of<Languages>(context, Languages);

  static Languages of(BuildContext context) => maybeOf(context) ?? fallback;

  /// below are the App Strings
  String get txtAppName;

  String get txtFindYour;

  String get txtDreamJob;

  String get txtHere;

  String get txtWelcomeDesc;

  String get txtIntoDesc1;

  String get txtIntoDesc2;

  String get txtIntoDesc3;

  String get txtNext;

  String get txtSearch;

  String get txtYourJob;

  String get txtApplyTo;

  String get txtBestJobs;

  String get txtMakeYour;

  String get txtCareer;

  String get txtGetStarted;

  String get txtSkip;

  String get txtSelectYour;

  String get txtOptions;

  String get txtOptionsDesc;

  String get txtJobSeeker;

  String get txtJobSeekerDesc;

  String get txtCompany;

  String get txtCompanyDesc;

  String get txtContinue;

  String get txtWelcome;

  String get txtBack;

  String get txtLetsSignInApplyToJobs;

  String get txtEnterYouFullName;

  String get txtEnterYouPassword;

  String get txtRememberMe;

  String get txtForgotPassword;

  String get txtSignIn;

  String get txtOrContinueWith;

  String get txtDontHaveAnAccount;

  String get txtSignUp;

  String get txtCreateAn;

  String get txtAccount;

  String get txtLetsSignUpApplyToJobs;

  String get txtEnterYourEmail;

  String get txtEnterYouConfirmPassword;

  String get txtAlreadyHaveAnAccount;

  String get txtForgot;

  String get txtPassword;

  String get txtForgotPasswordDesc;

  String get txtSendCode;

  String get txtEnter4Digits;

  String get txtCode;

  String get txtEnter4DigitsCodeDesc;

  String get txtResetNow;

  String get txtIfYouDidntReceiveACode;

  String get txtResend;

  String get txtReset;

  String get txtResetPasswordDesc;

  String get txtUpdatePassword;

  String get txtSetUpProfile;

  String get txtEnterYourJobTitle;

  String get txtSelectYourDateOfBirth;

  String get txtMale;

  String get txtFemale;

  String get txtEnterYourMobileNumber;

  String get txtEnterYourLocation;

  String get txtWhatTypeOfJobRolesYour;

  String get txtLookingFor;

  String get txtWhatTypeOfJobRolesYourLookingForDesc;

  String get txtDesign;

  String get txtFinance;

  String get txtEducation;

  String get txtRestaurant;

  String get txtHealth;

  String get txtProgrammer;

  String get txtJobs;

  String get txtWhatTypeOfJobTypeYour;

  String get txtWhatTypeOfJobTypeYourLookingForDesc;

  String get txtFullTime;

  String get txtPartTime;

  String get txtContract;

  String get txtInternship;

  String get txtFreelance;

  String get txtConfirmNewAccount;

  String get txtConfirmNewAccountDesc;

  String get txtConfirmNow;

  String get txtYourAccountSetNow;

  String get txtYourAccountSetNowDesc;

  String get txtBackToHome;
  String get txtWelcomeBack;
  String get txtSearchAJobOrPosition;
  String get txtBrowseByCategory;
  String get txtSuggestedJobs;
  String get txtRecentJobs;
  String get txtCancel;
  String get txtApplyJob;
  String get txtEnterYourWebsiteOrPortfolio;
  String get txtUploadCVResume;
  String get txtFormatDocPdfJpgAccepted;
  String get txtUploadYourCVResumeOrAnyOtherRelevant;
  String get txtUploadLimit;
  String get txtChooseYourExperiences;
  String get txtChooseYourEducations;
  String get txtWriteYourCoverLetter;
  String get txtYouHaveAppliedJobSuccessful;
  String get txtYouHaveAppliedJobSuccessfulDesc;
  String get txtConfirmation;
  String get txtShowTrackApplication;
  String get txtFilters;
  String get txtSelectCategory;
  String get txtSelectPositionLevel;
  String get txtSelectExperienceLevel;
  String get txtChooseYourLocation;
  String get txtMinimumSalary;
  String get txtMaximumSalary;
  String get txtChooseJobTypes;
  String get txtApplyFilter;
  String get txtSelectSubCategory;
  String get txtNoResultsFound;
  String get txtTheSearchCouldNotBeFound;
  String get txtRecentSearches;
  String get txtRecentlyViewed;
  String get txtApplications;
  String get txtMessages;
  String get txtAppliedJobDetails;
  String get txtTrackApplication;
  String get txtNotifications;
  String get txtMarkAllAsRead;
  String get txtSearchNotification;
  String get txtNoNotification;
  String get txtNONotificationDesc;
  String get txtSearchMessages;
  String get txtWriteYourMessage;
  String get txtNoMessage;
  String get txtNoMessageDesc;
  String get txtNoSavedJobs;
  String get txtNoSavedJobDesc;
  String get txtProfile;
  String get txtAboutMe;
  String get txtContactInfo;
  String get txtWorkExperience;
  String get txtEducationQualification;
  String get txtTechnicalSkills;
  String get txtLanguages;
  String get txtMyResumeCv;
  String get txtSettings;
  String get txtJobSeekingStatus;
  String get txtDarkMode;
  String get txtPrivacyAndPolicy;
  String get txtTermsAndConditions;
  String get txtHelpAndSupport;
  String get txtAboutUs;
  String get txtLogout;
  String get txtLogoutDesc;
  String get txtLogoutButtonDesc;
  String get txtDeleteAccount;
  String get txtEnterOldPassword;
  String get txtEnterNewPassword;
  String get txtEnterConfirmNewPassword;
  String get txtActivelyLookingForJobs;
  String get txtActivelyLookingForJobsDesc;
  String get txtPassivelyLookingForJobs;
  String get txtPassivelyLookingForJobsDesc;
  String get txtNotLookingForJobs;
  String get txtNotLookingForJobsDesc;
  String get txtUpdateNow;
  String get txtOverallReview;
  String get txtCompanyGallery;
  String get txtRequirementAndSkills;
  String get txtResponsibility;
  String get txtJobOverview;
  String get txtCompanyOverview;
  String get txtOneStar;
  String get txtTwoStar;
  String get txtThreeStar;
  String get txtFourStar;
  String get txtFiveStar;
  String get txtEmployeeReviews;
  String get txtYourCallIsSecure;
  String get txtSavedJobs;
  String get txtAddNewLanguage;
  String get txtAddLanguage;
  String get txtReadMore;
  String get txtSeeHowYouCanFindAJob;
  String get txtAreYouSureYouWantToDeleteAccount;
  String get txtYesDeleteAccount;
  String get txtAccept;
  String get txtDecline;
  String get txtAdd;
  String get txtRemote;
  String get txtSubmit;
  String get txtUpdate;
  String get txtAddNewSkill;
  String get txtEnterYourSkill;
  String get txtEnterYourField;
  String get txtEnterUniversityName;
  String get txtEnterDuration;
  String get txtEnterWorkDuration;
  String get txtEnterCompanyName;
}
