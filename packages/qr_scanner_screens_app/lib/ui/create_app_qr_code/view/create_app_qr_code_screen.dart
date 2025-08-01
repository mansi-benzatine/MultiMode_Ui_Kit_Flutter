import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:qr_scanner_screens_app_package/localization/language/languages.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../qr_code_result/view/qr_code_result_screen.dart';

class CreateAppQrCodeScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateAppQrCodeScreen());
  }

  const CreateAppQrCodeScreen({super.key});

  @override
  State<CreateAppQrCodeScreen> createState() => _CreateAppQrCodeScreenState();
}

class _CreateAppQrCodeScreenState extends State<CreateAppQrCodeScreen>
    implements TopBarClickListener {
  List<Map<String, dynamic>> appList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appList.clear();
      appList.add({
        'name': Languages.of(context).txtEdgeBrowser,
        'icon': AppAssets.icEdge,
      });
      appList.add({
        'name': Languages.of(context).txtMicrosoftOffice,
        'icon': AppAssets.icExcel,
      });
      appList.add({
        'name': Languages.of(context).txtMicrosoftSharePoint,
        'icon': AppAssets.icSharePoint,
      });
      appList.add({
        'name': Languages.of(context).txtMicrosoftOutlook,
        'icon': AppAssets.icOutlook,
      });
      appList.add({
        'name': Languages.of(context).txtGoogleMeet,
        'icon': AppAssets.icGoogleMeet,
      });
      appList.add({
        'name': Languages.of(context).txtMicrosoftTeams,
        'icon': AppAssets.icTeams,
      });
      appList.add({
        'name': Languages.of(context).txtInstagram,
        'icon': AppAssets.icInstagram,
      });
      appList.add({
        'name': Languages.of(context).txtWhatsApp,
        'icon': AppAssets.icWhatsApp,
      });
      appList.add({
        'name': Languages.of(context).txtFacebook,
        'icon': AppAssets.icFacebook,
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
                title: Languages.of(context).txtCreateAppQrCode,
                isShowBack: true),
            Expanded(
              child: ListView.builder(
                itemCount: appList.length,
                padding: EdgeInsets.symmetric(
                    horizontal: 16.setWidth, vertical: 16.setHeight),
                itemBuilder: (context, index) {
                  return IgnorePointer(
                    ignoring: true,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QrCodeResultScreen(
                                    qrType: appList[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgScreen,
                          borderRadius: BorderRadius.circular(15.setHeight),
                          border: Border.all(
                              color:
                                  CustomAppColor.of(context).containerBorder),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.setWidth, vertical: 12.setHeight),
                        margin: EdgeInsets.only(bottom: 16.setHeight),
                        child: Row(
                          children: [
                            Image.asset(
                              appList[index]['icon'],
                              height: 42.setHeight,
                              width: 42.setHeight,
                            ),
                            SizedBox(width: 10.setWidth),
                            CommonText(
                              text: appList[index]['name'],
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            const Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                size: 16.setFontSize,
                                color: CustomAppColor.of(context).primary),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
