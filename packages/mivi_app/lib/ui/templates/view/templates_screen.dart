import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/ui/choose_media/view/choose_media_screen.dart';
import 'package:mivi_app/ui/search/view/search_screen.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/top_bar/topbar.dart';

import '../datamodel/templates_data.dart';

class TemplatesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TemplatesScreen());
  }

  const TemplatesScreen({super.key});

  @override
  State<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> with SingleTickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  List<String> subTabs = ["All", "Trending", "Reel", "TikTok", "Ads", "Lyrics"];
  String selectedSubTab = "All";
  int selectedIndex = 0;
  List<TemplateModel> templates = [];
  late final ValueChanged<int> onTabChanged;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fillData();
  }

  void _fillData() {
    templates = [
      TemplateModel(
        title: "Memories of You",
        image: AppAssets.imgRecentProject1,
        category: "Photos",
      ),
      TemplateModel(
        title: "Filter Design",
        image: AppAssets.imgRecentProject2,
        category: "Photos",
      ),
      TemplateModel(
        title: "Birthday Card",
        image: AppAssets.imgRecentProject3,
        category: "Photos",
      ),
      TemplateModel(
        title: "Memories",
        image: AppAssets.imgRecentProject4,
        category: "Photos",
      ),
      TemplateModel(
        title: "Somewhere in Time",
        image: AppAssets.imgRecentProject1,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Filter Mode",
        image: AppAssets.imgRecentProject2,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "What is Right",
        image: AppAssets.imgRecentProject3,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Memories",
        image: AppAssets.imgRecentProject4,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Memories",
        image: AppAssets.imgRecentProject4,
        category: "Photos",
      ),
      TemplateModel(
        title: "Somewhere in Time",
        image: AppAssets.imgRecentProject1,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Filter Mode",
        image: AppAssets.imgRecentProject1,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Memories",
        image: AppAssets.imgRecentProject4,
        category: "Photos",
      ),
      TemplateModel(
        title: "Somewhere in Time",
        image: AppAssets.imgRecentProject1,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Filter Mode",
        image: AppAssets.imgRecentProject4,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Filter Design",
        image: AppAssets.imgRecentProject3,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Birthday Card",
        image: AppAssets.imgRecentProject3,
        category: "Videos",
        isVideo: true,
      ),
      TemplateModel(
        title: "Memories",
        image: AppAssets.imgRecentProject4,
        category: "Photos",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = templates.where((t) => (t.isVideo && _tabController.index == 1) || (!t.isVideo && _tabController.index == 0)).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtTemplates,
            isShowBack: false,
            isShowSearch: true,
          ),
          Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTab("Photos", 0),
                        SizedBox(width: 20.setWidth),
                        _buildTab("Videos", 1),
                      ],
                    ),
                    SizedBox(height: 10.setHeight),
                    _subCategoryList(),
                    SizedBox(height: 10.setHeight),
                  ],
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _gridList(filteredList),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          _tabController.index = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.only(left: 46.setWidth, top: 14.setHeight, right: 46.setWidth),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).selectedTabBar : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: title,
              textColor: isSelected ? CustomAppColor.of(context).secondary : null,
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 15.setFontSize,
            ),
            SizedBox(height: 12.setHeight),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2.5,
              width: isSelected ? 45 : 0,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
        child: Wrap(
          spacing: 8,
          children: subTabs.map((tab) {
            final isSelected = selectedSubTab == tab;
            return GestureDetector(
              onTap: () => setState(() => selectedSubTab = tab),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 5.setHeight),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).transparent,
                    ),
                  ),
                ),
                child: CommonText(
                  text: tab,
                  textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.setFontSize,
                  fontFamily: Constant.fontFamilyMedium500,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _gridList(List<TemplateModel> list) {
    final screenWidth = MediaQuery.of(context).size.width;
    const crossAxisCount = 2;
    const spacing = 12.0;

    final itemWidth = (screenWidth - (20.setWidth * 2) - (crossAxisCount - 1) * spacing) / crossAxisCount;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 10.setHeight, bottom: 110.setHeight),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: list.map((item) {
            return SizedBox(
              width: itemWidth,
              height: itemWidth * 1.2,
              child: _buildTemplateCard(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(TemplateModel item) {
    return GestureDetector(
      onTap: () => Navigator.push(context, ChooseMediaScreen.route()),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 0.9],
                ),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: CommonText(
                text: item.title,
                textColor: Colors.white,
                fontWeight: FontWeight.w600,
                maxLines: 1,
                fontSize: 12.setFontSize,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }
}
