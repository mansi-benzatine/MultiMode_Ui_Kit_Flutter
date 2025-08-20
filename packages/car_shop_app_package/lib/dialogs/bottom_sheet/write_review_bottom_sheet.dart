import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';
import '../../widgets/text_field/text_form_field.dart';

class WriteReviewBottomSheet extends StatefulWidget {
  const WriteReviewBottomSheet({super.key});

  @override
  State<WriteReviewBottomSheet> createState() => _WriteReviewBottomSheetState();
}

class _WriteReviewBottomSheetState extends State<WriteReviewBottomSheet> {
  int selectedRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgBottomSheet,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.setWidth),
          topRight: Radius.circular(20.setWidth),
        ),
      ),
      child: Wrap(
        children: [
          _buildHeader(),
          Flexible(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: Languages.of(context).txtShareYourExperience,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgSearchBar,
                borderRadius: BorderRadius.circular(8.setWidth),
              ),
              height: 30.setHeight,
              width: 30.setWidth,
              child: Center(
                child: Icon(
                  Icons.close,
                  size: 20.setWidth,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.setWidth, 10.setHeight, 20.setWidth, 20.setHeight),
      child: Column(
        children: [
          // Car Emoji
          SizedBox(
            height: 100.setHeight,
            width: 100.setWidth,
            child: Image.asset(
              selectedRating == 0
                  ? AppAssets.icRateEmoji0
                  : selectedRating == 1
                      ? AppAssets.icRateEmoji1
                      : selectedRating == 2
                          ? AppAssets.icRateEmoji2
                          : selectedRating == 3
                              ? AppAssets.icRateEmoji3
                              : selectedRating == 4
                                  ? AppAssets.icRateEmoji4
                                  : AppAssets.icRateEmoji5,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20.setHeight),

          // Star Rating
          _buildStarRating(),
          SizedBox(height: 20.setHeight),

          // Review Text Field
          _buildReviewTextField(),
          SizedBox(height: 20.setHeight),

          // Submit Button
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRating = index + 1;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.setWidth),
            child: Icon(
              Icons.star,
              size: 40.setWidth,
              color: (index < selectedRating)
                  ? (selectedRating == 1
                      ? Colors.redAccent
                      : selectedRating == 2
                          ? Colors.redAccent.shade100
                          : selectedRating == 3
                              ? const Color(0xffFDA65B)
                              : selectedRating == 4
                                  ? const Color(0xffFFD446)
                                  : const Color(0xffFABD3B))
                  : Colors.grey.shade300,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildReviewTextField() {
    return CommonTextFormField(
      controller: _reviewController,
      hintText: Languages.of(context).txtPleaseShareYourOverallExperience,
      maxLines: 3,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      radius: 12.setWidth,
      borderColor: CustomAppColor.of(context).containerBorder,
      labelTextColor: CustomAppColor.of(context).txtGray,
    );
  }

  Widget _buildSubmitButton() {
    return CommonButton(
      text: Languages.of(context).txtSubmit,
      mTop: 16.setHeight,
      mLeft: 16.setWidth,
      mRight: 16.setWidth,
      mBottom: 16.setHeight,
      onTap: () {
        if (selectedRating > 0) {
          // Handle submit logic here
          Navigator.pop(context, {
            'rating': selectedRating,
            'review': _reviewController.text,
          });
        } else {
          // Show error - rating required
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: CommonText(
                text: Languages.of(context).txtPleaseSelectRating,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtWhite,
              ),
              backgroundColor: CustomAppColor.of(context).txtRed,
            ),
          );
        }
      },
    );
  }
}
