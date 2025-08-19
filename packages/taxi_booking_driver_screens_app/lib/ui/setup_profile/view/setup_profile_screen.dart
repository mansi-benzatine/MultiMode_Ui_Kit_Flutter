import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/ui/required_documents/view/required_documents_screen.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const SetupProfileScreen());
  }

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> implements TopBarClickListener {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtYourProfile,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 30.setHeight),
                    _buildProfilePictureSection(),
                    SizedBox(height: 35.setHeight),
                    _buildFormFields(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 18.setHeight),
              child: _buildContinueButton(),
            ),
          ],
        ),
      ),
    );
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
                AppAssets.imgDummyDriverProfile,
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

  Widget _buildFormFields() {
    return Column(
      children: [
        CommonTextFormField(
          controller: _firstNameController,
          hintText: Languages.of(context).txtEnterFirstName,
          titleText: Languages.of(context).txtFirstName,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 25.setHeight),
        CommonTextFormField(
          controller: _lastNameController,
          hintText: Languages.of(context).txtEnterLastName,
          titleText: Languages.of(context).txtLastName,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 25.setHeight),
        CommonTextFormField(
          controller: _phoneNumberController,
          hintText: Languages.of(context).txtEnterYourEmail,
          titleText: Languages.of(context).txtEmail,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return IgnorePointer(
      ignoring: true,
      child: CommonButton(
        text: Languages.of(context).txtContinue,
        onTap: () => Navigator.push(context, RequiredDocumentsScreen.route()),
        mLeft: 0,
        mRight: 0,
        mTop: 0,
        mBottom: 0,
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    switch (name) {
      case Constant.strBack:
        Navigator.pop(context);
        break;
    }
  }
}
