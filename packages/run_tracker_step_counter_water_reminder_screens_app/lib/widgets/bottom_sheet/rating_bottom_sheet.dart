import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';

class RatingBottomSheet extends StatefulWidget {
  const RatingBottomSheet({super.key});

  @override
  RatingBottomSheetState createState() => RatingBottomSheetState();
}

class RatingBottomSheetState extends State<RatingBottomSheet> {
  double _rating = 3;

  final Map<int, String> _emojis = {
    1: AppAssets.img12Star,
    2: AppAssets.img12Star,
    3: AppAssets.img3Star,
    4: AppAssets.img4Star,
    5: AppAssets.img5Star,
  };

  final Map<int, String> _labels = {
    1: 'TERRIBLE',
    2: 'BAD',
    3: 'OK',
    4: 'GOOD',
    5: 'GREAT',
  };

  @override
  Widget build(BuildContext context) {
    int roundedRating = _rating.round().clamp(1, 5);

    return SafeArea(
      bottom: true,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 60.setHeight),
            padding: EdgeInsets.only(
              top: 80.setHeight,
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 30.setHeight,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5.setHeight),

                CommonText(
                  text: _labels[roundedRating]!,
                  fontSize: 32.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).black,
                ),
                SizedBox(height: 20.setHeight),
                RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 54,
                  unratedColor: Color(0xFF9195B6).withValues(alpha: 0.4),
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                  itemBuilder: (context, index) =>
                      Icon(Icons.star_rounded, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                SizedBox(height: 28.setHeight),
                CommonText(
                  text: Languages.of(context).txtRatingDesc,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                SizedBox(height: 30.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.setWidth),
                  child: CommonButton(
                    buttonTextSize: 16.setFontSize,
                    text: Languages.of(context).txtRate,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: Image.asset(
                _emojis[roundedRating]!,
                width: 90,
                height: 90,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
