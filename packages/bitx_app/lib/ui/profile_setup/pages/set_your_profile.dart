import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/app_assets.dart';

class SetYourProfile extends StatefulWidget {
  const SetYourProfile({super.key});

  @override
  State<SetYourProfile> createState() => _SetYourProfileState();
}

class _SetYourProfileState extends State<SetYourProfile> {
  final TextEditingController nameController = TextEditingController(text: "Andrew Oliver");
  final TextEditingController phoneController = TextEditingController(text: "+204 87452 95091");
  final TextEditingController birthDateController = TextEditingController(text: "15/03/1995");
  final TextEditingController locationController = TextEditingController(text: "201 Washigtone Ave, Kentucky 39495");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight, left: 20.setWidth, right: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),
          CommonText(
            text: Languages.of(context).txtYourProfile.toUpperCase(),
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtLoremIpsumShort,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          SizedBox(height: 30.setHeight),
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130.setWidth,
                  height: 120.setHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).txtGray.withOpacityPercent(0.2),
                    image: const DecorationImage(
                      image: AssetImage(AppAssets.imgDummyGirl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 8.setWidth,
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomAppColor.of(context).txtWhite,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        AppAssets.icProfileEdit,
                        width: 14.setWidth,
                        height: 13.setHeight,
                        color: CustomAppColor.of(context).white,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.setHeight),
          CommonTextFormField(
            prefixIcon: AppAssets.icBottomProfile,
            controller: nameController,
            hintText: Languages.of(context).txtEnterYourName,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            prefixIcon: AppAssets.icSmallCall,
            controller: phoneController,
            hintText: Languages.of(context).txtEnterYourPhone,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            prefixIcon: AppAssets.icSmallCalendar,
            controller: birthDateController,
            hintText: Languages.of(context).txtEnterYourBirthDate,
            readOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: CustomAppColor.of(context).primary,
                        onPrimary: Colors.white,
                        onSurface: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    child: child!,
                  );
                },
              ).then((value) {
                if (value != null) {
                  setState(() {
                    birthDateController.text = DateFormat('yyyy-MM-dd').format(value);
                  });
                }
              });
            },
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            prefixIcon: AppAssets.icSmallLocation,
            controller: locationController,
            hintText: Languages.of(context).txtEnterYourLocation,
          ),
        ],
      ),
    );
  }

  Widget buildFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: label,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 8.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 12.setHeight),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.setWidth),
            border: Border.all(
              color: CustomAppColor.of(context).containerBorder,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: CustomAppColor.of(context).txtGray,
                size: 20.setWidth,
              ),
              SizedBox(width: 12.setWidth),
              Expanded(
                child: TextField(
                  controller: controller,
                  readOnly: readOnly,
                  onTap: onTap,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: CustomAppColor.of(context).txtGray,
                      fontSize: 14.setFontSize,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(
                    color: CustomAppColor.of(context).txtBlack,
                    fontSize: 14.setFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
