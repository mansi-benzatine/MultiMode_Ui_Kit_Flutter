import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text_field/text_form_field.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  final TextEditingController noteController;

  static Route<void> route({required TextEditingController noteController}) {
    return MaterialPageRoute(builder: (_) => EditNoteScreen(noteController: noteController));
  }

  const EditNoteScreen({super.key, required this.noteController});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtEditNote,
            isShowBack: true,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonTextFormField(
                controller: widget.noteController,
                hintText: Languages.of(context).txtAddANote,
                fillColor: CustomAppColor.of(context).bgScreen,
                radius: 0,
                maxLines: 5,
                minLines: 5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtDone,
                    buttonColor: const Color(0xFFFFF4F4),
                    borderColor: const Color(0xFFFFF4F4),
                    buttonTextColor: CustomAppColor.of(context).primary,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtDone,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 45.setHeight)
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
