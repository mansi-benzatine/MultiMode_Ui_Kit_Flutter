import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../widgets/text/common_text.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  final List<Map<String, bool>> sortByLabels = [
    {"Relevance": true},
    {"Distance": false},
    {"Added Date": false},
    {"Price: Low to High": false},
    {"Price: High to Low": false},
    {"Kms - Low to High": false},
    {"Model - Newest To Oldest": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.38,
        ),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgBottomSheet,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CustomAppColor.of(context).containerBorder,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtSortBy,
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
            ),
            SizedBox(height: 20.setHeight),
            // Content
            Expanded(
              child: Column(
                children: [
                  ...List.generate(sortByLabels.length, (index) {
                    return _buildSortByCheckbox(sortByLabels[index], index);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSortByCheckbox(Map<String, bool> sortByLabel, int index) {
    final bool isChecked = sortByLabel.values.first;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.setHeight, left: 20.setWidth, right: 20.setWidth),
      child: Row(
        children: [
          SizedBox(
            width: 20.setWidth,
            height: 12.setHeight,
            child: Checkbox(
              value: isChecked,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (bool? value) {
                setState(() {
                  sortByLabels[index][sortByLabel.keys.first] = value ?? false;
                });
              },
              activeColor: CustomAppColor.of(context).primary,
              checkColor: CustomAppColor.of(context).txtWhite,
              side: BorderSide(
                color: CustomAppColor.of(context).containerBorder,
                width: 1.5,
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: sortByLabel.keys.first,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
