import 'package:flutter/material.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';

import '../../utils/constant.dart';
import '../text/common_text.dart';

class SelectOptionBottomSheet extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SelectOptionBottomSheet());
  }

  const SelectOptionBottomSheet({super.key});

  @override
  State<SelectOptionBottomSheet> createState() => _SelectOptionBottomSheetState();
}

class _SelectOptionBottomSheetState extends State<SelectOptionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 12.setHeight),
            Center(
              child: Container(
                width: 40.setWidth,
                height: 3.setHeight,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Center(
              child: CommonText(
                text: "Select Option",
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
            ),
            Divider(height: 24.setHeight),
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).unselectedCard,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.setHeight),
                          child: Image.asset(
                            AppAssets.icTrash,
                            height: 20.setHeight,
                            width: 20.setWidth,
                            color: CustomAppColor.of(context).txtGray,
                          ),
                        ),
                        SizedBox(width: 12.setWidth),
                        const CommonText(
                          text: "Delete Address",
                          fontFamily: Constant.fontFamilySemiBold600,
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(height: 12.setHeight),
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).unselectedCard,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.setHeight),
                          child: Image.asset(
                            AppAssets.icBoxEdit,
                            height: 20.setHeight,
                            width: 18.setWidth,
                            color: CustomAppColor.of(context).txtGray,
                          ),
                        ),
                        SizedBox(width: 14.setWidth),
                        const CommonText(
                          text: "Edit Address",
                          fontFamily: Constant.fontFamilySemiBold600,
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  )
                ],
              ),
            ),
            SizedBox(height: 12.setHeight),
            Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).unselectedCard,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 12.setHeight),
              child: const CommonText(
                text: "Set As Default Address",
                textAlign: TextAlign.start,
                fontFamily: Constant.fontFamilySemiBold600,
              ),
            ),
            SizedBox(height: 20.setHeight),
          ],
        ),
      ),
    );
  }
}
