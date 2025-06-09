import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../tools/model/tools_data_model.dart';
import '../model/tools_list_data_model.dart';

class ToolsListScreen extends StatefulWidget {
  final ToolsDataModel item;

  const ToolsListScreen({super.key, required this.item});

  static Route<void> route({required ToolsDataModel item}) {
    return MaterialPageRoute<void>(builder: (_) => ToolsListScreen(item: item));
  }

  @override
  State<ToolsListScreen> createState() => _ToolsListScreenState();
}

class _ToolsListScreenState extends State<ToolsListScreen> implements TopBarClickListener {
  List<ToolsListDataModel> toolsDataModelList = [];

  _fillData() {
    toolsDataModelList = (widget.item.type == Constant.toolWriting)
        ? [
            ToolsListDataModel(
              title: Languages.of(context).txtArticles,
              description: Languages.of(context).txtLoremIpsumDesc,
              image: AppAssets.icToolWritingArticles,
              type: Constant.toolWritingArticles,
            ),
            ToolsListDataModel(
              title: Languages.of(context).txtAcademicWriter,
              description: Languages.of(context).txtLoremIpsumDesc,
              image: AppAssets.icToolWritingAcademicWriter,
              type: Constant.toolWritingAcademicWriter,
            ),
            ToolsListDataModel(
              title: Languages.of(context).txtSummarize,
              description: Languages.of(context).txtLoremIpsumDesc,
              image: AppAssets.icToolWritingSummarize,
              type: Constant.toolWritingSummarize,
            ),
          ]
        : (widget.item.type == Constant.toolEntertainment)
            ? [
                ToolsListDataModel(
                  title: Languages.of(context).txtMusic,
                  description: Languages.of(context).txtLoremIpsumDesc,
                  image: AppAssets.icToolEntertainmentMusic,
                  type: Constant.toolEntertainmentMusic,
                ),
                ToolsListDataModel(
                  title: Languages.of(context).txtMovieScript,
                  description: Languages.of(context).txtLoremIpsumDesc,
                  image: AppAssets.icToolEntertainmentMovieScript,
                  type: Constant.toolEntertainmentMovieScript,
                ),
                ToolsListDataModel(
                  title: Languages.of(context).txtStoryteller,
                  description: Languages.of(context).txtLoremIpsumDesc,
                  image: AppAssets.icToolEntertainmentStoryteller,
                  type: Constant.toolEntertainmentStoryteller,
                ),
                ToolsListDataModel(
                  title: Languages.of(context).txtPoems,
                  description: Languages.of(context).txtLoremIpsumDesc,
                  image: AppAssets.icToolEntertainmentPoems,
                  type: Constant.toolEntertainmentPoems,
                ),
                ToolsListDataModel(
                  title: Languages.of(context).txtJokes,
                  description: Languages.of(context).txtLoremIpsumDesc,
                  image: AppAssets.icToolEntertainmentJokes,
                  type: Constant.toolEntertainmentJokes,
                ),
              ]
            : (widget.item.type == Constant.toolCode)
                ? [
                    ToolsListDataModel(
                      title: Languages.of(context).txtWriteCode,
                      description: Languages.of(context).txtLoremIpsumDesc,
                      image: AppAssets.icToolCodeWriteCode,
                      type: Constant.toolCodeWriteCode,
                    ),
                    ToolsListDataModel(
                      title: Languages.of(context).txtExplainCode,
                      description: Languages.of(context).txtLoremIpsumDesc,
                      image: AppAssets.icToolCodeExplainCode,
                      type: Constant.toolCodeExplainCode,
                    ),
                  ]
                : (widget.item.type == Constant.toolBusiness)
                    ? [
                        ToolsListDataModel(
                          title: Languages.of(context).txtEmail,
                          description: Languages.of(context).txtLoremIpsumDesc,
                          image: AppAssets.icToolBusinessEmail,
                          type: Constant.toolBusinessEmail,
                        ),
                        ToolsListDataModel(
                          title: Languages.of(context).txtInterviewerAnswers,
                          description: Languages.of(context).txtLoremIpsumDesc,
                          image: AppAssets.icToolBusinessInterviewerAnswers,
                          type: Constant.toolBusinessInterviewerAnswers,
                        ),
                        ToolsListDataModel(
                          title: Languages.of(context).txtJobPost,
                          description: Languages.of(context).txtLoremIpsumDesc,
                          image: AppAssets.icToolBusinessJobPost,
                          type: Constant.toolBusinessJobPost,
                        ),
                        ToolsListDataModel(
                          title: Languages.of(context).txtAdvertisement,
                          description: Languages.of(context).txtLoremIpsumDesc,
                          image: AppAssets.icToolBusinessAdvertisement,
                          type: Constant.toolBusinessAdvertisement,
                        ),
                      ]
                    : (widget.item.type == Constant.toolSocialMedia)
                        ? [
                            ToolsListDataModel(
                              title: Languages.of(context).txtLinkedin,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaLinkedin,
                              type: Constant.toolSocialMediaLinkedin,
                            ),
                            ToolsListDataModel(
                              title: Languages.of(context).txtInstagram,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaInstagram,
                              type: Constant.toolSocialMediaInstagram,
                            ),
                            ToolsListDataModel(
                              title: Languages.of(context).txtTelegram,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaTelegram,
                              type: Constant.toolSocialMediaTelegram,
                            ),
                            ToolsListDataModel(
                              title: Languages.of(context).txtWhatsApp,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaWhatsapp,
                              type: Constant.toolSocialMediaWhatsapp,
                            ),
                            ToolsListDataModel(
                              title: Languages.of(context).txtFacebook,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaFacebook,
                              type: Constant.toolSocialMediaFacebook,
                            ),
                            ToolsListDataModel(
                              title: Languages.of(context).txtTwitter,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaTwitter,
                              type: Constant.toolSocialMediaTwitter,
                            ),
                            ToolsListDataModel(
                              title: Languages.of(context).txtTikTok,
                              description: Languages.of(context).txtLoremIpsumDesc,
                              image: AppAssets.icToolSocialMediaTiktok,
                              type: Constant.toolSocialMediaTiktok,
                            ),
                          ]
                        : (widget.item.type == Constant.toolPersonal)
                            ? [
                                ToolsListDataModel(
                                  title: Languages.of(context).txtBirthday,
                                  description: Languages.of(context).txtLoremIpsumDesc,
                                  image: AppAssets.icToolPersonalBirthday,
                                  type: Constant.toolPersonalBirthday,
                                ),
                                ToolsListDataModel(
                                  title: Languages.of(context).txtApology,
                                  description: Languages.of(context).txtLoremIpsumDesc,
                                  image: AppAssets.icToolPersonalApology,
                                  type: Constant.toolPersonalApology,
                                ),
                                ToolsListDataModel(
                                  title: Languages.of(context).txtInvitation,
                                  description: Languages.of(context).txtLoremIpsumDesc,
                                  image: AppAssets.icToolPersonalInvitation,
                                  type: Constant.toolPersonalInvitation,
                                ),
                                ToolsListDataModel(
                                  title: Languages.of(context).txtHealth,
                                  description: Languages.of(context).txtLoremIpsumDesc,
                                  image: AppAssets.icToolPersonalHealth,
                                  type: Constant.toolPersonalHealth,
                                ),
                              ]
                            : (widget.item.type == Constant.toolRecipes)
                                ? [
                                    ToolsListDataModel(
                                      title: Languages.of(context).txtFoodRecipes,
                                      description: Languages.of(context).txtLoremIpsumDesc,
                                      image: AppAssets.icToolRecipesFoodRecipes,
                                      type: Constant.toolRecipesFoodRecipes,
                                    ),
                                    ToolsListDataModel(
                                      title: Languages.of(context).txtDietPlan,
                                      description: Languages.of(context).txtLoremIpsumDesc,
                                      image: AppAssets.icToolRecipesDietPlan,
                                      type: Constant.toolRecipesDietPlan,
                                    ),
                                  ]
                                : (widget.item.type == Constant.toolTranslator)
                                    ? [
                                        ToolsListDataModel(
                                          title: Languages.of(context).txtTranslator,
                                          description: Languages.of(context).txtLoremIpsumDesc,
                                          image: AppAssets.icToolTranslatorTranslator,
                                          type: Constant.toolTranslatorTranslator,
                                        ),
                                      ]
                                    : [];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            IgnorePointer(ignoring: true, child: TopBar(this, title: widget.item.title)),
            _ToolsListView(toolsDataModelList: toolsDataModelList),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class _ToolsListView extends StatelessWidget {
  final List<ToolsListDataModel> toolsDataModelList;

  const _ToolsListView({required this.toolsDataModelList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: toolsDataModelList.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 15.setWidth),
        itemBuilder: (context, index) {
          var item = toolsDataModelList[index];

          return _itemTools(context: context, item: item);
        },
      ),
    );
  }

  _itemTools({required BuildContext context, required ToolsListDataModel item}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomAppColor.of(context).listTileColor),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.2),
            blurRadius: 0,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: CustomAppColor.of(context).txtWhite,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.setHeight, vertical: 18.setHeight),
      margin: EdgeInsets.only(bottom: 10.setHeight),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: item.title,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  height: 1,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
                SizedBox(height: 8.setHeight),
                CommonText(
                  text: item.description,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                  height: 1.2,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(width: 15.setWidth),
          Image.asset(
            item.image,
            height: 55.setHeight,
            width: 55.setHeight,
            gaplessPlayback: true,
          )
        ],
      ),
    );
  }
}
