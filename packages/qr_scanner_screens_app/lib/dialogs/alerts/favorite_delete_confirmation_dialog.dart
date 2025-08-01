import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class FavoriteDeleteConfirmationDialog extends StatefulWidget {
  final BuildContext parentContext; // Add parentContext

  const FavoriteDeleteConfirmationDialog(
      {super.key, required this.parentContext});

  @override
  State<FavoriteDeleteConfirmationDialog> createState() =>
      _FavoriteDeleteConfirmationDialogState();
}

class _FavoriteDeleteConfirmationDialogState
    extends State<FavoriteDeleteConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomAppColor.of(widget.parentContext)
          .txtBlack
          .withOpacityPercent(.6),
      child: Container(
        padding: EdgeInsets.all(20.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(widget.parentContext).bgDialog,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: Languages.of(widget.parentContext)
                  .txtDeleteFavorite, // Use parentContext
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(widget.parentContext).primary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 35.setHeight),
            Image.asset(
              AppAssets.icDeleteHistoryDialog,
              width: double.infinity,
              gaplessPlayback: true,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 35.setHeight),
            CommonText(
              text: Languages.of(widget.parentContext)
                  .txtDeleteThisFavoriteMsg, // Use parentContext
              fontSize: 13.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(widget.parentContext).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.setHeight),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    text: Languages.of(widget.parentContext)
                        .txtCancel
                        .toUpperCase(), // Use parentContext
                    buttonColor:
                        CustomAppColor.of(widget.parentContext).transparent,
                    borderColor:
                        CustomAppColor.of(widget.parentContext).primary,
                    buttonFontStyle: FontStyle.normal,
                    buttonTextColor:
                        CustomAppColor.of(widget.parentContext).primary,
                    buttonTextSize: 14.setFontSize,
                    buttonTextWeight: FontWeight.w500,
                    height: 40.setHeight,
                  ),
                ),
                SizedBox(width: 16.setWidth),
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    text: Languages.of(widget.parentContext)
                        .txtOk
                        .toUpperCase(), // Use parentContext
                    buttonColor:
                        CustomAppColor.of(widget.parentContext).primary,
                    buttonTextColor:
                        CustomAppColor.of(widget.parentContext).white,
                    height: 40.setHeight,
                    buttonTextSize: 14.setFontSize,
                    buttonTextWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
