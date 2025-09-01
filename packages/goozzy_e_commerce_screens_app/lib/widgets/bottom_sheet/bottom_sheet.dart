import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../utils/string_constant.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';

Future<T?> customBottomSheet<T>({
  required BuildContext context,
  required String title,
  required Widget content,
  Function()? onDone,
  double? maxHeightRatio = 0.8,
  bool? isDone = true,
  bool? isClearVisible = false,
  bool? isPaddingRequired = true,
  String? catalogCount,
}) {
  return showModalBottomSheet<T>(
    scrollControlDisabledMaxHeightRatio: maxHeightRatio ?? 0.6,
    context: context,
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: false,
    backgroundColor: CustomAppColor.of(context).bgScaffold,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18), horizontal: AppSizes.setWidth(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: title.toUpperCase(),
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(18),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.clear,
                        weight: AppSizes.setWidth(24),
                        color: CustomAppColor.of(context).txtGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.3),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.setHeight(4),
                horizontal: isPaddingRequired ?? false ? AppSizes.setWidth(14) : AppSizes.setWidth(0),
              ),
              child: content,
            )),
            Visibility(
              visible: isDone ?? false,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.5),
                    width: 1,
                  ),
                )),
                child: Container(
                  color: CustomAppColor.of(context).bgScaffold,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20), horizontal: AppSizes.setWidth(18)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: catalogCount ?? AppStrings.catalogs,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSizes.setFontSize(15),
                      ),
                      Visibility(
                        visible: isClearVisible ?? false,
                        child: IgnorePointer(
                          ignoring: true,
                          child: Padding(
                            padding: EdgeInsets.only(left: AppSizes.setWidth(33), right: AppSizes.setWidth(15)),
                            child: CommonButton(
                              width: AppSizes.setWidth(93),
                              height: AppSizes.setHeight(34),
                              radius: 3,
                              borderColor: CustomAppColor.of(context).bgContainerGrey,
                              onTap: onDone,
                              buttonColor: CustomAppColor.of(context).btnWhite,
                              child: CommonText(
                                text: Languages.of(context).clearFilter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          width: AppSizes.setWidth(93),
                          height: AppSizes.setHeight(34),
                          btnText: Languages.of(context).done,
                          radius: 3,
                          onTap: onDone,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
