import 'package:cinemix_screens_app/ui/home/datamodel/home_data.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../button/common_button.dart';

class DeleteDownloadAlertDialog extends StatefulWidget {
  final Movie movie;
  static Route<void> route({required Movie movie}) {
    return MaterialPageRoute(builder: (_) => DeleteDownloadAlertDialog(movie: movie));
  }

  const DeleteDownloadAlertDialog({super.key, required this.movie});

  @override
  State<DeleteDownloadAlertDialog> createState() => _DeleteDownloadAlertDialogState();
}

class _DeleteDownloadAlertDialogState extends State<DeleteDownloadAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgTextFormFieldShadowLight,
              CustomAppColor.of(context).bgShadowDark,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: "Delete",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 22.setFontSize,
            ),
            Divider(height: 35.setHeight),
            SizedBox(height: 2.setHeight),
            CommonText(
              text: "Are you sure you want to delete this movie download?",
              fontFamily: Constant.fontFamilyClashDisplayMedium500,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGray,
            ),
            SizedBox(height: 20.setHeight),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                widget.movie.image,
                width: 160.setWidth,
                height: 160.setHeight,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "CANCEL",
                      onTap: () {
                        Navigator.pop(context);
                      },
                      height: 40.setHeight,
                      buttonTextColor: CustomAppColor.of(context).txtBlack,
                      borderColor: CustomAppColor.of(context).txtBlack,
                      buttonColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(width: 15.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: "DELETE",
                      onTap: () {
                        Navigator.pop(context);
                      },
                      height: 40.setHeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
