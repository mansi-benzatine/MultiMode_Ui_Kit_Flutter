import 'package:flutter/material.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/add_sound_data.dart';

class AddSoundScreen extends StatefulWidget {
  const AddSoundScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AddSoundScreen(),
    );
  }

  @override
  State<AddSoundScreen> createState() => _AddSoundScreenState();
}

class _AddSoundScreenState extends State<AddSoundScreen> with TickerProviderStateMixin {
  List<String> tabList = [];
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabList = [
      Languages.of(context).songs,
      Languages.of(context).favorite,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IgnorePointer(ignoring: true, child: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.clear))),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.fullWidth / 5),
            child: Row(
              children: [
                CommonText(
                  text: Languages.of(context).sounds,
                  fontSize: AppSizes.setFontSize(20),
                  fontWeight: FontWeight.w700,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
              child: CommonTextFormField(
                hintText: Languages.of(context).search,
                hintStyle: const TextStyle(
                  color: AppColor.btnLightGrey,
                ),
                leadingIcon: Image.asset(
                  AppAssets.icSearchFilled,
                  scale: 5.5,
                  color: AppColor.grey,
                ),
              ),
            ),
            Expanded(child: searchFromTabBar())
          ],
        ),
      ),
    );
  }

  Widget searchFromTabBar() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
          child: TabBar(
            controller: _controller,
            tabAlignment: TabAlignment.center,
            labelPadding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(50)),
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
              insets: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(100)),
            ),
            tabs: tabList.map((tab) {
              return Tab(
                text: tab,
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              soundTabView(),
              soundTabView(),
            ],
          ),
        ),
      ],
    );
  }

  Widget soundTabView({int? soundLength}) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(12)),
      itemCount: soundLength ?? soundsList.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final sound = soundsList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < soundsList.length; i++) {
                      if (soundsList[i].isSongSaved == null) soundsList[i].isSongSaved = false;
                    }
                    sound.isSongSaved = null;
                  });
                },
                child: Stack(
                  children: [
                    Image.asset(
                      sound.post ?? '',
                      fit: BoxFit.fill,
                      height: AppSizes.setHeight(78),
                      width: AppSizes.setWidth(78),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Positioned.fill(
                      child: Image.asset(AppAssets.icPlay, scale: 2.5),
                    )
                  ],
                ),
              ),
              SizedBox(width: AppSizes.setWidth(12)),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonText(
                      text: sound.soundName ?? '',
                      fontSize: AppSizes.setFontSize(15),
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: AppSizes.setHeight(6)),
                    CommonText(
                      text: sound.userName ?? '',
                      fontSize: AppSizes.setFontSize(14),
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtDarkGrey,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: AppSizes.setHeight(6)),
                    CommonText(
                      text: sound.time ?? '',
                      fontSize: AppSizes.setFontSize(14),
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtDarkGrey,
                    ),
                  ],
                ),
              ),
              CommonText(
                text: sound.soundCount ?? '',
                fontSize: AppSizes.setFontSize(13),
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtDarkGrey,
              ),
              SizedBox(width: AppSizes.setWidth(8)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (sound.isSongSaved == null) {
                      sound.isSongSaved = false;
                    } else {
                      sound.isSongSaved = !(sound.isSongSaved ?? false);
                    }
                  });
                },
                child: Image.asset(
                  sound.isSongSaved == null ? AppAssets.icOk : (sound.isSongSaved == true ? AppAssets.icSaved : AppAssets.icUnsaved),
                  scale: 4.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
