import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/button/common_button.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/top_bar/topbar.dart';

class MiviProScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MiviProScreen());
  }

  const MiviProScreen({super.key});

  @override
  State<MiviProScreen> createState() => _MiviProScreenState();
}

class _MiviProScreenState extends State<MiviProScreen> implements TopBarClickListener {
  int selectedIndex = 0;

  final List<Map<String, String>> _plans = [
    {'price': '\$2.99', 'duration': '1 Month', 'trial': '7 Days Free Trial, Automatic Renewal.', 'tag': 'Most Popular'},
    {'price': '\$5.99', 'duration': '6 Month', 'trial': '7 Days Free Trial, Automatic Renewal.', 'tag': ''},
    {'price': '\$9.99', 'duration': '1 Year', 'trial': '7 Days Free Trial, Automatic Renewal.', 'tag': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgWhiteBg,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopBar(
                    this,
                    title: Languages.of(context).txtMiviPro,
                    isShowBack: true,
                    appBarColor: CustomAppColor.of(context).transparent,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.setHeight),
                          _buildFeatureRow("Unlimited Templates / Stickers / Musics / ..."),
                          _buildFeatureRow("Unlimited Projects"),
                          _buildFeatureRow("Priority To Access New Features"),
                          _buildFeatureRow("Project Share Protection"),
                          SizedBox(height: 80.setHeight),
                          ..._plans.asMap().entries.map((entry) {
                            int index = entry.key;
                            Map<String, String> plan = entry.value;
                            return _buildPlanCard(
                              index: index,
                              price: plan['price']!,
                              duration: plan['duration']!,
                              trial: plan['trial']!,
                              tag: plan['tag']!,
                            );
                          }),
                          SizedBox(height: 60.setHeight),
                          CommonButton(
                            text: Languages.of(context).txtGetPremium,
                            onTap: () => Navigator.push(context, PaymentMethodScreen.route()),
                          ),
                          SizedBox(height: 10.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtPrivacyPolicy,
                                fontSize: 11.setFontSize,
                              ),
                              CommonText(
                                text: Languages.of(context).txtTermsOfService,
                                fontSize: 11.setFontSize,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.setHeight),
      child: Row(
        children: [
          Image.asset(
            AppAssets.icCheckMark,
            height: 20.setHeight,
            width: 20.setWidth,
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: CommonText(
              text: text,
              textAlign: TextAlign.start,
              fontFamily: Constant.fontFamilyMedium500,
              fontSize: 14.setFontSize,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard({
    required int index,
    required String price,
    required String duration,
    required String trial,
    required String tag,
  }) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.setHeight),
            padding: EdgeInsets.all(16.setWidth),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).border,
                width: 1.5,
              ),
              color: CustomAppColor.of(context).transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonText(
                      text: price,
                      fontFamily: Constant.fontFamilyBold700,
                      fontSize: 20.setFontSize,
                    ),
                    SizedBox(width: 6.setWidth),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.setHeight),
                      child: CommonText(
                        text: "/ $duration",
                        fontWeight: FontWeight.w500,
                        fontSize: 10.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: trial,
                  fontSize: 12.setFontSize,
                  fontFamily: Constant.fontFamilyMedium500,
                ),
              ],
            ),
          ),
          if (tag.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 4.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: CommonText(
                  text: tag,
                  fontSize: 10.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                  textColor: CustomAppColor.of(context).black,
                ),
              ),
            ),
        ],
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
