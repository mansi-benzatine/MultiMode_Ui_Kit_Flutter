import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class RateYourExperienceScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const RateYourExperienceScreen());
  }

  const RateYourExperienceScreen({super.key});

  @override
  State<RateYourExperienceScreen> createState() => _RateYourExperienceScreenState();
}

class _RateYourExperienceScreenState extends State<RateYourExperienceScreen> implements TopBarClickListener {
  final TextEditingController controller = TextEditingController();
  double _ratingDeliveryEx = 0.0;
  double _ratingFood = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtRateYourExperience,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).unselectedCard,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.only(left: 20.setWidth, top: 10.setHeight),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.imgDeliveryBoy,
                              height: 130.setHeight,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 12.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: Languages.of(context).txtHowWasYourDeliveryExperience,
                                    fontFamily: Constant.fontFamilyBold700,
                                    fontSize: 16.setFontSize,
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(height: 15.setHeight),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      5,
                                      (index) {
                                        return GestureDetector(
                                          child: Icon(
                                            _ratingDeliveryEx > index ? Icons.star_rounded : Icons.star_rounded,
                                            color: _ratingDeliveryEx > index ? const Color(0xFFFFBC09) : CustomAppColor.of(context).txtLightGrey.withValues(alpha: 0.3),
                                            size: 30,
                                          ),
                                          onTap: () {
                                            setState(
                                              () {
                                                _ratingDeliveryEx = (index + 1).toDouble();
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 35.setHeight),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: CustomAppColor.of(context).borderTextFormField,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                        child: Column(
                          children: [
                            CommonText(
                              text: Languages.of(context).txtHowWasYourDeliveryExperience,
                              fontFamily: Constant.fontFamilyBold700,
                              fontSize: 16.setFontSize,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 20.setHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                  child: Image.asset(
                                    AppAssets.imgVeggie5,
                                    width: 60.setWidth,
                                    height: 60.setHeight,
                                  ),
                                ),
                                SizedBox(width: 6.setWidth),
                                ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                  child: Image.asset(
                                    AppAssets.imgBeautyLipstick,
                                    width: 60.setWidth,
                                    height: 60.setHeight,
                                  ),
                                ),
                                SizedBox(width: 6.setWidth),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).unselectedCard,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(12),
                                    child: Image.asset(
                                      AppAssets.imgKitchen1,
                                      width: 60.setWidth,
                                      height: 60.setHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.setHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) {
                                  return IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      _ratingFood > index ? Icons.star_rounded : Icons.star_rounded,
                                      color: _ratingFood > index ? const Color(0xFFFFBC09) : CustomAppColor.of(context).txtLightGrey.withValues(alpha: 0.3),
                                      size: 45,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          _ratingFood = (index + 1).toDouble();
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 15.setHeight),
                            CommonTextFormField(
                              controller: controller,
                              hintText: Languages.of(context).txtTellUsYourExperience,
                              maxLines: 3,
                              minLines: 3,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(context).txtSubmit,
                  onTap: () => Navigator.pop(context),
                  borderColor: CustomAppColor.of(context).buttonPrimary,
                  buttonColor: CustomAppColor.of(context).buttonPrimary,
                ),
              ),
            )
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
