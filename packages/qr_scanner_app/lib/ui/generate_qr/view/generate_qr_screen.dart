import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/interfaces/top_bar_click_listener.dart';
import 'package:qr_scanner_app_package/localization/language/languages.dart';
import 'package:qr_scanner_app_package/utils/app_assets.dart';
import 'package:qr_scanner_app_package/utils/app_color.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_app_package/widgets/text/common_text.dart';
import 'package:qr_scanner_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';
import '../../barcode_other_code/barcode_other_code_screen.dart';
import '../../create_app_qr_code/view/create_app_qr_code_screen.dart';
import '../../create_qr_code/view/create_qr_code_screen.dart';

class GenerateQrScreen extends StatefulWidget {
  const GenerateQrScreen({super.key});

  @override
  State<GenerateQrScreen> createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> implements TopBarClickListener {
  List<Map<String, dynamic>> _qrTypes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _qrTypes = [
        {
          'name': Languages.of(context).txtContentFromClipboard,
          'icon': AppAssets.icContentClipboard,
          'type': Constant.toolContentFromClipboard,
        },
        {
          'name': Languages.of(context).txtWebsite,
          'icon': AppAssets.icWebsite,
          'type': Constant.toolWebsite,
        },
        {
          'name': Languages.of(context).txtText,
          'icon': AppAssets.icText,
          'type': Constant.toolText,
        },
        {
          'name': Languages.of(context).txtContact,
          'icon': AppAssets.icContact,
          'type': Constant.toolContact,
        },
        {
          'name': Languages.of(context).txtEmail,
          'icon': AppAssets.icEmail,
          'type': Constant.toolEmail,
        },
        {
          'name': Languages.of(context).txtSms,
          'icon': AppAssets.icSms,
          'type': Constant.toolSms,
        },
        {
          'name': Languages.of(context).txtLocation,
          'icon': AppAssets.icLocation,
          'type': Constant.toolLocation,
        },
        {
          'name': Languages.of(context).txtCall,
          'icon': AppAssets.icCall,
          'type': Constant.toolCall,
        },
        {
          'name': Languages.of(context).txtEvent,
          'icon': AppAssets.icEvent,
          'type': Constant.toolEvent,
        },
        {
          'name': Languages.of(context).txtWifi,
          'icon': AppAssets.icWifi,
          'type': Constant.toolWifi,
        },
        {
          'name': Languages.of(context).txtApp,
          'icon': AppAssets.icApp,
          'type': Constant.toolApp,
        },
        {
          'name': Languages.of(context).txtBarcodes2DCode,
          'icon': AppAssets.icBarcode,
          'type': Constant.toolBarcodes2DCode,
        },
      ];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtGenerateQr),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.setWidth),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.setWidth,
                    mainAxisSpacing: 20.setHeight,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) => _buildQrTypeCard(_qrTypes[index]),
                  itemCount: _qrTypes.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrTypeCard(Map<String, dynamic> qrType) {
    return GestureDetector(
      onTap: () {
        // Handle QR type selection
        _onQrTypeSelected(qrType);
      },
      child: Container(
        height: 110.setHeight,
        width: 105.setWidth,
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: BorderRadius.circular(12.setHeight),
          border: Border.all(color: CustomAppColor.of(context).generateQrCardBorder),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container
            Center(
              child: Image.asset(
                qrType['icon'],
                width: 50.setWidth,
                height: 50.setWidth,
              ),
            ),
            SizedBox(height: 12.setHeight),
            // Label
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
              child: CommonText(
                text: qrType['name'],
                fontSize: 12.setHeight,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQrTypeSelected(Map<String, dynamic> qrType) {
    // Handle navigation to specific QR generation screen based on type
    if (qrType['type'] == Constant.toolApp) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAppQrCodeScreen()));
    } else if (qrType['type'] == Constant.toolBarcodes2DCode) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const BarcodeOtherCodeScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQrCodeScreen(qrType: qrType)));
    }
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}
