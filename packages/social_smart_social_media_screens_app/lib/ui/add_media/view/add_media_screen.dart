import 'package:flutter/material.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../ui/create_posts/view/create_post_screen.dart';
import '../../../../../../../ui/edit_content/view/edit_content_screen.dart';
import '../../../../../../../utils/app_assets.dart';
import '../../../../../../../widgets/button/common_button.dart';
import '../../../../../../../widgets/text/common_text.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../create_posts/datamodel/create_posts_data.dart';

class AddMediaScreen extends StatefulWidget {
  final int currentIndex;

  const AddMediaScreen({super.key, this.currentIndex = 0});
  static Route route({int currentIndex = 0}) {
    return MaterialPageRoute(
      builder: (context) => AddMediaScreen(currentIndex: currentIndex),
    );
  }

  @override
  State<AddMediaScreen> createState() => _AddMediaScreenState();
}

class _AddMediaScreenState extends State<AddMediaScreen> with TickerProviderStateMixin {
  List<String> tabList = [];
  late List<IconItem> effectList;

  late TabController _controller;
  late List<IconItem> tab2Items;
  late List<IconItem> tab3Items;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 3, initialIndex: widget.currentIndex);
    _controller.addListener(() {
      if (_controller.indexIsChanging == false) {
        setState(() {});
      }
    });
    effectList = mediaItems();
    tab2Items = videoItems();
    tab3Items = imageItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).all,
      Languages.of(context).videos,
      Languages.of(context).photo,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IgnorePointer(
            ignoring: true,
            child: IconButton(
                onPressed: () => Navigator.push(context, CreatePostScreen.route(isCameraSelected: false, isPhotoSelected: false, isTemplateSelected: false, isVideoSelected: false, currentIndex: 0)), icon: const Icon(Icons.clear)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: Languages.of(context).allMedia,
                fontSize: AppSizes.setFontSize(20),
                fontWeight: FontWeight.w700,
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
              child: Image.asset(
                AppAssets.icMoreOption,
                color: CustomAppColor.of(context).icBlack,
                width: AppSizes.setWidth(22),
                height: AppSizes.setHeight(22),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22)),
                child: searchFromTabBar(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(15)),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                border: Border(
                  top: BorderSide(
                    color: CustomAppColor.of(context).txtDarkGrey,
                    width: 0.5,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                    child: CommonText(
                      text: _controller.index == 0
                          ? Languages.of(context).youCanSelectBothVideoAndPhotos
                          : _controller.index == 1
                              ? "You can select any videos"
                              : "You can select any photos",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      isShadowButton: true,
                      borderColor: AppColor.transparent,
                      btnText: Languages.of(context).next,
                      onTap: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: false)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchFromTabBar() {
    return Column(
      children: [
        IgnorePointer(
          ignoring: true,
          child: Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(15)),
            child: TabBar(
              controller: _controller,
              tabAlignment: TabAlignment.center,
              labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(40)),
              isScrollable: true,
              unselectedLabelColor: AppColor.txtGrey,
              labelStyle: TextStyle(
                fontFamily: Constant.fontFamilyUrbanist,
                fontSize: AppSizes.setFontSize(16),
                fontWeight: FontWeight.w600,
              ),
              labelColor: AppColor.txtPurple,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
                insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(60)),
              ),
              tabs: tabList.map((tab) {
                return Tab(
                  text: tab,
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              tabview(effectList), // All items
              tabview(tab2Items), // Fixed random 3
              tabview(tab3Items),
            ],
          ),
        ),
      ],
    );
  }

  Widget tabview(List<IconItem> items) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 6.0,
      childAspectRatio: 1,
      children: List.generate(
        items.length,
        (index) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  items[index].iconAsset,
                  fit: BoxFit.fill,
                ),
              ),
              // Purple Checkbox
              Positioned(
                bottom: AppSizes.setHeight(75),
                top: AppSizes.setHeight(0),
                right: AppSizes.setWidth(0),
                left: AppSizes.setWidth(75),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Checkbox(
                    side: WidgetStateBorderSide.resolveWith(
                      (states) => const BorderSide(
                        width: 3.0,
                        color: AppColor.btnGradiant2,
                      ),
                    ),
                    activeColor: AppColor.btnGradiant2,
                    value: items[index].isSelected,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          items[index].isSelected = value ?? false;
                        },
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: items[index].isVideo ?? false,
                child: Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      AppAssets.icPlay,
                      height: AppSizes.setHeight(26),
                      width: AppSizes.setWidth(26),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
