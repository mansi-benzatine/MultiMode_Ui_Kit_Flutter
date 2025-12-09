import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text_field/text_form_field.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddNoteScreen());
  }

  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> implements TopBarClickListener {
  final TextEditingController addNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtAddNote,
            isShowBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonTextFormField(
                controller: addNoteController,
                hintText: Languages.of(context).txtAddANote,
                borderColor: CustomAppColor.of(context).bgScreen,
                fillColor: CustomAppColor.of(context).bgScreen,
                radius: 0,
                maxLines: 5,
                minLines: 5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonButton(
              text: Languages.of(context).txtDone,
              onTap: () {
                Navigator.pop(context, addNoteController.text); // return note
              },
            ),
          ),
          SizedBox(height: 45.setHeight)
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    Navigator.pop(context, addNoteController.text); // return value on back
  }
}
