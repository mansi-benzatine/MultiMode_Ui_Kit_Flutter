import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/ui/dashboard/view/dashboard_screen.dart';
import 'package:qr_scanner_screens_app_package/ui/introdution/introdution_screen.dart';
import 'package:qr_scanner_screens_app_package/ui/languages_options/view/languages_options_screen.dart';
import 'package:qr_scanner_screens_app_package/ui/onboarding/on_boarding_screen.dart';
import 'package:qr_scanner_screens_app_package/ui/pro_version/view/pro_version_screen.dart';
import 'package:qr_scanner_screens_app_package/ui/qr_code_setting/view/qr_code_setting_screen.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../barcode_other_code/barcode_other_code_screen.dart';
import '../../barcode_result/view/barcode_result_screen.dart';
import '../../create_app_qr_code/view/create_app_qr_code_screen.dart';
import '../../create_barcode/view/create_barcode_screen.dart';
import '../../create_qr_code/view/create_qr_code_screen.dart';
import '../../qr_code_result/view/qr_code_result_screen.dart';
import '../../splash/views/splash_screen.dart';
import '../datamodels/screens_list_data.dart';

class ScreenListScreen extends StatefulWidget {
  final String title;
  final Function()? onBack;

  const ScreenListScreen({super.key, required this.title, this.onBack});

  static Route<void> route({required String title}) {
    return MaterialPageRoute<void>(
      builder: (_) => ScreenListScreen(title: title),
    );
  }

  @override
  State<ScreenListScreen> createState() => _ScreenListScreen();
}

