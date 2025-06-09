import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../../../../../localization/language/languages.dart';
import '../../../../../../../ui/create_posts/view/create_post_screen.dart';
import '../../../../../../../ui/edit_content/view/edit_content_screen.dart';
import '../../../../../../../utils/app_assets.dart';
import '../../../../../../../utils/app_color.dart';
import '../../../../../../../utils/sizer_utils.dart';
import '../../../../../../../utils/string_constant.dart';
import '../../../../../../../widgets/text/common_text.dart';
import '../../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../widgets/button/common_button.dart';
import '../datamodel/add_post_details_data.dart';

class AddPostDetailsScreen extends StatefulWidget {
  const AddPostDetailsScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const AddPostDetailsScreen(),
    );
  }

  @override
  State<AddPostDetailsScreen> createState() => _AddPostDetailsScreenState();
}

class _AddPostDetailsScreenState extends State<AddPostDetailsScreen> {
  Map<int, bool> switchState = {};
  final TextEditingController _controller = TextEditingController(
      text:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n#viral #handsome #man");
  @override
  void initState() {
    super.initState();
    switchState = {
      0: true,
      1: true,
      2: false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          centerTitle: false,
          titleSpacing: 0,
          leading: IgnorePointer(
            ignoring: true,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    CreatePostScreen.route(
                        isVideoSelected: false, isTemplateSelected: false, isPhotoSelected: false, isCameraSelected: false, currentIndex: 0));
              },
            ),
          ),
          title: CommonText(
            text: Languages.of(context).post,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      postDetails(),
                      postDetailsButtons(),
                      const Divider(),
                      postDetailsActionList(),
                      socialIcons(),
                    ],
                  ),
                ),
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: postButtons(context)),
          ],
        ),
      ),
    );
  }

  Widget postDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CommonTextFormField(
            maxLines: 5,
            controller: _controller,
          ),
        ),
        SizedBox(width: AppSizes.setWidth(12)),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppAssets.imgEditContent,
                width: AppSizes.setWidth(95),
                height: AppSizes.setHeight(130),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: AppSizes.setHeight(5),
              left: AppSizes.setWidth(0),
              right: AppSizes.setWidth(0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CommonText(
                  text: Languages.of(context).selectCover,
                  textColor: CustomAppColor.of(context).white,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(9),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget postDetailsButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        postDetailsButton(text: Languages.of(context).hashTags.replaceAll(RegExp(r's$'), ''), iconPath: AppAssets.icHashTagFilled),
        postDetailsButton(text: Languages.of(context).mention, iconPath: AppAssets.icMention),
        postDetailsButton(text: Languages.of(context).videos, iconPath: AppAssets.icVideos),
      ],
    );
  }

  Widget postDetailsButton({required String text, required String iconPath}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(5), vertical: AppSizes.setHeight(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10), vertical: AppSizes.setHeight(3)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColor.btnGradiant1,
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  iconPath,
                  scale: 4,
                ),
                SizedBox(width: AppSizes.setWidth(4)),
                CommonText(
                  text: text,
                  fontSize: AppSizes.setFontSize(13),
                  textColor: AppColor.btnGradiant1,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget postDetailsActionList() {
    return Column(
      children: List.generate(addPostDetailsItemList(context).length, (index) {
        AddPostDetailItems item = addPostDetailsItemList(context)[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: AppSizes.setWidth(50),
              child: Image.asset(
                item.detailIcon ?? '',
                width: AppSizes.setWidth(23),
                height: AppSizes.setHeight(23),
                color: CustomAppColor.of(context).icBlack,
              ),
            ),
            SizedBox(width: AppSizes.setWidth(8)),
            Expanded(
              child: CommonText(
                text: item.detail ?? '',
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
                textAlign: TextAlign.start,
              ),
            ),
            item.actionIcon ?? false
                ? IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                    child: FlutterSwitch(
                      value: switchState[index] ?? false,
                      onToggle: (bool value) {
                        setState(() {
                          switchState[index] = value;
                        });
                      },
                      activeColor: AppColor.btnGradiant2,
                      inactiveColor: Colors.grey.shade400,
                      activeToggleColor: Colors.white,
                      inactiveToggleColor: Colors.white,
                      width: AppSizes.setWidth(42),
                      height: AppSizes.setHeight(24),
                      toggleSize: 19.0,
                      borderRadius: 20.0,
                      padding: 2,
                    ),
                  ),
          ],
        );
      }),
    );
  }

  Widget postButtons(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border.all(
          color: CustomAppColor.of(context).txtDarkGrey.withOpacityPercent(0.5),
          width: 0.5,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(25)),
      child: Row(
        children: [
          Flexible(
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                height: AppSizes.setHeight(48),
                useSimpleStyle: true,
                radius: 20,
                buttonColor: AppColor.btnPink,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icDraft,
                      width: AppSizes.setWidth(18),
                      height: AppSizes.setHeight(18),
                      color: CustomAppColor.of(context).txtPurple,
                    ),
                    SizedBox(width: AppSizes.setWidth(10)),
                    CommonText(
                      text: Languages.of(context).drafts,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(13),
                      textColor: CustomAppColor.of(context).txtPurple,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                isShadowButton: true,
                onTap: () => Navigator.push(context, EditContentScreen.route(isGoLiveScreen: true)),
                borderColor: AppColor.transparent,
                height: AppSizes.setHeight(48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.icSent,
                      width: AppSizes.setWidth(18),
                      height: AppSizes.setHeight(18),
                    ),
                    SizedBox(width: AppSizes.setWidth(10)),
                    CommonText(
                      text: Languages.of(context).post,
                      textColor: AppColor.txtWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget socialIcons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: AppStrings.automaticallyShareTo,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(16),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
            child: Row(
              children: List.generate(iconAssets.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: AppSizes.setWidth(10)),
                  child: Container(
                    width: AppSizes.setWidth(40),
                    height: AppSizes.setHeight(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.btnGradiant1.withOpacityPercent(0.2),
                    ),
                    child: Image.asset(
                      iconAssets[index],
                      scale: 4.5,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
