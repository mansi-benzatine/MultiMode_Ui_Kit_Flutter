import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  /// below are the App Strings
  String get txtAppName;

  String get txtAskMeAnything;

  String get txtDoRealTimeMessaging;

  String get txtSendVoiceMessaging;

  String get txtLoremIpsumDesc;

  String get txtYourProfile;

  String get txtSkip;

  String get txtWelcomeToChatAI;

  String get txtLetsStart;

  String get txtGetStarted;

  String get txtSignIn;

  String get txtEmail;

  String get txtEnterYourEmail;

  String get txtPhone;

  String get txtCreateNewPin;

  String get txtBirthDate;

  String get txtCountry;

  String get txtGender;

  String get txtEnterYourPhoneNumber;

  String get txtSelectYourGender;

  String get txtPaymentMEthod;

  String get txtMyWallet;

  String get txtGooglePay;

  String get txtPayPal;

  String get txtApplePay;

  String get txtAddNewCard;

  String get txtCardName;

  String get txtSubscriptionPlan;

  String get txtEnterYourCardName;

  String get txtCardNumber;

  String get txtEnterYourCardNumber;

  String get txtExpireCard;

  String get txtCVV;

  String get txtEnterCVV;

  String get txtAdd;

  String get txtEditProfile;

  String get txtSecurity;

  String get txtLanguage;

  String get txtRename;

  String get txtShareChat;

  String get txtClearChat;

  String get txtRecentPeople;

  String get txtAreYouSureYouWantToClearChat;

  String get txtPassword;

  String get txtEnterYourPassword;

  String get txtForgotPassword;

  String get txtKeepMeLoggedIn;

  String get txtOrSignInWith;

  String get txtYouHaveAlreadyAnAccount;

  String get txtSignInNow;

  String get txtDoNotHaveAnAccount;

  String get txtAlreadyHaveAnAccount;

  String get txtSignUp;

  String get txtName;

  String get txtEnterYourName;

  String get txtCongratulations;

  String get txtAmount;

  String get txtReviewSummary;

  String get txtTax;

  String get txtTotalAmount;

  String get txtConfirmPayment;

  String get txtUpgradePlanSuccessful;

  String get txtContinue;

  String get txtEnterOTP;

  String get txtRest;

  String get txtNewPassword;

  String get txtEnterYourNewPassword;

  String get txtConfirmNewPassword;

  String get txtEnterYourConfirmNewPassword;

  String get txtRestPassword;

  String get txtResendCodeIn;

  String get txtResend;

  String get txtChatAI;

  String get txtUpgradePlan;

  String get txtUpgradePlanDesc;

  String get txtGetPremium;

  String get txtTapToChat;

  String get txtRecentChat;

  String get txtViewAll;

  String get txtAll;

  String get txtSaved;

  String get txtEmptyChatHistory;

  String get txtEmptyChatHistoryDesc;

  String get txtCancel;

  String get txtDelete;

  String get txtAreYouSureWantToDeleteAllHistoryIncludingSaveHistory;

  String get txtHistory;

  String get txtCreateAccount;

  String get txtTools;

  String get txtWriting;

  String get txtArticles;

  String get txtAcademicWriter;

  String get txtSummarize;

  String get txtEntertainment;

  String get txtMusic;

  String get txtMovieScript;

  String get txtStoryteller;

  String get txtPoems;

  String get txtJokes;

  String get txtCode;

  String get txtWriteCode;

  String get txtExplainCode;

  String get txtBusiness;

  String get txtInterviewerAnswers;

  String get txtJobPost;

  String get txtAdvertisement;

  String get txtSocialMedia;

  String get txtLinkedin;

  String get txtInstagram;

  String get txtTelegram;

  String get txtWhatsApp;

  String get txtFacebook;

  String get txtTwitter;

  String get txtTikTok;

  String get txtPersonal;

  String get txtBirthday;

  String get txtApology;

  String get txtInvitation;

  String get txtHealth;

  String get txtRecipes;

  String get txtFoodRecipes;

  String get txtDietPlan;

  String get txtTranslator;

  String get txtProfile;

  String get txtNotification;

  String get txtHelpCenter;

  String get txtPrivacyPolicy;

  String get txtLogout;

  String get txtMonth;

  String get txtAlwaysAvailable;

  String get txtFastResponse;

  String get txtPriorityToAccessNewFeatures;

  String get txtAdvancedAnalytics;
  String get txtRememberMe;

  String get txtFaceId;

  String get txtBioMetricId;

  String get txtDeviceManagement;

  String get txtChangePin;

  String get txtAreYouSureWantToLogout;

  String get txtNewFeaturesNotification;

  String get txtSound;

  String get txtAppUpdates;

  String get txtVibrate;

  String get txtPayment;

  String get txtSecurityAlerts;

  String get txtNewTips;

  String get txtFaq;

  String get txtContactUs;

  String get txtCustomerService;

  String get txtWebsite;

  String get txtNotificationSettings;

  String get txtWhatCanIHelpWith;

  String get txtTypeMessage;

  String get txtDarkMode;
}
