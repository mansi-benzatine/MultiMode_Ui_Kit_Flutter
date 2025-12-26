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

  String get txtWith;

  String get txtEnterYourEmail;

  String get txtEnterYourPassword;

  String get txtForgotPassword;

  String get txtDontHaveAnAccount;

  String get txtAlreadyHaveAnAccount;

  String get txtSignInNow;

  String get txtContinue;

  String get txtOtpVerification;

  String get txtEnterYourOtp;

  String get txtVerify;

  String get txtDidntReceiveOtp;

  String get txtResendOtp;

  String get txtResetPassword;

  String get txtCongratulations;

  String get txtYourAccountIsReadyToUse;

  String get txtYourProfile;

  String get txtEnterYourName;

  String get txtEnterPhoneNumber;

  String get txtLanguages;

  String get txtContactUs;

  String get txtCancel;

  String get txtLogout;

  String get txtSubmit;

  String get txtGetStarted;

  String get txtWelcomeTpCryptocoin;

  String get txtRealTimeTrading;

  String get txtSecureStorage;

  String get txtInstantSwap;

  String get txtRememberMe;

  String get txtCreateAccount;

  String get txtLoginToYourAccount;

  String get txtEnterYourLoginInformation;

  String get txtEnterYourPersonalInformation;

  String get txtYourGender;

  String get txtSelectCurrency;

  String get txtEnterYourLocation;

  String get txtEnterYourBirthDate;

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

  String get txtRecentActivity;

  String get txtBid;

  String get txtRecentHistory;

  String get txtAsk;

  String get txtMyAddress;

  String get txtSelectAccountToWithdraw;

  String get txtSearchCurrency;

  String get txtTime;

  String get txtAvailableBalance;

  String get txtEnterPin;

  String get txtPrice;

  String get txtQuantity;

  String get txtMarket;

  String get txtWallet;

  String get txtEnterYourSecurityPINToConfirmTheTransction;

  String get txtSearchNotFound;

  String get txtNoNotification;

  String get txtNoNotificationDesc;

  String get txtSearchNotFoundSub;

  String get txtMyWishlist;

  String get txtMyPortfolio;

  String get txtSeeAll;

  String get txtProfile;

  String get txtSearch;

  String get txtNotification;

  String get txtDarkMode;

  String get txtFaq;

  String get txtDeleteAccount;

  String get txtEditProfile;

  String get txtPaymentMethod;

  String get txtMyWallet;

  String get txtPayPal;

  String get txtAddNewCard;

  String get txtEnterCardHolderName;

  String get txtEnterCardNumber;

  String get txtEnterExpiryDate;

  String get txtEnterCVV;

  String get txtConfirm;

  String get txtSearchLanguages;

  String get txtLanguage;

  String get txtSuggested;

  String get txtAreYouSureWantToLogout;

  String get txtAreYouSureWantToDeleteAccount;

  String get txtDelete;

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

  String get txtMyTotalBalance;

  String get txtDeposit;

  String get txtTransfer;

  String get txtExchange;

  String get txtWithdraw;

  String get txtMarketMovers;

  String get txtViewMore;

  String get txtAmount;

  String get txtUpdate;

  String get txtSecurity;

  String get txtEditCard;

  String get txtHelpCenter;

  String get txtBiometricId;

  String get txtFaceID;

  String get txtTwoFactorAuthentication;

  String get txtChangePin;

  String get txtMyPortfolioGoesUp;

  String get txtMyPortfolioGoesDown;

  String get txtIBuyCryptoCoin;

  String get txtISellCryptoCoin;

  String get txtIDepositCryptoCoin;

  String get txtITransferCryptoCoin;

  String get txtIExchangeCryptoCoin;

  String get txtIWithdrawCryptoCoin;

  String get txtNewServiceUpdates;

  String get txtAppUpdates;

  String get txtNewTips;

  String get txtCardDetails;
}
