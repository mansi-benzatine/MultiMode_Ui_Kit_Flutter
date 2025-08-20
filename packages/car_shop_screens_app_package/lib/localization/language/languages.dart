import 'package:flutter/material.dart';

abstract class 
Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  /// below are the App Strings
  String get txtAppName;

  String get txtOnBoardingTitle1;

  String get txtOnBoardingTitle2;

  String get txtOnBoardingTitle3;

  String get txtGetStarted;

  String get txtNext;

  String get txtSkip;

  String get txtLoremIpsum;

  String get txtLoremIpsumShort;

  String get txtLogin;

  String get txtSignUp;

  String get txtOr;

  String get txtContinueWith;

  String get txtContinueWithGoogle;

  String get txtContinueWithApple;

  String get txtContinueWithFacebook;

  String get txtDiscoverYourDreamCar;

  String get txtLoginwithExclamation;

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

  String get txtYourFavBrand;

  String get txtYourProfile;

  String get txtEnterYourName;

  String get txtEnterYourAddress;

  String get txtName;

  String get txtAddress;

  String get txtEnterPhoneNumber;

  String get txtPhoneNumber;

  String get txtCountryCode;

  String get txtCountry;

  String get txtCreateNewPin;

  String get txtAddNewPinMessage;

  String get txtHello;

  String get txtSearch;

  String get txtNewCar;

  String get txtUsedCar;

  String get txtSellCar;

  String get txtBrands;

  String get txtSeeAll;

  String get txtPopularCars;

  String get txtMostSearchedCars;

  String get txtLatestCars;

  String get txtRecentSearch;

  String get txtClearAll;

  String get txtNotification;

  String get txtAllBrands;

  String get txtOverview;

  String get txtPrice;

  String get txtColuors;

  String get txtImages;

  String get txtCompare;

  String get txt360View;

  String get txtReviews;

  String get txtFeatures;

  String get txtTotalCapacity;

  String get txtHigherSpeed;

  String get txtEngineOutput;

  String get txtDesignImages;

  String get txtSimilarCars;

  String get txtViewOffer;

  String get txtWriteReview;

  String get txtPleaseSelectRating;

  String get txtSubmit;

  String get txtShareYourExperience;

  String get txtPleaseShareYourOverallExperience;

  String get txtOffersOnTeslaModelY;

  String get txtYourDetailsAreSafeWithUs;

  String get txtEnterYourCity;

  String get txtCity;

  String get txtWhenDoYouIntendToBuyThisCar;

  String get txtWithin15Days;

  String get txtWithin30Days;

  String get txtNotDecided;

  String get txtContinueToViewOffers;

  String get txtPleaseFillAllRequiredFields;

  String get txtThanksForYourInterest;

  String get txtAAuthorisedDealerWillBeInTouchSoonToSharePersonalisedOffers;

  String get txtViewSimilarOffers;

  String get txtBackToHome;

  String get txtViewOffers;

  String get txtFilter;

  String get txtSort;

  String get txtRecentlyViewedCars;

  String get txtCarsByBudget;

  String get txtCarsNearYou;

  String get txtBudget;

  String get txtWhatIsYourRange;

  String get txtApply;

  String get txtBrand;

  String get txtModelYear;

  String get txtSortBy;

  String get txtSpecificationFeatures;

  String get txtEmiCal;

  String get txtViewSellerDetails;

  String get txtCarOverview;

  String get txtRegYear;

  String get txtInsurance;

  String get txtFuel;

  String get txtSeats;

  String get txtKmDriven;

  String get txtMakeYear;

  String get txtOwnership;

  String get txtSpareKey;

  String get txtSpecification;

  String get txtEngine;

  String get txtPower;

  String get txtMileage;

  String get txtTransmission;

  String get txtDownPayment;

  String get txtDurationInYear;

  String get txtLoanRequest;

  String get txtEmiEstimate;

  String get txtFor24MonthAt12Percent;

  String get txt500PlusCustomersAvailedTheFacility;

  String get txtViewSellerDetailsOn;

  String get txtFavourite;

  String get txtEnterCarNumber;

  String get txtCarNumber;

  String get txtEnterYourCarRegistrationNumber;

  String get txtSellMyCar;

  String get txtEnterYourCarDetailsManually;

  String get txtHowToSellYourCar;

  String get txtOnlinePriceEstimate;

  String get txtFreeCarInspection;

  String get txtCarAuctionBegins;

  String get txtPickUpCarPayment;

  String get txtCustomerReview;

  String get txtFaq;

  String get txtAbsolutelyWeConnectYouWithBuyersForFree;

  String get txtYouCanChooseTheBestOfferThatSuitsYourNeedsWeLLHelpYouCompareAllOffers;

  String get txtNoYouAreNotObligatedToAcceptAnyOfferYouHaveCompleteControlOverTheSellingProcess;

  String get txtYouCanWithdrawYourCarFromThePlatformAtAnyTimeBeforeAcceptingAnOffer;

  String get txtYesWeUseIndustryStandardSecurityMeasuresToProtectYourPersonalInformation;

  String get txtTypicallyItTakes2448HoursToReceiveOffersOnceYourCarIsListedOnOurPlatform;

  String get txtIfYourCarDoesntReceiveOffersWeLLProvideSuggestionsToImproveYourListingOrHelpYouAdjustThePrice;

  String get txtYesWeOfferSpecialDealerProgramsWithBetterRatesForFleetSalesContactOurBusinessTeamForMoreDetails;

  String get txtIsItFreeToSellMyCarInNewYork;

  String get txtWhatHappensIfIReceiveMultipleOffersForMyCar;

  String get txtAmIObligatedToAcceptAnyOffersIReceive;

  String get txtWhatIfIChangeMyMindAboutSellingMyCar;

  String get txtIsMyPersonalInformationSecureOnThePlatform;

  String get txtHowLongDoesItTakeToSellMyCar;

  String get txtWhatHappensIfMyCarDoesntSell;

  String get txtIAmADealerWithAFleetOfCarsCanIGetABetterDeal;

  String get txtSelectYourCarBrand;

  String get txtSelectYourCarRegistrationYear;

  String get txtSelectYourCarModel;

  String get txtSelectYourCarVariant;

  String get txtSelectYourCarKmsDriven;

  String get txtSelectYourCarRegistrationState;

  String get txtSearchYourState;

  String get txtAllStates;

  String get txtEnterZipCode;

  String get txtSearchYourZipCode;

  String get txtAllZipCode;

  String get txtEnterYourSellingPrice;

  String get txtRecommendedPriceRangeIsBetween20LakhTo24Lakh;

  String get txtEnterSellingPrice;

  String get txtSellingPrice;

  String get txtConfirm;

  String txtSelectedPhotos(int length);

  String get txtSelectImageSource;

  String get txtChooseFromGallery;

  String get txtChooseMultipleImages;

  String get txtTakePhoto;

  String get txtUploadPhotos;

  String get txtUploadFrontAndBackViewPhotosOfYourCar;

  String get txtUseHighResolutionCamera;

  String get txtAddPhotos;

  String get txtSupportedFormatsJPGJPEGPNPDF;

  String get txtEditDetails;

  String get txtConfirmSellCarDetailMsg;

  String get txtCarNews;

  String get txtSearchByBrand;

  String get txtTrendingNews;

  String get txtRecentNews;

  String get txtForYou;

  String get txtRelatedNews;

  String get txtMyProfile;

  String get txtEditName;

  String get txtMyVehicle;

  String get txtDarkMode;

  String get txtPrivacyPolicy;

  String get txtLanguage;

  String get txtHelpCenter;

  String get txtLogout;

  String get txtUpdate;

  String get txtEditProfile;

  String get txtText;

  String get txtSound;

  String get txtVibration;

  String get txtDiscountPromo;

  String get txtPayment;

  String get txtAppUpdate;

  String get txtCashBack;

  String get txtNewTips;

  String get txtNewService;

  String get txtSearchLanguages;

  String get txtSuggested;

  String get txtLanguages;

  String get txtContactUs;

  String get txtCustomerService;

  String get txtWhatsapp;

  String get txtWebsite;

  String get txtFacebook;

  String get txtTwitter;

  String get txtInstagram;

  String get txtAreYouSureYouWantToLogout;

  String get txtCancel;
}
