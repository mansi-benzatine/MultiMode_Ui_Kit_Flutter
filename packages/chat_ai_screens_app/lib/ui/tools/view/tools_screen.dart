import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../tools_list/view/tools_list_screen.dart';
import '../model/tools_data_model.dart';

class ToolsScreen extends StatefulWidget {
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  List<ToolsDataModel> toolsDataModelList = [];

  _fillData() {
    toolsDataModelList = [
      ToolsDataModel(
        title: Languages.of(context).txtWriting,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolWriting,
        type: Constant.toolWriting,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtEntertainment,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolEntertainment,
        type: Constant.toolEntertainment,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtCode,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolCode,
        type: Constant.toolCode,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtBusiness,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolBusiness,
        type: Constant.toolBusiness,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtSocialMedia,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolSocialMedia,
        type: Constant.toolSocialMedia,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtPersonal,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolPersonal,
        type: Constant.toolPersonal,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtRecipes,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolRecipes,
        type: Constant.toolRecipes,
      ),
      ToolsDataModel(
        title: Languages.of(context).txtTranslator,
        description: Languages.of(context).txtLoremIpsumDesc,
        image: AppAssets.icToolTranslator,
        type: Constant.toolTranslator,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        const IgnorePointer(ignoring: true, child: _TopBarView()),
        _ToolsListView(toolsDataModelList: toolsDataModelList),
      ],
    );
  }
}

class _TopBarView extends StatelessWidget {
  const _TopBarView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.setHeight),
      child: CommonText(
        text: Languages.of(context).txtTools,
        fontWeight: FontWeight.w800,
        fontSize: 24.setFontSize,
        textColor: CustomAppColor.of(context).txtBlack,
        height: 1,
        textAlign: TextAlign.start,
      ),
    );
  }
}

class _ToolsListView extends StatelessWidget {
  final List<ToolsDataModel> toolsDataModelList;

  const _ToolsListView({required this.toolsDataModelList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.setWidth,
          mainAxisSpacing: 15.setHeight,
          mainAxisExtent: 180.setHeight,
        ),
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 22.setWidth),
        itemCount: toolsDataModelList.length,
        itemBuilder: (context, index) {
          var item = toolsDataModelList[index];

          return _itemTools(context: context, item: item);
        },
      ),
    );
  }

  _itemTools({required BuildContext context, required ToolsDataModel item}) {
    return IgnorePointer(
      ignoring: true,
      child: InkWell(
        onTap: () {
          Navigator.push(context, ToolsListScreen.route(item: item));
        },
        child: Container(
          alignment: Alignment.center,
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
          padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 14.setHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                item.image,
                height: 60.setHeight,
                width: 60.setHeight,
              ),
              SizedBox(height: 10.setHeight),
              CommonText(
                text: item.title,
                fontWeight: FontWeight.w700,
                fontSize: 20.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
                height: 1,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
              SizedBox(height: 5.setHeight),
              Expanded(
                child: CommonText(
                  text: item.description,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                  height: 1.3,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
