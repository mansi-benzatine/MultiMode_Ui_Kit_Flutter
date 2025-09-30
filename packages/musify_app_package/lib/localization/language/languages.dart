import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  /// below are the App Strings
  String get txtAppName;

  String get txtOnBoardingTitle1;

  String get txtOnBoardingTitle2;

  String get txtOnBoardingTitle3;

  String get txtOnBoardingSubTitle1;

  String get txtOnBoardingSubTitle2;

  String get txtOnBoardingSubTitle3;

  String get txtLoremIpsum;

  String get txtLoremIpsumShort;

  String get txtLogin;

  String get txtSignUp;

  String get txtOr;

  String get txtContinueWith;

  String get txtEnterYourEmail;

  String get txtEmail;

  String get txtEnterYourPassword;

  String get txtPassword;

  String get txtForgotPassword;

  String get txtDontHaveAnAccount;

  String get txtSignUpNow;

  String get txtSignUpwithExclamation;

  String get txtEnterYourConfirmPassword;

  String get txtConfirmPassword;

  String get txtAlreadyHaveAnAccount;

  String get txtSignInNow;

  String get txtContinue;

  String get txtEnterOtp;

  String get txtVerify;

  String get txtDidntReceiveOtp;

  String get txtResendOtp;

  String get txtResetPassword;

  String get txtNewPassword;

  String get txtViewAll;

  String get txtCongratulations;

  String get txtYourAccountIsReadyToUse;

  String get txtYourProfile;

  String get txtEnterYourName;

  String get txtEnterYourAddress;

  String get txtName;

  String get txtAddress;

  String get txtEnterPhoneNumber;

  String get txtPhoneNumber;

  String get txtLanguages;

  String get txtContactUs;

  String get txtAreYouSureYouWantToLogout;

  String get txtCancel;

  String get txtLogout;

  String get txtSubmit;

  String get txtGetStarted;

  String get txtLetExploreYourFavouriteMusic;

  String get txtSignIn;

  String get txtCountry;

  String get txtDoneExclamation;

  String get txtWhoIsYourFavouriteSinger;

  String get txtChooseYourFavouriteSingers;

  String get txtNext;

  String get txtSkip;

  String get txtWhatYourDateOfBirth;

  String get txtChooseYourDateOfBirth;

  String get txtWhatsYourGender;

  String get txtChooseYourGender;

  String get txtWichYourFavLanguage;

  String get txtChooseYourLanguage;

  String get txtWichCategoryYouPrefer;

  String get txtChooseYourMusicCategory;

  String get txtHome;

  String get txtMyMusic;

  String get txtFavourite;

  String get txtProfile;

  String get txtTrendingNow;

  String get txtArtist;

  String get txtSeeAll;

  String get txtBollywoodHits;

  String get txtRecentlyPlayed;

  String get txtPopularMusic;

  String get txt90sHits;

  String get txtFavouriteLanguages;

  String get txtAlbums;

  String get txtPodcast;

  String get txtPunjabiHits;

  String get txtPopHits;

  String get txtSearch;

  String get txtViralHits;

  String get txtNotification;

  String get txtGoAdsFreeMusic;

  String get txtDownload;

  String get txtAddToYourMusic;

  String get txtLike;

  String get txtAddAnotherLibrary;

  String get txtShare;

  String get txtTodaysTop5Song;

  String get txtTrendingPodcast;

  String get txtCategory;

  String get txtPopularPodcast;

  String get txtCreateNewPlaylist;

  String get txtEnterPlaylistName;

  String get txtCreate;

  String get txtUpgradePlanToUnlockMoreFeatures;

  String get txtGetPremium;

  String get txtDarkMode;

  String get txtPrivacyPolicy;

  String get txtFaq;

  String get txtDeleteAccount;

  String get txtEditProfile;

  String get txtPaymentMethod;

  String get txtNewMusic;

  String get txtSound;

  String get txtVibrate;

  String get txtPlaylistUpdate;

  String get txtPayment;

  String get txtNewFeatures;

  String get txtSecurityAlerts;

  String get txtVisa;

  String get txtMyWallet;

  String get txtPayPal;

  String get txtGooglePay;

  String get txtApplePay;

  String get txtAddNewCard;

  String get txtCardHolderName;

  String get txtCardNumber;

  String get txtExpiryDate;

  String get txtCVV;

  String get txtEnterCardHolderName;

  String get txtEnterCardNumber;

  String get txtEnterExpiryDate;

  String get txtEnterCVV;

  String get txtPremiumPlans;

  String get txtContinueToPayment;

  String get txtConfirm;

  String get txtSearchLanguages;

  String get txtLanguage;

  String get txtSuggested;

  String get txtHowToFindMissingMusic;

  String get txtWhatIsCreditRefund;

  String get txtHowDoICanUpgradePremium;

  String get txtCanIGetADiscountAtCheckout;

  String get txtWhyCanTICanMakeAPayment;

  String get txtWhatAreFeaturesInMusify;

  String get txtHowToUseMusify;

  String get txtWhatisMusify;

  String get txtAreYouSureWantToLogout;

  String get txtAreYouSureWantToDeleteAccount;

  String get txtDelete;
}
