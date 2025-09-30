import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

import '../../utils/app_color.dart';

class UnitBottomSheetDialog extends StatefulWidget {
  const UnitBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<UnitBottomSheetDialog> createState() => _UnitBottomSheetDialogState();
}

class _UnitBottomSheetDialogState extends State<UnitBottomSheetDialog> {
  final ValueNotifier<int> selectedUnit = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.setHeight),
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: selectedUnit,
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  selectedUnit.value = 0;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      width: value == 0 ? 1.5 : 1,
                      color: (value == 0) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
                  margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonText(
                          text: "KG/CM/KM",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: (value == 0) ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtDarkGray,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      if (value == 0)
                        Container(
                          height: 24.setHeight,
                          width: 24.setHeight,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                            size: 16.setHeight,
                          ),
                        )
                    ],
                  ),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: selectedUnit,
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  selectedUnit.value = 1;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(width: value == 1 ? 1.5 : 1, color: (value == 1) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
                  margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 8.setHeight),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonText(
                          text: "LBS/FT/MILE",
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: (value == 1) ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtDarkGray,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      if (value == 1)
                        Container(
                          height: 24.setHeight,
                          width: 24.setHeight,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                            size: 16.setHeight,
                          ),
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
