import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class UpgradePlanScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const UpgradePlanScreen());
  }

  const UpgradePlanScreen({super.key});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  int selectedPlan = 0;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgPremium,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.close,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                  SizedBox(height: 70.setHeight),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.9],
                        colors: [
                          Color(0xffFFE8BD),
                          Color(0xffF29F09),
                        ],
                      ).createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      );
                    },
                    blendMode: BlendMode.srcIn,
                    child: CommonText(
                      text: Languages.of(context).txtGetPremium,
                      fontSize: 36.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: Languages.of(context).txtGetPremiumLongDesc,
                    textColor: CustomAppColor.of(context).white,
                    fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    fontSize: 14.setFontSize,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTab("Monthly", 0),
                      SizedBox(width: 30.setWidth),
                      _buildTab("Annual", 1),
                    ],
                  ),
                  SizedBox(height: 25.setHeight),
                  CommonText(
                    text: Languages.of(context).txtChooseYourPlan,
                    fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).white,
                  ),
                  SizedBox(height: 15.setHeight),
                  _planCard(
                    index: 0,
                    title: "Standard",
                    price: "\$4.99",
                    description: "7 Days Free Trial, Automatic Renewal.",
                  ),
                  SizedBox(height: 15.setHeight),
                  _planCard(
                    index: 1,
                    title: "Premium",
                    price: "\$7.99",
                    description: "7 Days Free Trial, Automatic Renewal.",
                  ),
                  SizedBox(height: 15.setHeight),
                  _featureItem("Tens Of Thousands Of Episodes And Movies"),
                  _featureItem("Watch All You Want Ads-Free"),
                  _featureItem("Download To Watch Later"),
                  SizedBox(height: 35.setHeight),
                  GestureDetector(
                    onTap: () => Navigator.push(context, PaymentMethodScreen.route()),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 13.setHeight),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.2, 0.9],
                          colors: [
                            Color(0xffFFE8BD),
                            Color(0xffF29F09),
                          ],
                        ),
                      ),
                      child: CommonText(
                        text: Languages.of(context).txtContinue,
                        textColor: Colors.black,
                        fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                        fontSize: 16.setFontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.setHeight),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final isSelected = selectedTab == index;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() => selectedTab = index);
          },
          child: isSelected
              ? ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.9],
                      colors: [
                        Color(0xffFFE8BD),
                        Color(0xffF29F09),
                      ],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    );
                  },
                  blendMode: BlendMode.srcIn,
                  child: CommonText(
                    text: text,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilyClashGroteskMedium500,
                    textColor: isSelected ? Colors.white : Colors.white70,
                  ),
                )
              : CommonText(
                  text: text,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilyClashGroteskMedium500,
                  textColor: isSelected ? Colors.white : Colors.white70,
                ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: isSelected ? 3.setHeight : 0,
          width: 25.setWidth,
          child: Icon(
            Icons.arrow_drop_up_rounded,
            color: isSelected ? Colors.amber : Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _planCard({
    required int index,
    required String title,
    required String price,
    required String description,
  }) {
    final isSelected = selectedPlan == index;

    return GestureDetector(
      onTap: () {
        setState(() => selectedPlan = index);
      },
      child: DecoratedBox(
        decoration: isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.9],
                  colors: [
                    Color(0xffFFE8BD),
                    Color(0xffF29F09),
                  ],
                ),
              )
            : const BoxDecoration(),
        child: Container(
          padding: EdgeInsets.all(14.setHeight),
          margin: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? const Color(0xffF29F09) : Colors.white.withValues(alpha: 0.15),
              width: 1.2,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.9],
              colors: [
                Color(0xff425664),
                Color(0xFF12222E),
              ],
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: title,
                      fontSize: 18.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: description,
                      fontSize: 13.setFontSize,
                      textColor: Colors.white70,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.setWidth),
              CommonText(
                text: price,
                fontSize: 26.setFontSize,
                textColor: Colors.white,
                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.setHeight),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.check,
              size: 12,
              color: CustomAppColor.of(context).black,
            ),
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: CommonText(
              text: text,
              textColor: CustomAppColor.of(context).txtGray,
              fontSize: 13.setFontSize,
              fontFamily: Constant.fontFamilyClashDisplayMedium500,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
