import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/report_datamodel.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ReportScreen(),
    );
  }

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int? selectedReasonIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IgnorePointer(
          ignoring: true,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: CustomAppColor.of(context).transparent,
        title: CommonText(
          text: Languages.of(context).report,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(18),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
              child: CommonText(
                text: Languages.of(context).selectAReason,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
              ),
            ),
            SizedBox(height: AppSizes.setHeight(16)),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: reasons(context).length,
                itemBuilder: (context, index) {
                  final reason = reasons(context)[index];
                  return RadioListTile<int>(
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
                    fillColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.selected)) {
                        return AppColor.txtPurple;
                      }
                      return AppColor.txtPurple;
                    }),
                    contentPadding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
                    title: CommonText(
                      text: reason.label,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(16),
                    ),
                    value: index,
                    groupValue: selectedReasonIndex,
                    activeColor: AppColor.btnGradiant2,
                    onChanged: (value) {
                      setState(() {
                        selectedReasonIndex = value;
                      });
                    },
                  );
                },
              ),
            ),
            _buildBottomButtons(context)
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: AppSizes.setWidth(12), right: AppSizes.setWidth(12), bottom: AppSizes.setHeight(40), top: AppSizes.setHeight(20)),
      child: Row(
        children: [
          Flexible(
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                useSimpleStyle: true,
                radius: 120,
                child: CommonText(
                  text: Languages.of(context).cancel,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(14),
                  textColor: CustomAppColor.of(context).txtPurple,
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
          SizedBox(width: AppSizes.setWidth(12)),
          Expanded(
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                radius: 1,
                child: CommonText(
                  text: Languages.of(context).submit,
                  textColor: AppColor.txtWhite,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(14),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
