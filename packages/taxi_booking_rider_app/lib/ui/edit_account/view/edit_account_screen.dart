import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_rider_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text_field/text_form_field.dart';

class EditAccountScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAccountScreen());
  }

  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> implements TopBarClickListener {
  final firstNameController = TextEditingController(text: "Brayden");
  final lastNameController = TextEditingController(text: "Jockos");
  final phoneController = TextEditingController(text: "12345 67890");
  final emailController = TextEditingController(text: "andr.tablet007@gmail.com");
  final TextEditingController _countryController = TextEditingController(text: "🇺🇸 +1");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtEditAccount),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 20.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfilePictureSection(),
                    SizedBox(height: 40.setHeight),
                    CommonTextFormField(
                      controller: firstNameController,
                      hintText: "",
                      titleText: Languages.of(context).txtFirstName,
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormField(
                      controller: lastNameController,
                      hintText: "",
                      titleText: Languages.of(context).txtLastName,
                    ),
                    SizedBox(height: 16.setHeight),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonTextFormField(
                            controller: _countryController,
                            hintText: Languages.of(context).txtCountry,
                            titleText: Languages.of(context).txtCountry,
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                useSafeArea: true,
                                onSelect: (Country country) {
                                  _countryController.text = "${country.flagEmoji} +${country.phoneCode}";
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          flex: 2,
                          child: CommonTextFormField(
                            controller: phoneController,
                            hintText: Languages.of(context).txtPhoneNumber,
                            titleText: Languages.of(context).txtPhoneNumber,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: "",
                      titleText: Languages.of(context).txtEmail,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtUpdate,
                onTap: () => Navigator.pop(context),
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

  Widget _buildProfilePictureSection() {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 120.setHeight,
            height: 120.setHeight,
            margin: EdgeInsets.only(bottom: 20.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomAppColor.of(context).secondary,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppAssets.imgDummyProfile,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                AppAssets.icEditRound,
                height: 40.setHeight,
                width: 40.setHeight,
                gaplessPlayback: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
