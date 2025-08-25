import 'package:flutter/material.dart';

import '../../../dialogs/bottom_sheet/intrested_in_offer_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class ViewOfferScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ViewOfferScreen());
  }

  const ViewOfferScreen({super.key});

  @override
  State<ViewOfferScreen> createState() => _ViewOfferScreenState();
}

class _ViewOfferScreenState extends State<ViewOfferScreen> implements TopBarClickListener {
  final TextEditingController _nameController = TextEditingController(text: "Mona Lisa");
  final TextEditingController _phoneController = TextEditingController(text: "+1 12345 67890");
  final TextEditingController _cityController = TextEditingController(text: "New York");

  String selectedPurchaseTime = "Within 15 Days";
  String selectedSellOldCar = "No";
  String selectedFuelType = "Petrol";

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

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
              title: "Tesla Model Y",
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 20.setHeight),
                child: Column(
                  children: [
                    _buildCarImage(),
                    _buildOfferHeader(),
                    _buildOfferForm(),
                  ],
                ),
              ),
            ),
            _buildContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOfferHeader() {
    return Container(
      padding: EdgeInsets.all(20.setWidth),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtOffersOnTeslaModelY,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: Languages.of(context).txtYourDetailsAreSafeWithUs,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        ],
      ),
    );
  }

  Widget _buildCarImage() {
    return Container(
      height: 120.setHeight,
      color: CustomAppColor.of(context).bgSearchBar,
      width: 0.screenWidth,
      child: Image.asset(
        AppAssets.imgTeslaFull,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildOfferForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Field
          CommonTextFormField(
            controller: _nameController,
            hintText: Languages.of(context).txtEnterYourName,
            labelText: Languages.of(context).txtName.toUpperCase(),
            borderWidth: 0.7,
          ),
          SizedBox(height: 25.setHeight),

          // Phone Field
          CommonTextFormField(
            controller: _phoneController,
            hintText: Languages.of(context).txtEnterPhoneNumber,
            labelText: Languages.of(context).txtPhoneNumber.toUpperCase(),
            keyboardType: TextInputType.phone,
            borderWidth: 0.7,
          ),
          SizedBox(height: 25.setHeight),

          // City Field
          CommonTextFormField(
            controller: _cityController,
            hintText: Languages.of(context).txtEnterYourCity,
            labelText: Languages.of(context).txtCity.toUpperCase(),
            borderWidth: 0.7,
          ),
          SizedBox(height: 25.setHeight),

          // Purchase Timeline
          _buildSectionTitle(Languages.of(context).txtWhenDoYouIntendToBuyThisCar),
          SizedBox(height: 12.setHeight),
          _buildOptionButtons([Languages.of(context).txtWithin15Days, Languages.of(context).txtWithin30Days, Languages.of(context).txtNotDecided], selectedPurchaseTime, (value) {
            setState(() {
              selectedPurchaseTime = value;
            });
          }),
          SizedBox(height: 20.setHeight),

          // Sell Old Car
          _buildSectionTitle("Sell your old car?"),
          SizedBox(height: 12.setHeight),
          _buildOptionButtons(["Yes", "No"], selectedSellOldCar, (value) {
            setState(() {
              selectedSellOldCar = value;
            });
          }),
          SizedBox(height: 20.setHeight),

          // Fuel Type
          _buildSectionTitle("Select fuel type"),
          SizedBox(height: 12.setHeight),
          _buildOptionButtons(["Petrol", "CNG"], selectedFuelType, (value) {
            setState(() {
              selectedFuelType = value;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return CommonText(
      text: title,
      fontSize: 12.setFontSize,
      fontWeight: FontWeight.w400,
      textColor: CustomAppColor.of(context).txtGray,
    );
  }

  Widget _buildOptionButtons(List<String> options, String selectedValue, Function(String) onChanged) {
    return Wrap(
      spacing: 8.setWidth,
      runSpacing: 15.setHeight,
      children: options.map((option) {
        final isSelected = selectedValue == option;
        return GestureDetector(
          onTap: () => onChanged(option),
          child: Container(
            margin: EdgeInsets.only(right: options.last == option ? 0 : 8.setWidth),
            padding: EdgeInsets.symmetric(
              horizontal: 10.setWidth,
              vertical: 10.setHeight,
            ),
            width: 0.screenWidth * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.setWidth),
              border: Border.all(
                color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 20.setWidth,
                  height: 20.setHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
                      width: 1,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10.setWidth,
                            height: 10.setHeight,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: CustomAppColor.of(context).primaryGradient,
                            ),
                          ),
                        )
                      : null,
                ),
                SizedBox(width: 8.setWidth),
                Expanded(
                  child: CommonText(
                    text: option,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      child: CommonButton(
        text: Languages.of(context).txtContinueToViewOffers,
        onTap: () {
          // Handle continue action
          if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty && _cityController.text.isNotEmpty) {
            // Navigate to offers or show success
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.setWidth),
                  topRight: Radius.circular(16.setWidth),
                ),
              ),
              builder: (dialogContext) => const IntrestedInOfferBottomSheet(),
              isScrollControlled: true,
              backgroundColor: CustomAppColor.of(context).bgScreen,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CommonText(
                  text: Languages.of(context).txtPleaseFillAllRequiredFields,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.white,
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        width: double.infinity,
        height: 50.setHeight,
        buttonGradient: CustomAppColor.of(context).primaryGradient,
        buttonTextColor: Colors.white,
        radius: 25.setWidth,
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