class _ScreenListScreen extends State<ScreenListScreen> {
  List<ScreenListDataModel> screenList = [];
  _fillData() {
    screenList = [
      ScreenListDataModel(
        title: "Splash",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, SplashScreen.route()),
      ),
      ScreenListDataModel(
        title: "Onboarding 1",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Onboarding 2",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Onboarding 3",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, OnboardingScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Scanning Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 2)),
      ),
      ScreenListDataModel(
        title: "Generate Qr screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 0)),
      ),
      ScreenListDataModel(
        title: "Create Clipboard QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtContentFromClipboard,
                'icon': AppAssets.icContentClipboard,
                'type': Constant.toolContentFromClipboard,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Clipboard Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtContentFromClipboard,
                'icon': AppAssets.icContentClipboard,
                'type': Constant.toolContentFromClipboard,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Website QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtWebsite,
                'icon': AppAssets.icWebsite,
                'type': Constant.toolWebsite,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Website Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtWebsite,
                'icon': AppAssets.icWebsite,
                'type': Constant.toolWebsite,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Text QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtText,
                'icon': AppAssets.icText,
                'type': Constant.toolText,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Text Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtText,
                'icon': AppAssets.icText,
                'type': Constant.toolText,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Contact QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtContact,
                'icon': AppAssets.icContact,
                'type': Constant.toolContact,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Contact Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtContact,
                'icon': AppAssets.icContact,
                'type': Constant.toolContact,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Email QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtEmail,
                'icon': AppAssets.icEmail,
                'type': Constant.toolEmail,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Email Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtEmail,
                'icon': AppAssets.icEmail,
                'type': Constant.toolEmail,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create SMS QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtSms,
                'icon': AppAssets.icSms,
                'type': Constant.toolSms,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - SMS Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtSms,
                'icon': AppAssets.icSms,
                'type': Constant.toolSms,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Location QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtLocation,
                'icon': AppAssets.icLocation,
                'type': Constant.toolLocation,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Location Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtLocation,
                'icon': AppAssets.icLocation,
                'type': Constant.toolLocation,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Call QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtCall,
                'icon': AppAssets.icCall,
                'type': Constant.toolCall,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Call Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtCall,
                'icon': AppAssets.icCall,
                'type': Constant.toolCall,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Event - All Day Event On QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtEvent,
                'icon': AppAssets.icEvent,
                'type': Constant.toolEvent,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Event Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtEvent,
                'icon': AppAssets.icEvent,
                'type': Constant.toolEvent,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Create Wifi QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtWifi,
                'icon': AppAssets.icWifi,
                'type': Constant.toolWifi,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - Wifi Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtWifi,
                'icon': AppAssets.icWifi,
                'type': Constant.toolWifi,
              },
            )),
      ),
      ScreenListDataModel(
        title: "App List screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, CreateAppQrCodeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create App QR Code Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateQrCodeScreen.route(
              qrType: {
                'name': Languages.of(context).txtApp,
                'icon': AppAssets.icApp,
                'type': Constant.toolApp,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Result - App Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            QrCodeResultScreen.route(
              qrType: {
                'name': Languages.of(context).txtApp,
                'icon': AppAssets.icApp,
                'type': Constant.toolApp,
              },
            )),
      ),
      ScreenListDataModel(
        title: "Barcodes & other 2D Codes Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, BarcodeOtherCodeScreen.route()),
      ),
      ScreenListDataModel(
        title: "Create ISBN Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtISBN,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolISBN,
            })),
      ),
      ScreenListDataModel(
        title: "Result - ISBN Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtISBN,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolISBN,
            })),
      ),
      ScreenListDataModel(
        title: "Create EAN 8 Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtEAN8,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolEAN8,
            })),
      ),
      ScreenListDataModel(
        title: "Result - EAN 8 Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtEAN8,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolEAN8,
            })),
      ),
      ScreenListDataModel(
        title: "Create EAN 13 Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtEAN13,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolEAN13,
            })),
      ),
      ScreenListDataModel(
        title: "Result - EAN 13 Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtEAN13,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolEAN13,
            })),
      ),
      ScreenListDataModel(
        title: "Create UPC E Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtUPCE,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolUPCE,
            })),
      ),
      ScreenListDataModel(
        title: "Result - UPC E Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtUPCE,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolUPCE,
            })),
      ),
      ScreenListDataModel(
        title: "Create UPC A Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtUPCA,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolUPCA,
            })),
      ),
      ScreenListDataModel(
        title: "Result - UPC A Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtUPCA,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolUPCA,
            })),
      ),
      ScreenListDataModel(
        title: "Create Code 39 Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODE39,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODE39,
            })),
      ),
      ScreenListDataModel(
        title: "Result - CODE 39 Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODE39,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODE39,
            })),
      ),
      ScreenListDataModel(
        title: "Create CODE 93 Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODE93,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODE93,
            })),
      ),
      ScreenListDataModel(
        title: "Result - CODE 93 Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODE93,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODE93,
            })),
      ),
      ScreenListDataModel(
        title: "Create CODE 128 Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODE128,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODE128,
            })),
      ),
      ScreenListDataModel(
        title: "Result - CODE 128 Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODE128,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODE128,
            })),
      ),
      ScreenListDataModel(
        title: "Create ITF Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtITF,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolITF,
            })),
      ),
      ScreenListDataModel(
        title: "Result - ITF Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtITF,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolITF,
            })),
      ),
      ScreenListDataModel(
        title: "Create PDF 417 Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtPDF417,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolPDF417,
            })),
      ),
      ScreenListDataModel(
        title: "Result - PDF 417 Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtPDF417,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolPDF417,
            })),
      ),
      ScreenListDataModel(
        title: "Create CODABAR Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODEBAR,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODEBAR,
            })),
      ),
      ScreenListDataModel(
        title: "Result - CODABAR Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtCODEBAR,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolCODEBAR,
            })),
      ),
      ScreenListDataModel(
        title: "Create DATAMATRIX Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtDATAMATRIX,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolDATAMATRIX,
            })),
      ),
      ScreenListDataModel(
        title: "Result - DATAMATRIX Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtDATAMATRIX,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolDATAMATRIX,
            })),
      ),
      ScreenListDataModel(
        title: "Create AZTEC Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            CreateBarcodeScreen.route(barcodeType: {
              'name': Languages.of(context).txtAZTEC,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolAZTEC,
            })),
      ),
      ScreenListDataModel(
        title: "Result - AZTEC Barcode Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(
            context,
            BarcodeResultScreen.route(barcodeType: {
              'name': Languages.of(context).txtAZTEC,
              'icon': AppAssets.icBarcodeOtherCode,
              'type': Constant.toolAZTEC,
            })),
      ),
      ScreenListDataModel(
        title: "History Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 1)),
      ),
      ScreenListDataModel(
        title: "Favourites Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 3)),
      ),
      ScreenListDataModel(
        title: "Settings Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, DashboardScreen.route(currentIndex: 4)),
      ),
      ScreenListDataModel(
        title: "Pro Version Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, ProVersionScreen.route()),
      ),
      ScreenListDataModel(
        title: "QR Code Settings Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, QrCodeSettingScreen.route()),
      ),
      ScreenListDataModel(
        title: "Languages Options Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, LanguagesOptionsScreen.route()),
      ),
      ScreenListDataModel(
        title: "Introduction Screen",
        icon: AppAssets.icScreens,
        onClick: () => Navigator.push(context, IntroductionScreen.route()),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: CustomAppColor.of(context).white,
              ),
            ),
            onPressed: () {
              widget.onBack?.call();
            },
          ),
          leadingWidth: 38.setWidth,
          title: CommonText(
            text: "Qr Scanner App",
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyMontserratSemiBold,
            textColor: CustomAppColor.of(context).white,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.setHeight),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.imgBgHomeScreenPlain),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: kToolbarHeight + 26),
              _ModeGridView(screenList: screenList),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeGridView extends StatelessWidget {
  final List<ScreenListDataModel> screenList;

  const _ModeGridView({required this.screenList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 0.screenWidth,
        margin: EdgeInsets.only(top: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).txtWhite,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: Column(
          children: [
            Container(
              height: 6.setHeight,
              width: 50.setWidth,
              margin: EdgeInsets.symmetric(vertical: 15.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).greyHandle,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            SizedBox(height: 5.setHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10.setWidth,
                      runSpacing: 10.setHeight,
                      alignment: WrapAlignment.start,
                      children: List.generate(screenList.length, (index) {
                        return _itemList(
                          context: context,
                          item: screenList[index],
                          index: index + 1,
                        );
                      }),
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemList({
    required BuildContext context,
    required ScreenListDataModel item,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        item.onClick?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 3.setHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomAppColor.of(context).listTileColorScreenList,
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(
                  context,
                ).listTileShadow.withValues(alpha: .10),
                offset: const Offset(0, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "${index.toString()}.  ",
                      fontSize: 15.setFontSize,
                      fontFamily: Constant.fontFamilyMontserratSemiBold,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Expanded(
                      child: CommonText(
                        text: item.title,
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilyMontserratSemiBold,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.setWidth),
                child: Image.asset(
                  item.icon,
                  height: 20.setHeight,
                  width: 20.setHeight,
                  gaplessPlayback: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
