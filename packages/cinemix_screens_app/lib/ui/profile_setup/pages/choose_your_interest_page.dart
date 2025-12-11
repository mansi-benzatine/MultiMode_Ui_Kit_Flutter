import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../datamodel/profile_setup_data.dart';

class ChooseInterestScreen extends StatefulWidget {
  static Route<void> route() => MaterialPageRoute(builder: (_) => const ChooseInterestScreen());

  const ChooseInterestScreen({super.key});

  @override
  State<ChooseInterestScreen> createState() => _ChooseInterestScreenState();
}

class _ChooseInterestScreenState extends State<ChooseInterestScreen> {
  late List<InterestModel> interests;

  @override
  void initState() {
    super.initState();
    interests = [
      InterestModel(title: "Action", image: AppAssets.imgInterest1),
      InterestModel(title: "Comedy", image: AppAssets.imgInterest2),
      InterestModel(title: "Drama", image: AppAssets.imgInterest3),
      InterestModel(title: "Horror", image: AppAssets.imgInterest4),
      InterestModel(title: "Adventure", image: AppAssets.imgInterest5),
      InterestModel(title: "Thriller", image: AppAssets.imgInterest6),
      InterestModel(title: "Romance", image: AppAssets.imgInterest7),
      InterestModel(title: "Science", image: AppAssets.imgInterest8),
      InterestModel(title: "Crime", image: AppAssets.imgInterest2),
      InterestModel(title: "History", image: AppAssets.imgInterest6),
      InterestModel(title: "Anime", image: AppAssets.imgInterest1),
      InterestModel(title: "Biopic", image: AppAssets.imgInterest4),
      InterestModel(title: "Sports", image: AppAssets.imgInterest5),
      InterestModel(title: "Television", image: AppAssets.imgInterest1),
    ];
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtChooseYourInterestDesc,
            textColor: CustomAppColor.of(context).txtGray,
            fontSize: 14.setFontSize,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20.setHeight),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10.setWidth,
                runSpacing: 12.setHeight,
                children: interests.map((item) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item.isSelected = !item.isSelected;
                      });
                    },
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 28,
                      height: 78.setHeight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              color: item.isSelected ? Colors.black.withValues(alpha: 0.2) : Colors.black.withValues(alpha: 0.5),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 3,
                                color: item.isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
                              ),
                              gradient: LinearGradient(
                                colors: item.isSelected
                                    ? [
                                        CustomAppColor.of(context).bgScreen.withValues(alpha: 0.2),
                                        CustomAppColor.of(context).bgScreen.withValues(alpha: 0.2),
                                      ]
                                    : [
                                        CustomAppColor.of(context).transparent,
                                        CustomAppColor.of(context).transparent,
                                      ],
                              ),
                            ),
                            alignment: Alignment.center,
                            child: CommonText(
                              text: item.title,
                              fontSize: 18.setFontSize,
                              fontFamily: Constant.fontFamilyClashGroteskSemiBold600,
                              textColor: item.isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
