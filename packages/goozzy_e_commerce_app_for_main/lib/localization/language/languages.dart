import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get toastPleaseCheckYourInternetConnection;

  String get pleaseEnterYourPhoneNumberWeWillSendYou4DigitCodeToVerifyYourAccount;

  String get forgotPassword;

  String get createNewPassword;

  String get chooseYourInterest;

  String get tellUsAboutYourSelf;

  String get whenIsYourBirthday;

  String get fillYourProfile;

  String get createNewPin;

  String get txtOnBoarding1;

  String get txtOnBoarding2;

  String get txtOnBoarding3;

  String get getStarted;

  String get next;

  String get skip;

  String get signUp;

  String get country;

  String get phoneNumber;

  String get sendOtp;
  String get otpVerification;

  String get enter4DigitCodeWeHaveSentToAt;

  String get didntReceiveTheCode;

  String get resendOtp;

  String get proceed;

  String get byContinuingYouAgreeToGoozzy;

  String get termAndConditionsAndPrivacyPolicy;

  String get accountCreated;

  String get yourAccountCreated;

  String get txtContinue;

  String get letsYouIn;

  String get continueWithGoogle;

  String get continueWithFacebook;

  String get continueWithApple;

  String get orContinueWith;

  String get signInWithPassword;

  String get dontHaveAnAccount;

  String get createYourAccount;

  String get fullName;

  String get eMail;

  String get password;

  String get confirmPassword;

  String get loginNow;
  String get registerNow;

  String get haveAnAccount;

  String get loginToYourAccount;

  String get signIn;

  String get enterYourEmailOrPhone;

  String get mobileNumber;

  String get sendCode;

  String get enterNewPassword;

  String get newPassword;

  String get confirmNewPassword;

  String get updatePassword;

  String get congratulation;

  String get yourAccountIsReady;

  String get verifyCode;

  String get resendCode;

  String get enterYourVerificationCode;

  String get home;

  String get category;

  String get orders;

  String get account;

  String get goozzy;

  String get searchHere;

  String get categories;

  String get women;

  String get men;

  String get kids;

  String get footwear;

  String get seeAll;

  String get treadingDeal;

  String get kurti;

  String get womenTop;
  String get short;

  String get gender;

  String get filter;
  String get freeDelivery;
  String get viewProduct;

  String get material;

  String get pattern;

  String get noOfComparments;

  String get multipack;

  String get size;

  String get copy;

  String get wishlist;

  String get buyNow;

  String get dispatch;

  String get mrp;

  String get trusted;

  String get knowMore;

  String get freeCashOnDelivery;

  String get sevenDaysEasyReturn;

  String get lowestPriceGuaranteed;
  String get catalogReviews;
  String get realImagesAndVideoFromReseller;
  String get excellent;
  String get veryGood;
  String get good;
  String get average;
  String get poor;
  String get helpful;
  String get bestQualityProductFromTrustedSuppliers;
  String get s;
  String get m;
  String get l;
  String get xl;
  String get xxl;
  String get free;
  String get checkDeliveryDate;
  String get enterDeliveryPinCode;
  String get enterPinCodeForEstimated;
  String get check;
  String get selectSize;
  String get productDetails;
  String get countryOfOrigin;
  String get shareNow;
  String get sortBy;
  String get mostRelevant;
  String get newArrivals;
  String get mostPopular;
  String get priceLowToHigh;
  String get priceHighToLow;
  String get ratingHighToLow;
  String get done;
  String get fabric;
  String get colors;
  String get price;
  String get rating;
  String get bottomStyle;
  String get border;
  String get printOrPattern;
  String get bottomwearFabric;
  String get ornamentation;
  String get bottomPrintOrBottomFabric;
  String get backType;
  String get clearFilter;
  String get search;
  String get popular;
  String get homeAppliances;
  String get notificationFromThisCollection;
  String get specialOffer;
  String get summerSale;
  String get download;
  String get share;
  String get viewAndUpdateYourProfile;
  String get myBankDetails;
  String get mySharedCatalogs;
  String get myPayment;
  String get referAndEarn;
  String get challenges;
  String get lotterySpins;
  String get goozzyCredits;
  String get bussinessLogo;
  String get settings;
  String get notificationSettings;
  String get rateGozzy;
  String get newFeature;
  String get signUpToContinue;
  String get codeIsSentTo;
  String get logout;
  String get areYouSureYouWantToLogout;
  String get cancel;
  String get editProfile;
  String get primary;
  String get otherInfo;
  String get addPicture;
  String get languageSpoken;
  String get occupation;
  String get aboutMe;
  String get myBusinessName;
  String get pinCode;
  String get city;
  String get state;
  String get save;
  String get dateOfBirth;
  String get maritalStatus;
  String get numberOfKids;
  String get education;
  String get monthlyIncome;
  String get addEducation;
  String get addAWorkplace;
  String get chooseTheInformationYouWantToShowOnYourSocialProfile;
  String get showMyWishlist;
  String get showSharedCatalogs;
  String get nameOfSchoolCollage;
  String get subject;
  String get endYear;
  String get profile;
  String get followers;
  String get following;
  String get johnDoe;
  String get addDetails;
  String get shareYourJourneyOnGozzyWithFollowResellers;
  String get myActivity;
  String get timeline;
  String get reviews;
  String get shared;
  String get youHaveNotPublishedAnyPosts;
  String get addPassbookOrUploadPhoto;
  String get accountNumber;
  String get confirmAccountNumber;
  String get accountHolderName;
  String get ifscCode;
  String get pleaseEnterCorrectBankDetail;
  String get followings;
  String get submit;
  String get myCatalogs;
  String get showInStockCategory;
  String get yourWishlistIsEmptyNow;
  String get youHaveNotAddedAnyProductToWishlist;
  String get toShoppingNow;
  String get itsQuiteEmptyHere;
  String get seemaLikeYouHaventShareAnyCatalog;
  String get showMeCatalogs;
  String get referEarn;
  String get referFriendsAndEarn;
  String get inviteYourFriend;
  String get firstThreeOrders;
  String get myLevel;
  String get criteriaForNextLevel;
  String get referAFriend;
  String get numberOfReferrals;
  String get youCanEarnUpTo;
  String get learnMore;
  String get frequentlyAskedQuestions;
  String get whomToRefer;
  String get referralsRequireConstantCommunication;
  String get byParticipatingInTheReferralProgram;
  String get viewAll;
  String get termsAndCondition;
  String get privacyPolicy;
  String get and;
  String get andAcknowledge;
  String get enterReferralCode;
  String get shareSettings;
  String get includeLogoInImages;
  String get includeTextAsImage;
  String get enableNotification;
  String get allCollections;
  String get saveChanges;
  String get selectAll;
  String get unselectAll;
  String get selectPaymentMethod;
  String get cashOnDelivery;
  String get paytm;
  String get walletDebitCard;
  String get online;
  String get debitCardCreditCard;
  String get priceBreakUp;
  String get productCharges;
  String get shippingCharges;
  String get codCharges;
  String get firstOrderDiscount;
  String get orderTotal;
  String get supplier;
  String get yourSafetyOurPriority;
  String get weMakeSureThatYourPackageIs;
  String get viewPriceDetails;
  String get cart;
  String get remove;
  String get qty;
  String get goozzeySafe;
  String get cashOnCollectDuringDelivery;
  String get yourMargin;
  String get marginWillBeDirectlyTransferred;
  String get paymentMethod;
  String get orderWillBeDeliveredAtThisAddress;
  String get flatHouseNo;
  String get streetColony;
  String get sameAsAboveDetails;
  String get landmark;
  String get yourDetails;
  String get yourName;
  String get saveAddressAndContinue;
  String get orderSummary;
  String get senderInformation;
  String get change;
  String get thisInfoWillBeDisplayedInThePackageSent;
  String get estimatedDeliveryBy;
  String get finalCustomerPrice;
  String get marginEarned;
  String get shippingAddress;
  String get name;
  String get addDeliveryAddress;
  String get addMargin;
  String get yourOrderIsSuccessfully;
  String get goToOrderStatus;
  String get continueShopping;
  String get orderSuccess;
  String get somethingWentWrong;
  String get sorryWeWereNotAbleToProcess;
  String get viewOrderStatus;
  String get tryAgainNow;
  String get paymentFailed;
  String get order;
  String get allOrder;
  String get pending;
  String get processing;
  String get delivered;
  String get orderConfirmed;
  String get orderCancelled;
  String get orderProcessing;
  String get orderDelivered;
  String get orderPending;
  String get orderDispatch;
  String get track;
  String get orderId;
  String get reviewNow;
  String get goToShopping;
  String get paymentMode;
  String get reasonOfCancellation;
  String get pleaseTellUsCorrectReasonOfCancellation;
  String get incorrectSizeOrdered;
  String get productNotRequiredAnymore;
  String get cashIssue;
  String get orderedByMistake;
  String get wantsToChangeStyleColorSize;
  String get delayedDeliveryCancellation;
  String get duplicateOrder;
  String get enterAdditionalCommentsHere;
  String get cancelNow;
  String get yourOrderCancelledNow;
  String get trackOrder;
  String get pleaseDontForgetToRate;
  String get orderPlaced;
  String get deliveryDate;
  String get confirmed;
  String get yourOrderWasPlaced;
  String get yourOrderIsPendingForConfirmation;
  String get yourOrderIsConfirmed;
  String get yourProductIsProcessingToDeliverYouOnTime;
  String get productDeliveredToYouAndMarkedAsDeliveredByCustomer;
  String get orderHistoryIsEmpty;
  String get addTheItemsToYourCart;
  String get all;
  String get orderInfo;
  String get offers;
  String get payment;
  String get noNotification;
  String get notification;
  String get youDontHaveAnyNotificationAtThisTime;
  String get occasion;
  String get combo;
  String get discount;
  String get reversible;
  String get fitShape;
  String get patternType;
  String get topType;
  String get brand;
  String get warrantyPeriod;
  String get bottomType;
  String get heelType;
  String get concern;
  String get typeOfSkin;
  String get shade;
  String get bottomPatternType;
  String get recentSearches;
  String get recentlyViewed;
  String get searchNotFound;
  String get searchNotFoundDesc;
  String get darkMode;
}
