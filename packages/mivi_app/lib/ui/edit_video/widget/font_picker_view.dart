import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

class FontPickerView extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<TextStyle> onFontSelected;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onDone;

  const FontPickerView({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onFontSelected,
    required this.onTextChanged,
    required this.onDone,
  });

  @override
  State<FontPickerView> createState() => _FontPickerViewState();
}

class _FontPickerViewState extends State<FontPickerView> {
  int selectedFontIndex = 0;

  final List<TextStyle Function()> fontStyles = [
    () => GoogleFonts.roboto(),
    () => GoogleFonts.pacifico(),
    () => GoogleFonts.dancingScript(),
    () => GoogleFonts.lato(),
    () => GoogleFonts.swankyAndMooMoo(),
    () => GoogleFonts.sixtyfour(),
    () => GoogleFonts.amaticSc(),
    () => GoogleFonts.indieFlower(),
    () => GoogleFonts.yanoneKaffeesatz(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedStyle = fontStyles[selectedFontIndex]().copyWith(color: Colors.white);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            autofocus: true,
            textAlign: TextAlign.center,
            style: selectedStyle.copyWith(fontSize: 26),
            cursorColor: Colors.white,
            onChanged: widget.onTextChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Type something...",
              hintStyle: TextStyle(color: Colors.white54, package: "mivi_app", fontFamily: Constant.fontFamilyMedium500),
            ),
          ),
        ),
        SizedBox(height: 20.setHeight),
        SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: fontStyles.length,
            itemBuilder: (context, index) {
              final isSelected = selectedFontIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedFontIndex = index);
                  widget.onFontSelected(fontStyles[index]());
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white24 : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.white30,
                    ),
                  ),
                  child: Text(
                    "Aa",
                    style: fontStyles[index]().copyWith(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
