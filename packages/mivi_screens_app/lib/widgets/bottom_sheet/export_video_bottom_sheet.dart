import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/share/view/share_screen.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

class ExportVideoContent extends StatefulWidget {
  final BuildContext parentContext;
  final bool isShowLoader;

  const ExportVideoContent({super.key, required this.parentContext, this.isShowLoader = false});

  @override
  State<ExportVideoContent> createState() => ExportVideoContentState();
}

class ExportVideoContentState extends State<ExportVideoContent> {
  String selectedFileType = 'MP4 Video';
  int selectedSpeedIndex = 2;

  final List<String> fileTypes = ['MP4 Video', 'MOV', 'AVI'];
  final List<String> speeds = ['0.5x', '1x', '2x', '3x', '4x'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowLoader) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLoader(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CommonText(
                text: "Export Video",
                textColor: CustomAppColor.of(context).secondary,
                fontSize: 18.setFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 24.setHeight),
            CommonText(text: "File Type", textColor: CustomAppColor.of(context).white),
            SizedBox(height: 8.setHeight),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1C22),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: const Color(0xFF1B1C22),
                  value: selectedFileType,
                  isExpanded: true,
                  style: const TextStyle(color: Colors.white),
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  items: fileTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CommonText(
                        text: value,
                        textColor: CustomAppColor.of(context).white,
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedFileType = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 24.setHeight),
            CommonText(
              text: "Resolution",
              textColor: CustomAppColor.of(context).white,
            ),
            SizedBox(height: 6.setHeight),
            CommonText(
              text: "Higher Resolution: Crystal Clear Playback For Large Screen",
              textColor: CustomAppColor.of(context).txtLightGrey,
              fontSize: 12.setFontSize,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(speeds.length, (index) {
                final selected = selectedSpeedIndex == index;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedSpeedIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 4.setWidth),
                      height: 46.setHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selected ? CustomAppColor.of(context).secondary : const Color(0xFF1B1C22),
                        border: Border.all(
                          color: selected ? CustomAppColor.of(context).white : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: CommonText(
                          text: speeds[index],
                          textColor: selected ? CustomAppColor.of(context).black : CustomAppColor.of(context).white,
                          fontSize: 14,
                          fontFamily: selected ? Constant.fontFamilySemiBold600 : Constant.fontFamilyMedium500,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 30.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomAppColor.of(context).secondary,
                        foregroundColor: CustomAppColor.of(context).black,
                        padding: EdgeInsets.symmetric(vertical: 14.setWidth),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        final navigator = Navigator.of(context, rootNavigator: true);
                        navigator.pop();
                        await Future.delayed(const Duration(milliseconds: 300));
                        _showLoader(navigator.context);
                        await Future.delayed(const Duration(seconds: 2));
                        if (navigator.canPop()) {
                          navigator.pop();
                        }
                        navigator.push(ShareScreen.route());
                      },
                      child: CommonText(
                        text: "Export",
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilyBold700,
                        textColor: CustomAppColor.of(context).black,
                        fontSize: 14.setFontSize,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B1C22),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.setHeight),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: CommonText(
                        text: "Cancel",
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).white,
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
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

void _showLoader(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: CustomAppColor.of(context).secondary,
                  ),
                ),
              ),
              CommonText(
                text: "Please do not lock screen or switch to Other Apps",
                textColor: CustomAppColor.of(context).white,
                fontSize: 12.setFontSize,
              ),
              SizedBox(height: 30.setHeight)
            ],
          ),
        );
      });

  await Future.delayed(const Duration(seconds: 2));

  if (!context.mounted) return;

  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}
