import 'package:flutter/material.dart';
import 'package:mivi_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:mivi_screens_app/ui/privacy_and_policy/view/privacy_and_policy_screen.dart';
import 'package:mivi_screens_app/ui/terms_and_condition/view/terms_and_condition_screen.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';
import 'package:mivi_screens_app/widgets/top_bar/topbar.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/utils.dart';
import '../../../widgets/bottom_sheet/share_bottom_sheet.dart';

class AboutMiviScreen extends StatefulWidget {
  final bool isShowShareBs;
  static Route<void> route({bool isShowShareBs = false}) {
    return MaterialPageRoute(
        builder: (_) => AboutMiviScreen(
              isShowShareBs: isShowShareBs,
            ));
  }

  const AboutMiviScreen({super.key, this.isShowShareBs = false});

  @override
  State<AboutMiviScreen> createState() => _AboutMiviScreenState();
}

class _AboutMiviScreenState extends State<AboutMiviScreen> implements TopBarClickListener {
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowShareBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          backgroundColor: const Color(0xFF0E0F14),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (context) {
            return ShareBottomSheet();
          },
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtSecurity,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CustomAppColor.of(context).selectedTabBar,
                    ),
                    child: Image.asset(
                      AppAssets.icAppIcon,
                      height: 42.setHeight,
                      width: 48.setWidth,
                    ),
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: "2.4.5",
                    fontSize: 10.setFontSize,
                  ),
                  SizedBox(height: 35.setHeight),
                  _buildSwitchRow(
                    title: Languages.of(context).txtShare,
                    onTap: () {
                      Utils.showBottomSheetDialog(context, widgets: const ShareBottomSheet());
                    },
                  ),
                  const Divider(height: 1, thickness: 1),
                  _buildSwitchRow(
                    title: Languages.of(context).txtPrivacyPolicy,
                    onTap: () {
                      Navigator.push(context, PrivacyPolicyScreen.route());
                    },
                  ),
                  const Divider(height: 1, thickness: 1),
                  _buildSwitchRow(
                    title: Languages.of(context).txtHelpCenter,
                    onTap: () {
                      Navigator.push(context, HelpCenterScreen.route());
                    },
                  ),
                  const Divider(height: 1, thickness: 1),
                  _buildSwitchRow(
                    title: Languages.of(context).txtTermsOfService,
                    onTap: () {
                      Navigator.push(context, TermsAndConditionScreen.route());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchRow({required String title, required Function() onTap}) {
    return IgnorePointer(
      ignoring: true,
      child: ListTile(
          dense: true,
          onTap: onTap,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.setHeight, vertical: 3.setHeight),
          title: CommonText(
            text: title,
            fontSize: 14.setFontSize,
            textAlign: TextAlign.start,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          trailing: const Icon(Icons.chevron_right)),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
