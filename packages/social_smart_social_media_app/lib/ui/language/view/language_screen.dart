import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/language_data.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LanguageScreen(),
    );
  }

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();

    // Get the language list and set the first language as default

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final allLanguages = languageList(context);
      if (allLanguages.isNotEmpty) {
        setState(() {
          _selectedLanguage = allLanguages.first.language;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final suggestedLanguages = languageList(context).where((item) => item.isSuggested).toList();
    final otherLanguages = languageList(context).where((item) => !item.isSuggested).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      appBar: AppBar(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
        centerTitle: false,
        titleSpacing: 0,
        title: CommonText(
          text: Languages.of(context).language,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.setWidth(24),
            vertical: AppSizes.setHeight(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: Languages.of(context).suggested,
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(18),
              ),
              SizedBox(height: AppSizes.setHeight(4)),
              buildLanguageList(suggestedLanguages),
              Divider(color: CustomAppColor.of(context).grey.withOpacityPercent(0.5)),
              SizedBox(height: AppSizes.setHeight(10)),
              CommonText(
                text: Languages.of(context).language,
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(18),
              ),
              SizedBox(height: AppSizes.setHeight(14)),
              buildLanguageList(otherLanguages),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLanguageList(List<LanguageData> languages) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final languageData = languages[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: languageData.language,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(16),
              ),
              Radio<String>(
                fillColor: WidgetStateProperty.resolveWith((states) {
                  return CustomAppColor.of(context).bgGradiant2;
                }),
                value: languageData.language,
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
