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

  String get txtWith;

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

  String get txtEnvestingForEveryBody;

  String get txtCreateAccount;

  String get txtSignIn;

  String get txtCountry;

  String get txtSelectYourGender;

  String get txtSelectYourCountry;

  String get txtDoneExclamation;

  String get txtLocation;

  String get txtEnterYourLocation;

  String get txtBirthDate;

  String get txtEnterYourBirthDate;

  String get txtPhone;

  String get txtEnterYourPhone;

  String get txtUploadPhotoYourNationalId;

  String get txtSelectFile;

  String get txtOpenCameraClickPhoto;

  String get txtNext;

  String get txtSkip;

  String get txtPhotoIdCard;

  String get txtOpenSettings;

  String get txtUploadPhotoYourSelfie;

  String get txtRetake;

  String get txtCreateNewPin;

  String get txtSearchdot;

  String get txtRecent;

  String get txtClearAll;

  String get txtSearchNotFound;

  String get txtSearchNotFoundSub;

  String get txtMyWishlist;

  String get txtMyPortfolio;

  String get txtWhatYourDateOfBirth;

  String get txtChooseYourDateOfBirth;

  String get txtWhatsYourGender;

  String get txtSeeAll;

  String get txtChooseYourGender;

  String get txtWichYourFavLanguage;

  String get txtChooseYourLanguage;

  String get txtWichCategoryYouPrefer;

  String get txtChooseYourMusicCategory;

  String get txtHome;

  String get txtProfile;

  String get txtSearch;

  String get txtNotification;

  String get txtShare;

  String get txtCreate;

  String get txtDarkMode;

  String get txtPrivacyPolicy;

  String get txtFaq;

  String get txtDeleteAccount;

  String get txtEditProfile;

  String get txtPaymentMethod;

  String get txtPayment;

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

  String get txtAreYouSureWantToLogout;

  String get txtAreYouSureWantToDeleteAccount;

  String get txtMoreStockLikeThis;

  String get txtDelete;
  String get txtNewPassword;
  String get txtEnterNewPassword;
  String get txtConfirmNewPassword;
  String get txtSell;
  String get txtBuy;
  String get txtPreviewBuy;
  String get txtMarketPrice;
  String get txtNflxShares;
  String get txtNflxAmount;
  String get txtTradingFee;
  String get txtTotalCost;
  String get txtBuyNow;
  String get txtSellNow;
  String get txtPreviewSell;
  String get txtViewMyPortfolio;
  String get txtBackToNFLXStock;
  String get txtNews;
  String get txtTrendingNews;
  String get txtLatestNews;
  String get txtTopNews;
  String get txtTodaysNews;
  String get txtExchangeStock;
  String get txtPreviewExchange;
  String get txtMarketPriceNFLX;
  String get txtMarketPriceSpot;
  String get txtNumberOfShares;
  String get txtAmount;
  String get txtExchangeNow;
  String get txtSelectExchangeStocks;
  String get txtGender;
  String get txtUpdate;
  String get txtSecurity;
  String get txtEditCard;
  String get txtHelpCenter;
}
