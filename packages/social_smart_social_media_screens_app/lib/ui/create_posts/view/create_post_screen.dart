import 'package:flutter/material.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../ui/home/view/home_screen.dart';
import '../../../../../../../utils/app_assets.dart';
import '../../../../../../../utils/string_constant.dart';
import '../../../../../../../widgets/button/common_button.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../add_media/view/add_media_screen.dart';
import '../../add_sounds/view/add_sound_screen.dart';
import '../../edit_content/view/edit_content_screen.dart';
import '../datamodel/create_posts_data.dart';

class CreatePostScreen extends StatefulWidget {
  final bool isPhotoSelected;
  final bool isVideoSelected;
  final bool isCameraSelected;
  final bool isTemplateSelected;
  final int currentIndex;
  final bool isForEffectBs;
  const CreatePostScreen({
    super.key,
    required this.isPhotoSelected,
    required this.isVideoSelected,
    required this.isCameraSelected,
    required this.isTemplateSelected,
    required this.currentIndex,
    this.isForEffectBs = false,
  });
  static Route route({
    required int currentIndex,
    required bool isPhotoSelected,
    required bool isVideoSelected,
    required bool isCameraSelected,
    required bool isTemplateSelected,
    bool isForEffectBs = false,
  }) {
    return MaterialPageRoute(
      builder: (context) => CreatePostScreen(
        isCameraSelected: isCameraSelected,
        isPhotoSelected: isPhotoSelected,
        isTemplateSelected: isTemplateSelected,
        isVideoSelected: isVideoSelected,
        currentIndex: currentIndex,
        isForEffectBs: isForEffectBs,
      ),
    );
  }

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> with TickerProviderStateMixin {
  bool isPhotoSelected = false;
  bool isVideoSelected = false;
  int currentIndex = 0;
  bool isCameraSelected = false;
  bool isTemplateSelected = false;
  List<String> tabList = [];
  late TabController _controller;
  List<IconItem> effectList = [];
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: widget.currentIndex);
    effectList = effectItems();
    if (widget.isTemplateSelected) {
      isTemplateSelected = true;
      currentIndex = 2;
    } else if (widget.isVideoSelected) {
      isVideoSelected = true;
      isCameraSelected = true;
      currentIndex = 0;
    } else if (widget.isPhotoSelected) {
      isPhotoSelected = true;
      currentIndex = 1;
    } else {
      isCameraSelected = true;
      currentIndex = 0;
    }

