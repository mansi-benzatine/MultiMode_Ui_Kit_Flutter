import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class ViewProductDetailsScreen extends StatefulWidget {
  static Route<void> route() => MaterialPageRoute(builder: (_) => const ViewProductDetailsScreen());

  const ViewProductDetailsScreen({super.key});

  @override
  State<ViewProductDetailsScreen> createState() => _ViewProductDetailsScreenState();
}

class _ViewProductDetailsScreenState extends State<ViewProductDetailsScreen> implements TopBarClickListener {
  final List<_ProductDetailItem> _details = [
    const _ProductDetailItem(
      title: "Storage Tips :",
      content:
          "Store at room temperature away from direct sunlight. Do not refrigerate, as this can reduce flavor and texture. Once cut, cover the exposed part tightly with plastic wrap and refrigerate to avoid rotting. Use cut tomatoes within two days for best taste",
    ),
    const _ProductDetailItem(
      title: "Nutrient Value & Benefits :",
      content: "Contains Vitamin C, Vitamin K. Rich in carotene. Vitamin C acts as a powerful antioxidant and also helps formation of collagen that is responsible for skin and hair health.",
    ),
    const _ProductDetailItem(
      title: "About :",
      content:
          "Tomato is a versatile fruit with a tender and pulpy texture. It has a sweet and tangy flavour and is commonly used to impart a distinctive flavour and colour to curries or gravies or soups and is also eaten raw in salads or burgers etc.",
    ),
    const _ProductDetailItem(
      title: "Description :",
      content: "Tomato can be used in diverse ways, including raw in salads or in slices, stewed, incorporated into a wide variety of dishes, or processed into ketchup or tomato soup.",
    ),
    const _ProductDetailItem(title: "Health Benefits :", content: "Vitamin C Rich"),
    const _ProductDetailItem(title: "Shelf Life :", content: "2 Days"),
    const _ProductDetailItem(title: "Return Policy :", content: "2 Days"),
    const _ProductDetailItem(title: "Country of Origin :", content: "USA"),
    const _ProductDetailItem(
      title: "Customer Care Details :",
      content: "Email: info@grokit.com",
    ),
    const _ProductDetailItem(
      title: "Disclaimer :",
      content:
          "Every effort is made to maintain the accuracy of all information. However, actual product packaging and materials may contain more and/or different information. It is recommended not to solely rely on the information presented.",
    ),
    const _ProductDetailItem(
      title: "Seller :",
      content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry the text of the printing and typesetting industry",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtProductDetails,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var detail in _details) ...[
                    _buildDetailItem(context, detail),
                    if (detail != _details.last) ...[
                      SizedBox(height: 10.setHeight),
                      Divider(color: CustomAppColor.of(context).border),
                      SizedBox(height: 10.setHeight),
                    ],
                  ],
                  SizedBox(height: 55.setHeight),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, _ProductDetailItem detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: detail.title,
          fontSize: 14.setFontSize,
          fontFamily: Constant.fontFamilySemiBold600,
        ),
        SizedBox(height: 4.setHeight),
        CommonText(
          text: detail.content,
          fontSize: 12.setFontSize,
          maxLines: 6,
          textAlign: TextAlign.start,
          fontFamily: Constant.fontFamilyMedium500,
          textColor: CustomAppColor.of(context).txtGray,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class _ProductDetailItem {
  final String title;
  final String content;

  const _ProductDetailItem({required this.title, required this.content});
}
