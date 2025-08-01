import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../interfaces/top_bar_click_listener.dart';
import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/text/common_text.dart';
import '../../widgets/top_bar/topbar.dart';
import '../create_barcode/view/create_barcode_screen.dart';

class BarcodeOtherCodeScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const BarcodeOtherCodeScreen());
  }

  const BarcodeOtherCodeScreen({super.key});

  @override
  State<BarcodeOtherCodeScreen> createState() => _BarcodeOtherCodeScreenState();
}

class _BarcodeOtherCodeScreenState extends State<BarcodeOtherCodeScreen>
    implements TopBarClickListener {
  List<Map<String, dynamic>> barcodeTypeList = [];

  @override
  void initState() {
    super.initState();
    barcodeTypeList.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      barcodeTypeList.add({
        'name': Languages.of(context).txtISBN,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolISBN,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtEAN8,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolEAN8,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtEAN13,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolEAN13,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtUPCA,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolUPCA,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtUPCE,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolUPCE,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtCODE39,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolCODE39,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtCODE93,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolCODE93,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtCODE128,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolCODE128,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtITF,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolITF,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtPDF417,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolPDF417,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtCODEBAR,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolCODEBAR,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtDATAMATRIX,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolDATAMATRIX,
      });
      barcodeTypeList.add({
        'name': Languages.of(context).txtAZTEC,
        'icon': AppAssets.icBarcodeOtherCode,
        'type': Constant.toolAZTEC,
      });

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
            TopBar(this,
                title: Languages.of(context).txtBarcodes2DCode,
                isShowBack: true),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.setWidth,
                    mainAxisSpacing: 20.setHeight,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: barcodeTypeList.length,
                  itemBuilder: (context, index) {
                    return _buildBarcodeTypeCard(barcodeTypeList[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarcodeTypeCard(Map<String, dynamic> barcodeType) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () {
          // Handle QR type selection
          _onBarcodeTypeSelected(barcodeType);
        },
        child: Container(
          height: 105.setHeight,
          width: 105.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: BorderRadius.circular(12.setHeight),
            border:
                Border.all(color: CustomAppColor.of(context).containerBorder),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Container
              Center(
                child: Image.asset(
                  barcodeType['icon'],
                  width: 48.setWidth,
                  height: 40.setWidth,
                ),
              ),
              SizedBox(height: 12.setHeight),
              // Label
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                child: CommonText(
                  text: barcodeType['name'],
                  fontSize: 12.setHeight,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtDarkGray,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBarcodeTypeSelected(Map<String, dynamic> barcodeType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CreateBarcodeScreen(barcodeType: barcodeType)));
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
