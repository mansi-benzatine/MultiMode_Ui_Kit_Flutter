import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsData {
  bool isSelected;
  final String terms;

  TermsAndConditionsData({required this.terms, this.isSelected = false});
}

class TermsAndConditionPage extends StatefulWidget {
  const TermsAndConditionPage({super.key});

  @override
  State<TermsAndConditionPage> createState() => _TermsAndConditionPageState();
}

class _TermsAndConditionPageState extends State<TermsAndConditionPage> {
  List<TermsAndConditionsData> termsAndConditionList = [
    TermsAndConditionsData(terms: "I certify that, I am a national of the Country."),
    TermsAndConditionsData(terms: "I am not currently or formerly a politically exposed person or public official."),
    TermsAndConditionsData(terms: "I am not working at and do not have family members working at company."),
    TermsAndConditionsData(terms: "I have read , understood and agree to be bound by all terms, disclosures, certifications and disclaimers applicable to me, as found on the legal page of the company website.")
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.setHeight),
            CommonText(
              text: "Terms and \nConditions".toUpperCase(),
              fontSize: 26.setFontSize,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "By checking the box, you agree to our terms and conditions",
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20.setHeight),
            Wrap(
              children: termsAndConditionList.map(
                (e) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CustomAppColor.of(context).border,
                        ),
                      ),
                    ),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.setHeight),
                      visualDensity: VisualDensity.compact,
                      value: e.isSelected,
                      onChanged: (value) {
                        setState(() {
                          e.isSelected = value!;
                        });
                      },
                      activeColor: CustomAppColor.of(context).primary,
                      side: BorderSide(
                        color: CustomAppColor.of(context).txtGray,
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      title: CommonText(
                        text: e.terms,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.setFontSize,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