    if (widget.isForEffectBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showEffectBS();
      });
    }
  }

  void showEffectBS() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    final effectList = effectItems();
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.57,
      showDragHandle: true,
      isScrollControlled: false,
      enableDrag: false,
      isDismissible: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter bottomSheetSetState) {
          return Container(
            padding: EdgeInsets.only(
              left: AppSizes.setWidth(20),
              right: AppSizes.setWidth(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: Languages.of(context).effects,
                  fontSize: AppSizes.setFontSize(24),
                  fontWeight: FontWeight.w700,
                ),
                const Divider(
                  color: AppColor.btnLightGrey,
                  thickness: 0.4,
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: AppSizes.setWidth(10)),
                        child: Image.asset(
                          AppAssets.icSearchFilled,
                          color: CustomAppColor.of(context).txtDarkGrey,
                          width: AppSizes.setWidth(22),
                          height: AppSizes.setHeight(22),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                        child: Image.asset(
                          AppAssets.icUnsaved,
                          color: CustomAppColor.of(context).txtDarkGrey,
                          width: AppSizes.setWidth(22),
                          height: AppSizes.setHeight(22),
                        ),
                      ),
                      // TabBar
                      Expanded(
                        child: IgnorePointer(
                          ignoring: true,
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
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: AppColor.txtPurple,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
                              insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(90)),
                            ),
                            tabs: tabList.map((tab) {
                              return Tab(
                                text: tab,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                        child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 0.90,
                          children: List.generate(
                            effectList.length,
                            (index) {
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      effectList[index].iconAsset,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: AppSizes.setHeight(40),
                                    top: AppSizes.setHeight(0),
                                    right: AppSizes.setWidth(0),
                                    left: AppSizes.setWidth(40),
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
                                        value: effectList[index].isSelected,
                                        onChanged: (bool? value) {
                                          bottomSheetSetState(() {
                                            for (int i = 0; i < effectList.length; i++) {
                                              effectList[i].isSelected = i == index;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.80,
                        children: List.generate(
                          effectList.length,
                          (index) {
                            return Image.asset(
                              effectList[index].iconAsset,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).trending,
      Languages.of(context).newEffect,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: _dashboardPosts(context),
        bottomNavigationBar: bottomNavBar(context),
        backgroundColor: CustomAppColor.of(context).black,
      ),
    );
  }

  Widget _dashboardPosts(BuildContext context) {
    return isTemplateSelected
        ? addTemplates()
        : Stack(
            children: [
              Image.asset(
                AppAssets.imgCreateContent,
                width: AppSizes.fullWidth,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: AppSizes.setHeight(105),
                right: AppSizes.setWidth(20),
                child: _createContentIcon(),
              ),
              Positioned(
                top: AppSizes.setHeight(60),
                left: AppSizes.setWidth(10),
                child: topIcons(),
              ),
              Positioned(
                bottom: AppSizes.setHeight(120),
                left: isCameraSelected ? AppSizes.setWidth(55) : AppSizes.setWidth(80),
                child: isCameraSelected ? timeOfVideo() : photoAndVideo(),
              ),
              Positioned(
                bottom: AppSizes.setHeight(20),
                left: AppSizes.setWidth(65),
                right: AppSizes.setWidth(65),
                child: createContentBottomIcon(),
              ),
            ],
          );
  }

  Widget _createContentIcon() {
    final List<IconItem> items = iconItems(context: context, isVideoSelected: !isVideoSelected);
    return SizedBox(
      height: isVideoSelected ? AppSizes.setHeight(600) : AppSizes.setHeight(700),
      child: Column(
        children: items.map((item) => iconList(item: item)).toList(),
      ),
    );
  }

  Widget iconList({required item}) {
    return Visibility(
      visible: !item.isShown,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                item.iconAsset,
                height: AppSizes.setHeight(29),
                width: AppSizes.setWidth(29),
              ),
            ),
            CommonText(
              text: item.label,
              textColor: AppColor.txtWhite,
              fontSize: AppSizes.setFontSize(12),
            )
          ],
        ),
      ),
    );
  }

  Widget topIcons() {
    return Row(
      children: [
        IgnorePointer(
          ignoring: true,
          child: IconButton(
            onPressed: () => Navigator.push(context, HomeScreen.route(isFromHome: false, isFromProfile: false, isFromDiscover: false, isFromInbox: false, isFromOptionsForPosts: false)),
            icon: const Icon(
              Icons.clear,
              color: AppColor.white,
            ),
          ),
        ),
        SizedBox(
          width: AppSizes.fullWidth / 1.5,
          child: Center(
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.push(context, AddSoundScreen.route()),
                child: Container(
                  width: AppSizes.setWidth(115),
                  height: AppSizes.setHeight(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColor.black.withOpacityPercent(0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.icMusic,
                        scale: 4,
                      ),
                      const SizedBox(width: 4),
                      CommonText(
                        text: Languages.of(context).addSound,
                        fontSize: AppSizes.setFontSize(12),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.txtWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomNavBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isCameraSelected ? AppSizes.setWidth(140) : AppSizes.setWidth(0), right: isTemplateSelected ? AppSizes.setWidth(140) : AppSizes.setWidth(0)),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.setHeight(6),
        ),
        height: AppSizes.setHeight(50),
        decoration: const BoxDecoration(
          color: AppColor.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                  isPhotoSelected = false;
                  isVideoSelected = true;
                  isCameraSelected = true;
                  isTemplateSelected = false;
                });
              },
              child: CommonText(
                text: Languages.of(context).camera,
                textColor: currentIndex == 0 ? AppColor.txtWhite : AppColor.txtGrey,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                  isCameraSelected = false;
                  isTemplateSelected = false;
                });
              },
              child: CommonText(
                text: Languages.of(context).quick,
                fontWeight: FontWeight.w500,
                textColor: currentIndex == 1 ? AppColor.txtWhite : AppColor.txtGrey,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                  isCameraSelected = false;
                  isTemplateSelected = true;
                });
              },
              child: CommonText(
                text: Languages.of(context).templates,
                textColor: currentIndex == 2 ? AppColor.txtWhite : AppColor.txtGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createContentBottomIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () => _showEffectBottomSheet(context),
              icon: Image.asset(
                AppAssets.icEffect,
                scale: 4,
              ),
            ),
            CommonText(
              text: Languages.of(context).effects,
              textColor: AppColor.txtWhite,
              fontSize: AppSizes.setFontSize(12),
            )
          ],
        ),
        IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: false)),
            child: Container(
              height: AppSizes.setHeight(80),
              width: AppSizes.setWidth(80),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppColor.btnGradiant1,
                    AppColor.btnGradiant2,
                  ],
                ),
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: AppColor.white),
              ),
              child: Visibility(
                  visible: isVideoSelected,
                  child: Image.asset(
                    AppAssets.icCreateVideo,
                    scale: 2,
                    color: AppColor.white,
                  )),
            ),
          ),
        ),
        Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, AddMediaScreen.route());
                },
                icon: Image.asset(
                  AppAssets.icUpload,
                  scale: 4,
                ),
              ),
            ),
            CommonText(
              text: Languages.of(context).upload,
              textColor: AppColor.txtWhite,
              fontSize: AppSizes.setFontSize(12),
            )
          ],
        )
      ],
    );
  }

  Widget photoAndVideo() {
    return Padding(
      padding: EdgeInsets.only(left: AppSizes.setWidth(65)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isPhotoSelected = true;
                isVideoSelected = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(14), vertical: AppSizes.setHeight(8)),
              decoration: BoxDecoration(
                color: AppColor.black.withOpacityPercent(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    isPhotoSelected ? AppAssets.icPhoto : AppAssets.icCreateVideo,
                    height: AppSizes.setHeight(16),
                    width: AppSizes.setWidth(16),
                    color: AppColor.txtWhite,
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: isPhotoSelected ? Languages.of(context).photo : Languages.of(context).video,
                    fontSize: AppSizes.setFontSize(12),
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.txtWhite,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                if (!isPhotoSelected) {
                  isPhotoSelected = true;
                  isVideoSelected = false;
                } else {
                  isPhotoSelected = false;
                  isVideoSelected = true;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(8)),
              decoration: BoxDecoration(
                color: AppColor.black.withOpacityPercent(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    !isPhotoSelected ? AppAssets.icPhoto : AppAssets.icCreateVideo,
                    height: AppSizes.setHeight(16),
                    width: AppSizes.setWidth(16),
                    color: AppColor.btnLightGrey,
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: !isPhotoSelected ? Languages.of(context).photo : Languages.of(context).video,
                    fontSize: AppSizes.setFontSize(12),
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.btnLightGrey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget timeOfVideo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.setWidth(12),
                vertical: AppSizes.setHeight(6),
              ),
              decoration: BoxDecoration(
                color: AppColor.black.withOpacityPercent(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: CommonText(
                text: "3m",
                textColor: isPhotoSelected ? AppColor.txtWhite : AppColor.btnLightGrey,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.setWidth(12),
                vertical: AppSizes.setHeight(6),
              ),
              decoration: BoxDecoration(
                color: AppColor.black.withOpacityPercent(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: CommonText(
                text: "60s",
                textColor: isVideoSelected ? AppColor.txtWhite : AppColor.btnLightGrey,
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.setWidth(12),
                vertical: AppSizes.setHeight(6),
              ),
              decoration: BoxDecoration(
                color: AppColor.black.withOpacityPercent(0.6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: CommonText(
                text: "15s",
                textColor: isVideoSelected ? AppColor.txtWhite : AppColor.btnLightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addTemplates() {
    return Container(
      padding: EdgeInsets.only(top: AppSizes.setHeight(60), left: AppSizes.setWidth(20), right: AppSizes.setWidth(20)),
      color: const Color(0xff181A20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IgnorePointer(
              ignoring: true,
              child: IconButton(
                onPressed: () => Navigator.push(context, CreatePostScreen.route(isVideoSelected: false, isTemplateSelected: false, isPhotoSelected: false, isCameraSelected: false, currentIndex: 1)),
                icon: const Icon(
                  Icons.clear,
                  color: AppColor.white,
                ),
              ),
            ),
            SizedBox(height: AppSizes.setHeight(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: AppStrings.oilPainting,
                    fontWeight: FontWeight.w700,
                    textColor: AppColor.txtWhite,
                    fontSize: AppSizes.setFontSize(30),
                  ),
                  SizedBox(height: AppSizes.setHeight(8)),
                  CommonText(
                    text: AppStrings.pleaseUploadPhoto,
                    textColor: AppColor.txtWhite,
                    fontSize: AppSizes.setFontSize(14),
                  ),
                  SizedBox(height: AppSizes.setHeight(16)),
                  Image.asset(
                    AppAssets.imgUpload,
                    height: AppSizes.setHeight(410),
                  ),
                  SizedBox(height: AppSizes.setHeight(10)),
                  CommonText(
                    text: "1/168",
                    textColor: AppColor.txtWhite,
                    fontSize: AppSizes.setFontSize(14),
                  ),
                  SizedBox(height: AppSizes.setHeight(30)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
                    child: CommonButton(
                      btnText: Languages.of(context).uploadPhoto,
                      borderColor: AppColor.transparent,
                    ),
                  ),
                  SizedBox(height: AppSizes.setHeight(30)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEffectBottomSheet(BuildContext context) {
    final effectList = effectItems();
    showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.57,
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter bottomSheetSetState) {
          return Container(
            padding: EdgeInsets.only(
              left: AppSizes.setWidth(20),
              right: AppSizes.setWidth(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: Languages.of(context).effects,
                  fontSize: AppSizes.setFontSize(24),
                  fontWeight: FontWeight.w700,
                ),
                const Divider(
                  color: AppColor.btnLightGrey,
                  thickness: 0.4,
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: AppSizes.setWidth(10)),
                        child: Image.asset(
                          AppAssets.icSearchFilled,
                          color: CustomAppColor.of(context).txtDarkGrey,
                          width: AppSizes.setWidth(22),
                          height: AppSizes.setHeight(22),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                        child: Image.asset(
                          AppAssets.icUnsaved,
                          color: CustomAppColor.of(context).txtDarkGrey,
                          width: AppSizes.setWidth(22),
                          height: AppSizes.setHeight(22),
                        ),
                      ),
                      // TabBar
                      Expanded(
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
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: AppColor.txtPurple,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(width: AppSizes.setWidth(3), color: AppColor.txtPurple),
                            insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(90)),
                          ),
                          tabs: tabList.map((tab) {
                            return Tab(
                              text: tab,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                        child: GridView.count(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          childAspectRatio: 0.90,
                          children: List.generate(
                            effectList.length,
                            (index) {
                              return Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      effectList[index].iconAsset,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: AppSizes.setHeight(40),
                                    top: AppSizes.setHeight(0),
                                    right: AppSizes.setWidth(0),
                                    left: AppSizes.setWidth(40),
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
                                        value: effectList[index].isSelected,
                                        onChanged: (bool? value) {
                                          bottomSheetSetState(() {
                                            for (int i = 0; i < effectList.length; i++) {
                                              effectList[i].isSelected = i == index;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.80,
                        children: List.generate(
                          effectList.length,
                          (index) {
                            return Image.asset(
                              effectList[index].iconAsset,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
