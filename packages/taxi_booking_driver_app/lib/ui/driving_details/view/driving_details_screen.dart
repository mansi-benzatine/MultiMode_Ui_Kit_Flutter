import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_driver_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';

class DrivingDetailsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DrivingDetailsScreen());
  }

  const DrivingDetailsScreen({super.key});

  @override
  State<DrivingDetailsScreen> createState() => _DrivingDetailsScreenState();
}

class _DrivingDetailsScreenState extends State<DrivingDetailsScreen> implements TopBarClickListener {
  List<Map<String, dynamic>> instructionList = [];

  void _fillData() {
    instructionList = [
      {
        'icon': AppAssets.icTickMark,
        'title': Languages.of(context).txtPhotocopiesAndPrintoutsOfDocumentsWillBeNotAccepted,
      },
      {
        'icon': AppAssets.icTickMark,
        'title': Languages.of(context).txtThePhotoAndDetailsMustBeClearlyVisible,
      },
      {
        'icon': AppAssets.icTickMark,
        'title': Languages.of(context).txtUploadBothSidesOfDrivingLicense,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtDrivingDetails),
            Expanded(
              child: Column(
                children: [DetailsView(instructionList: instructionList), SizedBox(height: 25.setHeight), const UploadFileView()],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtSubmit,
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
}

class DetailsView extends StatelessWidget {
  final List<Map<String, dynamic>> instructionList;
  const DetailsView({super.key, required this.instructionList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Column(
        children: List.generate(
          instructionList.length,
          (index) {
            final item = instructionList[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.setHeight),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    item["icon"],
                    width: 20.setWidth,
                    height: 20.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CommonText(
                      text: item["title"],
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class UploadFileView extends StatefulWidget {
  const UploadFileView({super.key});

  @override
  State<UploadFileView> createState() => _UploadFileViewState();
}

class _UploadFileViewState extends State<UploadFileView> {
  final List<PlatformFile> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf', 'doc', 'docx'],
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.files);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
      child: Column(
        children: [
          DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [4, 4],
              strokeWidth: 1,
              radius: const Radius.circular(16),
              color: CustomAppColor.of(context).txtGray,
              borderPadding: const EdgeInsets.all(1),
            ),
            child: InkWell(
              onTap: _pickFiles,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 10.setHeight),
                decoration: BoxDecoration(color: CustomAppColor.of(context).bgScreen, borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.icUpload,
                      height: 50.setHeight,
                      width: 50.setWidth,
                    ),
                    CommonText(
                      text: Languages.of(context).txtUploadFile,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: Languages.of(context).txtSupportedFormat,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.setFontSize,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 10.setHeight)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          if (_selectedFiles.isNotEmpty)
            Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: _selectedFiles.map((file) {
                if (file.extension == 'jpg' || file.extension == 'jpeg' || file.extension == 'png') {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 100.setHeight,
                        width: 100.setWidth,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).bgPromoCode,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(file.path!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -6,
                        right: -2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedFiles.remove(file);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).btnPrimary,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.close_rounded,
                              color: CustomAppColor.of(context).white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    width: 100.setWidth,
                    height: 100.setHeight,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgPromoCode,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.insert_drive_file, color: Colors.blue),
                        Text(
                          file.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }
              }).toList(),
            ),
        ],
      ),
    );
  }
}
