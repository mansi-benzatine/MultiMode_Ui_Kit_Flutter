import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stoxy_app_package/ui/click_photo/view/click_photo_screen.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/text/common_text.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';

class OnRetakeClickListener {
  void onRetakeClick() {}
}

class SelfieIdPage extends StatefulWidget {
  const SelfieIdPage({super.key, required this.onRetakeShow});

  final Function(bool) onRetakeShow;
  static OnRetakeClickListener? onRetakeClickListener;

  @override
  State<SelfieIdPage> createState() => _SelfieIdPageState();
}

class _SelfieIdPageState extends State<SelfieIdPage> implements OnRetakeClickListener {
  String? _selectedImagePath;

  @override
  void initState() {
    SelfieIdPage.onRetakeClickListener = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtUploadPhotoYourSelfie,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),

          SizedBox(height: 10.setHeight),

          _selectedImagePreview(),

          if (_selectedImagePath == null) ...[
            // Subtitle
            CommonText(
              text: Languages.of(context).txtLoremIpsumShort,
              fontSize: 13.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtDescriptionGray,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),

            SizedBox(height: 60.setHeight),

            // Camera Option
            buildUploadOption(
              context: context,
              icon: AppAssets.icCamera,
              text: Languages.of(context).txtOpenCameraClickPhoto,
              isPrimary: true,
              onTap: () {
                // Handle camera action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClickPhotoScreen(
                      isSelfie: true,
                    ),
                  ),
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      _selectedImagePath = value;
                      widget.onRetakeShow(true);
                    });
                  }
                });
              },
            ),

            SizedBox(height: 30.setHeight),

            // Or separator
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Divider(
                    color: CustomAppColor.of(context).containerBorder,
                    thickness: 1,
                    endIndent: 20.setWidth,
                  ),
                ),
                CommonText(
                  text: Languages.of(context).txtOr,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtGray,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Divider(
                    indent: 20.setWidth,
                    color: CustomAppColor.of(context).containerBorder,
                    thickness: 1,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.setHeight),

            // File Selection Option
            buildUploadOption(
              context: context,
              icon: AppAssets.icGallery,
              text: Languages.of(context).txtSelectFile,
              isPrimary: false,
              onTap: () {
                // Handle file selection
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget buildUploadOption({
    required BuildContext context,
    required String icon,
    required String text,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.setWidth,
          vertical: 48.setHeight,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16.setWidth),
          border: Border.all(
            color: isPrimary ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Image.asset(
                icon,
                width: 22.setWidth,
                height: 18.setHeight,
                color: isPrimary ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
              ),
            ),
            SizedBox(width: 12.setWidth),
            Flexible(
              flex: 6,
              child: CommonText(
                text: text,
                fontSize: 14.setFontSize,
                maxLines: 2,
                fontWeight: FontWeight.w600,
                textColor: isPrimary ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedImagePreview() {
    if (_selectedImagePath != null) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.setHeight),
        child: Column(
          children: [
            // Image preview container
            Container(
              width: double.infinity,
              height: 400.setHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.setWidth),
                color: CustomAppColor.of(context).bgCard,
                border: Border.all(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.setWidth),
                child: Image.file(
                  File(_selectedImagePath!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }

  @override
  void onRetakeClick() {
    setState(() {
      _selectedImagePath = null;
      widget.onRetakeShow(false);
    });
  }
}
