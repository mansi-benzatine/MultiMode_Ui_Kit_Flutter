import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_assets.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_rider_screens_app_package/widgets/text_field/text_form_field.dart';

class GiftCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const GiftCardScreen());
  }

  const GiftCardScreen({super.key});

  @override
  State<GiftCardScreen> createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> {
  final TextEditingController inviteCodeController = TextEditingController(text: "Y045KG");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppAssets.imgBgGift,
                    height: 555.setHeight,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 45.setHeight,
                    left: 5.setWidth,
                    right: 35.setWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.keyboard_backspace_outlined,
                              color: CustomAppColor.of(context).white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CommonText(
                            text: Languages.of(context).txtInviteFriends,
                            fontWeight: FontWeight.w500,
                            fontSize: 22.setFontSize,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0.setWidth,
                    left: 0.setWidth,
                    bottom: 30.setHeight,
                    child: Column(
                      children: [
                        CommonText(
                          text: Languages.of(context).txtInviteFriendsGet3CouponsEach,
                          fontSize: 24.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).white,
                        ),
                        SizedBox(height: 4.setHeight),
                        CommonText(
                          text: Languages.of(context).txtWhenYourFriendSignUpWithYourReferralCodeYoullBothGet3Coupons,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                child: CommonTextFormFieldWithSuffix(
                  suffixIcon: AppAssets.icShare,
                  titleText: Languages.of(context).txtShareYourInviteCode,
                  controller: inviteCodeController,
                  hintText: "",
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 30.setHeight),
                  child: CommonButton(
                    text: Languages.of(context).txtInviteFriends,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
