import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/ui/choose_media/datamodel/choose_media_data.dart';
import 'package:mivi_app/ui/edit_video/view/edit_video_screen.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/button/common_button.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/top_bar/topbar.dart';

class ChooseMediaScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ChooseMediaScreen());
  }

  const ChooseMediaScreen({super.key});

  @override
  State<ChooseMediaScreen> createState() => _ChooseMediaScreenState();
}

class _ChooseMediaScreenState extends State<ChooseMediaScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  int selectedIndex = 0;
  List<MediaModel> mediaList = [];
  List<MediaModel> selectedList = [];
  late final ValueChanged<int> onTabChanged;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fillData();
  }

  void _onLongPress(MediaModel item) {
    setState(() {
      if (selectedList.contains(item)) {
        selectedList.remove(item);
      } else {
        selectedList.add(item);
      }
    });
  }

  void _fillData() {
    mediaList = [
      MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage5, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage6, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage7, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage2, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage3, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage4, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage5, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage6, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage7, category: "Photos"),
      MediaModel(image: AppAssets.imgChooseImage1, category: "Photos"),
      MediaModel(
        image: AppAssets.imgChooseImage3,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage6,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage1,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage2,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage4,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage3,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage4,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage6,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage1,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage3,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage5,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage2,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage3,
        category: "Videos",
        isVideo: true,
      ),
      MediaModel(
        image: AppAssets.imgChooseImage4,
        category: "Videos",
        isVideo: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = mediaList.where((t) => (t.isVideo && _tabController.index == 1) || (!t.isVideo && _tabController.index == 0)).toList();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtChooseMedia,
            isShowBack: true,
            isShowCamera: true,
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
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: selectedList.isNotEmpty ? 0.setHeight : 60.setHeight),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _gridList(filteredList),
                    ),
                  ),
                ),
                if (selectedList.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(left: 26.setWidth, right: 26.setWidth, bottom: 60.setHeight, top: 15.setHeight),
                    child: CommonButton(
                      text: Languages.of(context).txtCreate,
                      onTap: () {
                        Navigator.push(context, EditVideoScreen.route(selectedList));
                      },
                    ),
                  )
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

  Widget _gridList(List<MediaModel> list) {
    final screenWidth = MediaQuery.of(context).size.width;
    const crossAxisCount = 3;
    const spacing = 12.0;

    final itemWidth = (screenWidth - (20.setWidth * 2) - (crossAxisCount - 1) * spacing) / crossAxisCount;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.setWidth,
          right: 20.setWidth,
          top: 10.setHeight,
        ),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: list.map((item) {
            return SizedBox(
              width: itemWidth,
              height: itemWidth,
              child: _buildTemplateCard(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(MediaModel item) {
    final bool isSelected = selectedList.contains(item);
    final int selectionIndex = isSelected ? selectedList.indexOf(item) + 1 : -1;
    return GestureDetector(
      onLongPress: () => _onLongPress(item),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: GestureDetector(
          onTap: () => _onLongPress(item),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              if (isSelected)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.black.withValues(alpha: 0.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 1.0],
                    ),
                  ),
                ),
              if (isSelected)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: CustomAppColor.of(context).secondary,
                      width: 2,
                    ),
                  ),
                ),
              if (isSelected)
                Positioned(
                  top: 10.setHeight,
                  left: 15.setWidth,
                  child: CommonText(
                    text: '$selectionIndex',
                    textColor: CustomAppColor.of(context).secondary,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {}
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
