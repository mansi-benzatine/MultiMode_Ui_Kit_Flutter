import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/utils/app_color.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';
import 'package:step_counter_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';
import '../model/instructions_data_model.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const InstructionsScreen());
  }

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> implements TopBarClickListener {
  List<InstructionsDataModel> instructionsDataList = [
    InstructionsDataModel(
      title: "How to use?",
      content: "Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat aute irure dolor",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Counting when shaking phone?",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Counting when driving?",
      content: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Accuracy",
      content: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Placement Suggestion",
      content: "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque.",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Battery Saving",
      content: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae.",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Privacy",
      content: "Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis.",
      isExpanded: false,
    ),
    InstructionsDataModel(
      title: "Calories & Distance",
      content: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius.",
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtInstruction.toUpperCase(),
            textAlign: Alignment.centerLeft,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 20.setHeight, bottom: 0.bottomPadding),
              child: Column(
                children: List.generate(instructionsDataList.length, (index) => _buildExpandableItem(index, instructionsDataList[index].title, instructionsDataList[index].content)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableItem(int index, String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(width: 1.5, color: instructionsDataList[index].isExpanded ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerLightAndDark),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              instructionsDataList[index].isExpanded = !instructionsDataList[index].isExpanded;
              setState(() {});
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: title,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtPrimary,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  AnimatedRotation(
                    turns: instructionsDataList[index].isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 24.setWidth,
                      height: 24.setHeight,
                      decoration: BoxDecoration(
                        color: instructionsDataList[index].isExpanded ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerWhiteAndBlack,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: CustomAppColor.of(context).primary),
                      ),
                      child: Icon(
                        instructionsDataList[index].isExpanded ? Icons.remove_rounded : Icons.add_rounded,
                        color: instructionsDataList[index].isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: instructionsDataList[index].isExpanded ? null : 0,
            child: instructionsDataList[index].isExpanded
                ? Container(
                    padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, bottom: 16.setHeight),
                    child: CommonText(
                      text: content,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtDarkGray,
                      textAlign: TextAlign.start,
                      maxLines: null,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
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
