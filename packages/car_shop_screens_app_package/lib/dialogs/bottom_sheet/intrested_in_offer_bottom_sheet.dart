import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class IntrestedInOfferBottomSheet extends StatefulWidget {
  const IntrestedInOfferBottomSheet({
    super.key,
  });

  @override
  State<IntrestedInOfferBottomSheet> createState() => _IntrestedInOfferBottomSheetState();
}

class _IntrestedInOfferBottomSheetState extends State<IntrestedInOfferBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
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
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(20.setWidth),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.setHeight),

          // Success Icon
          _buildSuccessIcon(),
          SizedBox(height: 30.setHeight),

          // Title
          _buildTitle(),
          SizedBox(height: 10.setHeight),

          // Subtitle
          _buildSubtitle(),
          SizedBox(height: 30.setHeight),

          // View Similar Offers Button
          _buildViewSimilarOffersButton(),
          SizedBox(height: 12.setHeight),

          // Back to Home Button
          _buildBackToHomeButton(),
          SizedBox(height: 10.setHeight),
        ],
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Image.asset(
      AppAssets.icSuccess,
      width: 64.setWidth,
      height: 64.setHeight,
    );
  }

  Widget _buildTitle() {
    return CommonText(
      text: Languages.of(context).txtThanksForYourInterest,
      fontSize: 20.setFontSize,
      fontWeight: FontWeight.w600,
      textColor: CustomAppColor.of(context).txtBlack,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return CommonText(
      text: Languages.of(context).txtAAuthorisedDealerWillBeInTouchSoonToSharePersonalisedOffers,
      fontSize: 12.setFontSize,
      fontWeight: FontWeight.w400,
      textColor: CustomAppColor.of(context).txtGray,
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }

  Widget _buildViewSimilarOffersButton() {
    return IgnorePointer(
      ignoring: true,
      child: CommonButton(
        text: Languages.of(context).txtViewSimilarOffers,
        onTap: () {
          Navigator.pop(context);
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SimilarOfferScreen()),
          );*/
        },
        buttonGradient: LinearGradient(
          colors: [
            CustomAppColor.of(context).transparent,
            CustomAppColor.of(context).transparent,
          ],
        ),
        buttonTextSize: 14.setFontSize,
        buttonTextWeight: FontWeight.w500,
        buttonTextColor: CustomAppColor.of(context).compareBtnText,
        borderColor: CustomAppColor.of(context).compareBtnBorder,
      ),
    );
  }

  Widget _buildBackToHomeButton() {
    return IgnorePointer(
      ignoring: true,
      child: CommonButton(
        text: Languages.of(context).txtBackToHome,
        onTap: () {
          Navigator.pop(context);
          // Navigate back to home
          /*  Navigator.of(context).popUntil((route) => route.isFirst);*/
        },
        width: double.infinity,
        buttonGradient: CustomAppColor.of(context).primaryGradient,
        buttonTextSize: 14.setFontSize,
        buttonTextWeight: FontWeight.w500,
      ),
    );
  }
}
