import 'package:flutter/material.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/see_all_product/view/see_all_product_screen.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../datamodel/category_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const CategoryScreen());
  }

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> tabList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).popular,
      Languages.of(context).men,
      Languages.of(context).women,
      Languages.of(context).kids,
      Languages.of(context).homeAppliances,
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tabBar(context),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sectionHeading(AppStrings.topWear),
                categoryGrid(topWearList),
                sectionHeading(AppStrings.bottomWear),
                categoryGrid(bottomWearList),
                sectionHeading(AppStrings.accessories),
                categoryGrid(accessoriesList),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget sectionHeading(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(4)),
      child: CommonText(
        textColor: CustomAppColor.of(context).txtBlackPurple,
        text: title.toUpperCase(),
        fontSize: AppSizes.setFontSize(17),
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget categoryGrid(List<Category> categories) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 22,
        mainAxisSpacing: 12,
        childAspectRatio: 0.98,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return categoryItems(category: category);
      },
    );
  }

  Widget tabBar(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      child: TabBar(
        controller: _tabController,
        tabAlignment: TabAlignment.center,
        labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14)),
        isScrollable: true,
        unselectedLabelColor: AppColor.txtGrey,
        labelStyle: TextStyle(
          fontFamily: Constant.fontFamilyUrbanist,
          fontSize: AppSizes.setFontSize(18),
          fontWeight: FontWeight.w500,
        ),
        labelColor: AppColor.txtPurple,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
          insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
        ),
        tabs: tabList.map((tab) {
          return Tab(
            text: tab,
          );
        }).toList(),
      ),
    );
  }

  Widget categoryItems({required Category category}) {
    return InkWell(
      onTap: () => Navigator.push(context, SeeAllProductScreen.route()),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6), horizontal: AppSizes.setWidth(5)),
        height: AppSizes.setHeight(100),
        width: AppSizes.setWidth(100),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScaffold,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: CustomAppColor.of(context).containerBorder, width: 1),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                height: AppSizes.setHeight(75),
                width: AppSizes.setWidth(70),
                category.imagePath ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2), horizontal: AppSizes.setWidth(6)),
              child: CommonText(
                text: category.label ?? '',
                fontWeight: FontWeight.w500,
                fontSize: AppSizes.setFontSize(13),
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
