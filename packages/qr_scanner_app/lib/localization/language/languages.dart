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

  String get txtGetStarted;

  String get txtNext;

  String get txtSkip;

  String get txtGenerateQr;

  String get txtScan;

  String get txtPlaceQrCodeInsideTheFrame;

  String get txtItWillBeScannedAutomatically;

  String get txtInitializingCamera;

  String get txtRequestingCameraPermission;

  String get txtPutTheQrOrBarcodeInsideRectangleBoxToScan;

  String get txtContentFromClipboard;

  String get txtWebsite;

  String get txtText;

  String get txtContact;

  String get txtEmail;

  String get txtSms;

  String get txtLocation;

  String get txtCall;

  String get txtEvent;

  String get txtWifi;

  String get txtBarcodes2DCode;

  String get txtApp;

  String get txtCreateQrCode;

  String get txtEnterSomething;

  String get txtClipboardCreateQrCode;

  String get txtWebsiteCreateQrCode;

  String get txtTextCreateQrCode;

  String get txtContactCreateQrCode;

  String get txtEmailCreateQrCode;

  String get txtSmsCreateQrCode;

  String get txtLocationCreateQrCode;

  String get txtCallCreateQrCode;

  String get txtEventCreateQrCode;

  String get txtWifiCreateQrCode;

  String get txtAppCreateQrCode;

  String get txtBarcodeCreateQrCode;

  String get txtReset;

  String get txtGenerate;

  String get txtQrCodeResult;

  String get txtSave;

  String get txtShare;

  String get txtFavorite;

  String get txtDelete;

  String get txtHttp;

  String get txtWWW;

  String get txtCom;

  String get txtEnterContent;

  String get txtEnterFirstName;

  String get txtEnterLastName;

  String get txtEnterOrganizationName;

  String get txtEnterPhoneNumber;

  String get txtEnterEmailAddress;

  String get txtEnterStreetAddress;

  String get txtEnterCity;

  String get txtEnterCountry;

  String get txtEnterZipCode;

  String get txtEnterWebsite;

  String get txtEnterSubject;

  String get txtEnterLatitudeOfLocation;

  String get txtEnterLongitudeOfLocation;

  String get txtEnterEventTitle;

  String get txtAllDayEvent;

  String get txtEnterStartDate;

  String get txtEnterEndDate;

  String get txtEnterStartTime;

  String get txtEnterEndTime;

  String get txtEnterLocation;

  String get txtEnterNetworkNameSSID;

  String get txtEnterNetworkPassword;

  String get txtSelectSecurityType;

  String get txtWPA;

  String get txtWEP;

  String get txtNone;

  String get txtCreateAppQrCode;

  String get txtEdgeBrowser;

  String get txtMicrosoftOffice;

  String get txtMicrosoftSharePoint;

  String get txtMicrosoftOutlook;

  String get txtMicrosoftTeams;

  String get txtInstagram;

  String get txtWhatsApp;

  String get txtFacebook;

  String get txtGoogleMeet;

  String get txtISBN;

  String get txtEAN8;

  String get txtEAN13;

  String get txtUPCA;

  String get txtUPCE;

  String get txtCODE39;

  String get txtCODE93;

  String get txtCODE128;

  String get txtITF;

  String get txtPDF417;

  String get txtCODEBAR;

  String get txtDATAMATRIX;

  String get txtAZTEC;

  String get txtCreateISBNBarcode;

  String get txtCreateEAN8Barcode;

  String get txtCreateEAN13Barcode;

  String get txtCreateUPCABarcode;

  String get txtCreateUPCEBarcode;

  String get txtCreateCODE39Barcode;

  String get txtCreateCODE93Barcode;

  String get txtCreateCODE128Barcode;

  String get txtCreateITFBarcode;

  String get txtCreatePDF417Barcode;

  String get txtCreateCODEBARBarcode;

  String get txtCreateDATAMATRIXBarcode;

  String get txtCreateAZTECBarcode;

  String get txtCreateBarcode;

  String get txtPleaseType12Or13Digits;

  String get txtPleaseType8Digits;

  String get txtPleaseType13Digits;

  String get txtPleaseType12Digits;

  String get txtPleaseTypeUPCE;

  String get txtPleaseTypeUPCA;

  String get txtPleaseTypeAlphabetsAndNumbers;

  String get txtPleaseTypeAlphabetsAndNumbersOrSomeCharacters;

  String get txtPleaseTypeEvenDigits;

  String get txtPleaseTypeAlphabetsAndNumbersAndCharacters;

  String get txtPleaseTypeCodeBarDigits;

  String get txtBarcodeResult;

  String get txtHistory;

  String get txtNoHistoryFound;

  String get txtYouHaveNoHistoryMsg;

  String get txtDeleteHistory;

  String get txtDeleteThisHistoryMsg;

  String get txtOk;

  String get txtCancel;

  String get txtNoFavoriteFound;

  String get txtYouHaveNoFavoriteMsg;

  String get txtDeleteFavorite;

  String get txtDeleteThisFavoriteMsg;

  String get txtSettings;

  String get txtProVersion;

  String get txtRemoveAds;

  String get txtGeneral;

  String get txtQrCodeSettings;

  String get txtIntroduction;

  String get txtTheme;

  String get txtLight;

  String get txtDark;

  String get txtLanguageSetting;

  String get txtScanControls;

  String get txtPlaySound;

  String get txtVibrate;

  String get txtClipboardToClipboard;

  String get txtAutoWebSearch;

  String get txtCameraType;

  String get txtSupportUs;

  String get txtFeedback;

  String get txtRateUs;

  String get txtShareWithFriends;

  String get txtAboutUs;

  String get txtPrivacyPolicy;

  String get txtAppVersion;

  String get txtSubscribeToUnlockAllTheFunctionalityOfTheApplication;

  String get txtNoAds;

  String get txtCustomizeQRColors;

  String get txtCustomizeQrDesign;

  String get txtProVersionMsg;

  String get txtTermsAndConditions;

  String get txtContinueWithProVersion;

  String get txtQrCodeSetting;

  String get txtApply;

  String get txtSquare;

  String get txtRound;

  String get txtModuleShape;

  String get txtColor;

  String get txtEyeBallShape;

  String get txtPrimary;

  String get txtAccent;

  String get txtBlackWhite;

  String get txtSelectColor;

  String get txtSelectColorShade;

  String get txtLanguagesOptions;

  String get txtRearCamera;

  String get txtFrontCamera;

  String get txtFront;

  String get txtRare;

  String get txtScanQrCodeBarcode;

  String get txtLoremIpsum;

  String get txtShareToYourFriends;
}
