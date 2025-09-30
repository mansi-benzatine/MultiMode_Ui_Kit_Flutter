import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get txtAppName;

  String get txtLoreamIpsum;

  String get txtLoreamIpsumDescription;

  String get txtSkip;

  String get txtWhatIsYourGender;

  String get txtWhatIsYourCurrentWeight;

  String get txtWhatIsYourCurrentHeight;

  String get txtWhatIsYourGoal;

  String get txtWhatIsYourDOB;

  String get txtWhatIsYourLanguage;

  String get txtSetReminder;

  String get txtMale;

  String get txtFemale;

  String get txtHome;

  String get txtHour;

  String get txtMin;

  String get txtKm;

  String get txtKcal;

  String get txtDistance;

  String get txtTime;

  String get txtCalories;

  String get txtMedal;

  String get txtML;

  String get txtTotalSteps;

  String get txtTotalCalories;

  String get txtTotalDistance;

  String get txtTotalTimes;

  String get txtTotalSleep;

  String get txtTotalAchievements;

  String get txtTotalWater;

  String get txtSteps;

  String get txtStep;

  String get txtGoal;

  String get txtHistory;

  String get txtNoDataFound;

  String get txtDeleteHistory;

  String get txtAreYouSureToDeleteYourHistory;

  String get txtCancel;

  String get txtDelete;

  String get txtGetAccessToAllCourcesAndFeatures;

  String get txtChooseASubscriptionPlanToUnlockAllTheFunctionalityOfTheApplication;

  String get txtUnlockOver15Cources;

  String get txtUnlockOver120LearningChats;

  String get txtSaveUpTo1000Wards;

  String get txtSelectYourSubcription;

  String get txtMonths;

  String get txtPerMonth;

  String get txtContinue;

  String get txtProfile;

  String get txtStepTrackerAndAchievement;

  String get txtAchievements;

  String get txtAccountSettings;

  String get txtBackupAndRestore;

  String get txtGoogleFit;

  String get txtWaterTracker;

  String get txtDarkMode;

  String get txtTermsAndSupport;

  String get txtInstruction;

  String get txtFeedback;

  String get txtRemoveAds;

  String get txtPrivacyPolicy;

  String get txtSetting;

  String get txtPersonalInformation;

  String get txtGender;

  String get txtWeight;

  String get txtHeight;

  String get txtBirthday;

  String get txtLanguage;

  String get txtSetGoal;

  String get txtSensitivity;

  String get txtStepLength;

  String get txtUnit;

  String get txtFirstDayOfWeek;

  String get txtReminder;

  String get txtGetInBed;

  String get txtWakeUp;

  String get txtBedTimeSchedule;

  String get txtMetricImperialUnit;

  String get txtDistanceAndSpeedCalculationNeedIt;

  String get txtHighSensitivityMeansSmallMovementsWillBeCountedAsSteps;

  String get txtCaloriesCalculationNeedsIt;

  String get txtStepGoal;

  String get txtEverydays;

  String get txtSave;

  String get txtFeetAndInches;

  String get txtCentimeters;

  String get txtKeepMovingEachDayToMeetYourStepsGoalAndAvoidSedentaryTime;

  String get txtLow;

  String get txtMedium;

  String get txtHeigh;

  String get txtYourStepLengthIsAbout04YourHeight;

  String get txtAutomaticallyCalculateBasedOnYourHeight;

  String get txtDailyReminder;

  String get txtRepeat;

  String get txtReport;

  String get txtDay;

  String get txtWeek;

  String get txtMonth;

  String get txtSeeAllRecords;

  String get txtSorryNoDataFound;

  String get txtActiveTime;

  String get txtKilometer;

  String get txtSleepTracker;

  String get txtDashHoursMinutes;

  String get txtDailyTarget;

  String get txtRecordYourSleepMsg;

  String get txtRecordManually;

  String get txtSetTarget;

  String get txtBedTime;

  String get txtSetTime;

  String get txtBedTimeCannotBeSameAsWakeUpTime;

  String get txtGlassIs250Ml;   

  String get txtGoodHealthStartsWithStayingHydrated;

  String get txtDailySteps;

  String get txtTotalDays;


}
