import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/reviews/view/review_list.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class ReviewsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ReviewsScreen());
  }

  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtReview,
              isShowBack: true,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.setHeight),
                  _productReview(context),
                  const ReviewList(),
                ],
              ),
            ))
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

  _productReview(BuildContext context) {
    final ratingDistribution = {
      5: 0.75,
      4: 0.30,
      3: 0.10,
      2: 0.18,
      1: 0.01,
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: "4.5",
                    fontSize: 60.setFontSize,
                    fontFamily: Constant.fontFamilyRegular400,
                    height: 0,
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                        child: Image.asset(
                          AppAssets.icStar,
                          height: 18.setHeight,
                          width: 18.setHeight,
                          color: index == 4 ? CustomAppColor.of(context).txtGray : null,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "4,487 Review",
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyMedium500,
                  ),
                ],
              ),
              SizedBox(width: 40.setWidth),
              Expanded(
                child: Column(
                  children: ratingDistribution.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets.icStar,
                            width: 15.setHeight,
                            height: 15.setHeight,
                          ),
                          SizedBox(width: 4.setWidth),
                          CommonText(
                            text: entry.key.toString(),
                            textColor: const Color(0xffFABD3B),
                            fontFamily: Constant.fontFamilyRegular400,
                          ),
                          SizedBox(width: 8.setWidth),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: entry.value,
                              backgroundColor: CustomAppColor.of(context).borderTextFormField,
                              color: Colors.amber,
                              minHeight: 3,
                            ),
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: "${(entry.value * 100).toInt()}%",
                            fontFamily: Constant.fontFamilyRegular400,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
        ],
      ),
    );
  }
}
