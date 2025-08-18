import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages)!;
  }

  String get txtAppName;

  String get txtWelcomeToTaxiMode;

  String get txtContinueWithMobileNumber;

  String get txtByContinuingYouAgreeToOur;

  String get txtAnd;

  String get txtPrivacyPolicy;

  String get txtTermsOfService;

  String get txtMobileNumber;

  String
      get txtPleaseEnterYourPhoneNumberWeWillSendYou4DigitCodeToVerifyYourAccount;

  String get txtCountry;

  String get txtPhoneNumber;

  String get txtOtpVerification;

  String get txtEnter4DigitCodeWeHaveSentToYourPhoneNumber;

  String get txtDidntReceiveCode;

  String get txtResendOtp;

  String get txtSeconds;

  String get txtAccountCreated;

  String
      get txtYourAccountHasBeenCreatedSuccessfullyPressContinueToStartUsingApp;

  String get txtYourProfile;

  String get txtFirstName;

  String get txtLastName;

  String get txtEnterFirstName;

  String get txtEnterLastName;

  String get txtEnterYourPhoneNumber;

  String get txtContinue;

  String get txtGoogle;

  String get txtFacebook;

  String get txtCreateNewPin;

  String get txtResendCodeIn;

  String get txtCongratulations;

  String
      get txtYourAccountHasBeenCreatedSuccessfullyPressCountinueToStartUsingApp;
  String get txtEnableLocation;
  String get txtWeNeedAccessToYourLocationToBeAbleToUseThisService;
  String get txtNotNow;
  String get txtWhereAreYouGoing;
  String get txtNewTrip;
  String get txtTapForLocation;
  String get txtWork;
  String get txtAirport;
  String get txtBusStop;
  String get txtLocation;
  String get txtCreateATrip;
  String get txtBack;
  String get txtSeatAndTime;
  String get txtChange;
  String get txtCreateTrip;
  String get txtTrip;
  String get txtNeedSeat;
  String get txtScheduleTime;
  String get txtRideGo;
  String get txtSelectCar;
  String get txtChooseATrip;
  String get txtPremium;
  String get txtRideGoAuto;
  String get txtPaymentMethod;
  String get txtSelectPayment;
  String get txtCreate;
  String get txtEditAccount;
  String get txtHome;
  String get txtYourTrips;
  String get txtWallet;
  String get txtNotifications;
  String get txtInviteFriends;
  String get txtSettings;
  String get txtLogout;
  String get txtDelete;
  String get txtInviteFriendsGet3CouponsEach;
  String get txtWhenYourFriendSignUpWithYourReferralCodeYoullBothGet3Coupons;
  String get txtShareYourInviteCode;
  String get txtSafety;
  String get txtSecurity;
  String get txtLightDarkMode;
  String get txtDeleteAccount;
  String get txtSignOut;
  String get txtConfirmationLogout;
  String get txtAreYouSureYouWantToLogout;
  String get txtAreYouSureYouWantToDeleteYourAccount;
  String get txtCancel;
  String get txtCash;
  String get txtAddPaymentOrRedeemGiftCard;
  String get txtPromotions;
  String get txtAddPromoCode;
  String get txtVouchers;
  String get txtAddVoucherCode;
  String get txtEmail;
  String get txtUpdate;
  String get txtAddPayment;
  String get txtPayViaAmazonPay;
  String get txtCreditOrDebitCard;
  String get txtPayViaPaytm;
  String get txtGiftCard;
  String get txtAddCard;
  String get txtCardNumber;
  String get txtEnterACardNumber;
  String get txtExpDate;
  String get txtCvv;
  String get txtPromoCode;
  String get txtEnterAPromoCode;
  String get txtCardHolderNumber;
  String get txtEnterAHolderCardName;
  String get txtAdd;
  String get txtVoucherCode;
  String get txtEnterAVoucherCode;
  String get txtSetLocation;
  String get txtSavedPlaces;
  String get txtTermsAndCondition;
  String get txtSetLocationOnMap;
  String get txtEnterDestinationLater;
  String get txtRequestATrip;
  String get txtBookPremium;
  String get txtAddNew;
  String get txtCancelRequest;
  String get txtCashPayment;
  String get txtPickupPoint;
  String get txtRideConfirm;
  String get txtRideConfirmed;
  String get txtConfirmBooking;
  String get txtConfirmBookingDesc;
  String get txtDone;
  String get txtPayTip;
  String get txtHowWasYourTrip;
  String get txtYourFeedbackWillHelpImproveDrivingExperience;
  String get txtAdditionalComments;
  String get txtSubmitFeedback;
  String get txtDoYouWantToAnyAdditionalTipFor;
  String get txtThankYou;
  String get txtDebitCard;
  String get txtBackToHome;
  String get txtYouHaveArrived;
  String get txtManyThanksForYourValuableFeedbackAndTip;
  String get txtEnterYourReason;
  String get txtSubmit;
  String get txtItIsSadToSeeYouCancel;
  String get txtWeWillContinueToImproveOurServiceAndSatisfyYouOnTheNextTrip;
  String get txtOtherReason;
  String get txtPleaseSelectTheReasonForCancellation;
  String get txtEnterYourEmail;
}
