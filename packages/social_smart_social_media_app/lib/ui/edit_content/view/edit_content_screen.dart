import 'package:flutter/material.dart';
import 'package:social_smart_social_media_app_package/utils/utils.dart';

import '../../../../../../../ui/add_media/view/add_media_screen.dart';
import '../../../../../../../ui/add_post_details/view/add_post_details_screen.dart';
import '../../../../../../../ui/see_live/view/see_live_screen.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../add_sounds/view/add_sound_screen.dart';
import '../../create_posts/datamodel/create_posts_data.dart';

class EditContentScreen extends StatefulWidget {
  final bool? isGoLiveScreen;
  const EditContentScreen({super.key, this.isGoLiveScreen});

  static Route route({bool? isGoLiveScreen}) {
    return MaterialPageRoute(
      builder: (context) => EditContentScreen(
        isGoLiveScreen: isGoLiveScreen,
      ),
    );
  }

  @override
  State<EditContentScreen> createState() => _EditContentScreenState();
}

class _EditContentScreenState extends State<EditContentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.black,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgCreateContent,
              width: AppSizes.fullWidth,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: widget.isGoLiveScreen ?? false ? AppSizes.setHeight(65) : AppSizes.setHeight(90),
              right: AppSizes.setWidth(10),
              child: _createContentIcon(),
            ),
            Positioned(
              top: AppSizes.setHeight(60),
              left: AppSizes.setWidth(10),
              child: topIcons(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.setWidth(20),
                  vertical: AppSizes.setHeight(10),
                ),
                child: postButtons(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createContentIcon() {
    final List<IconItem> items = widget.isGoLiveScreen ?? false ? goLiveItems(context: context) : postItems(context: context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.isGoLiveScreen ?? false,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AppAssets.icSetting,
              scale: 4,
            ),
          ),
        ),
        Column(
          children: [
            ...items.map((item) => iconList(item: item)),
          ],
        ),
      ],
    );
  }

  Widget iconList({required item}) {
    return Column(
      children: [
        Image.asset(
          item.iconAsset,
          width: AppSizes.setWidth(26),
          height: AppSizes.setHeight(26),
          color: CustomAppColor.of(context).white,
        ),
        SizedBox(height: AppSizes.setHeight(5)),
        CommonText(
          text: item.label,
          overflow: TextOverflow.ellipsis,
          textColor: AppColor.txtWhite,
          fontSize: AppSizes.setFontSize(12),
        ),
        SizedBox(height: AppSizes.setHeight(18))
      ],
    );
  }

  Widget topIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: (widget.isGoLiveScreen ?? false),
          child: IconButton(
            onPressed: () => Navigator.push(context, AddMediaScreen.route()),
            icon: const Icon(
              Icons.clear,
              color: AppColor.white,
            ),
          ),
        ),
        Visibility(
          visible: !(widget.isGoLiveScreen ?? false),
          child: IconButton(
            onPressed: () => Navigator.push(context, AddMediaScreen.route()),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.fullWidth / 4),
          child: GestureDetector(
            onTap: () => Navigator.push(context, AddSoundScreen.route()),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(2)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.black.withOpacityPercent(0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    AppAssets.icMusic,
                    scale: 4,
                  ),
                  SizedBox(width: AppSizes.setWidth(4)),
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
      ],
    );
  }

  Widget postButtons(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: !(widget.isGoLiveScreen ?? true),
          child: Flexible(
            child: CommonButton(
              useSimpleStyle: true,
              child: CommonText(
                text: Languages.of(context).postToStory,
                fontWeight: FontWeight.w700,
                fontSize: AppSizes.setFontSize(14),
                textColor: CustomAppColor.of(context).txtPurple,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: CommonButton(
            isShadowButton: true,
            onTap: () {
              if (widget.isGoLiveScreen ?? false) {
                Navigator.push(context, SeeLiveScreen.route());
              } else {
                Navigator.push(context, AddPostDetailsScreen.route());
              }
            },
            height: AppSizes.setHeight(52),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.isGoLiveScreen ?? false,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppSizes.setWidth(6)),
                    child: Image.asset(
                      AppAssets.icVideos,
                      color: AppColor.white,
                      width: AppSizes.setWidth(20),
                      height: AppSizes.setHeight(20),
                    ),
                  ),
                ),
                CommonText(
                  text: widget.isGoLiveScreen ?? false ? Languages.of(context).goLiveNow : Languages.of(context).next,
                  textColor: AppColor.txtWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.setFontSize(15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
