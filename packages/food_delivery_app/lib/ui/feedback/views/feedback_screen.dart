import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_app_package/widgets/text_field/text_form_field.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FeedbackScreen());
  }

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtReview,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    children: [
                      const ReviewItemView(),
                      SizedBox(height: 24.setHeight),
                      RatingView(
                        onChanged: (rating) {
                          debugPrint('User picked $rating stars');
                        },
                      ),
                      SizedBox(height: 24.setHeight),
                      const FeedbackView()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtSubmitYourFeedback.toUpperCase(),
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

class ReviewItemView extends StatelessWidget {
  const ReviewItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 30.setHeight),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(12),
          child: Image.asset(
            AppAssets.imgChickenSpeghetti,
            height: 100.setHeight,
            width: 100.setWidth,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 14.setHeight),
        CommonText(
          text: "The Modern Restaurant",
          fontSize: 18.setFontSize,
          fontWeight: FontWeight.w600,
        ),
        CommonText(
          text: "New York",
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
        CommonText(
          text: "Testy Burger x 2",
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtGrey,
        )
      ],
    );
  }
}

class RatingView extends StatefulWidget {
  final double iconSize;
  final void Function(int rating)? onChanged;

  const RatingView({
    super.key,
    this.iconSize = 50,
    this.onChanged,
  });

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  int _currentRating = 0;

  void _setRating(int newRating) {
    setState(() => _currentRating = newRating);
    widget.onChanged?.call(newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) {
          final starIndex = index + 1;
          final isFilled = starIndex <= _currentRating;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.setWidth),
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.iconSize / 2),
              onTap: () => _setRating(starIndex),
              child: Image.asset(
                isFilled ? AppAssets.icFilledRate : AppAssets.icRate,
                height: 38.setHeight,
                width: 38.setWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController feedbackController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextFormField(
          controller: feedbackController,
          hintText: Languages.of(context).txtEnterYourFeedback,
          titleText: Languages.of(context).txtFeedback,
          minLines: 4,
          maxLines: 4,
        ),
        SizedBox(height: 8.setHeight),
        CommonText(
          text: Languages.of(context).txtYourWordMakesFoodDeliveryABetterPlaceYouAreTheInfluence,
          textColor: CustomAppColor.of(context).txtGrey,
          fontSize: 12.setFontSize,
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}
