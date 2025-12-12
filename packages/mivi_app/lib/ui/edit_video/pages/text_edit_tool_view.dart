import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/sizer_utils.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class TextEditToolView extends StatefulWidget {
  final VoidCallback onDone;
  final ValueChanged<TextStyle>? onStyleChanged;
  final ValueChanged<TextAlign>? onAlignChanged;

  const TextEditToolView({
    super.key,
    required this.onDone,
    this.onStyleChanged,
    this.onAlignChanged,
  });

  @override
  State<TextEditToolView> createState() => _TextEditToolViewState();
}

class _TextEditToolViewState extends State<TextEditToolView> {
  final tabs = [
    Icons.text_fields,
    Icons.format_align_center,
    Icons.color_lens,
    Icons.auto_awesome,
  ];
  int selectedTabIndex = 0;
  String selectedFont = 'Poppins';
  double fontSize = 32;
  double letterSpacing = 0;
  double lineHeight = 1.2;
  TextAlign selectedAlign = TextAlign.center;
  List<String> fontFamilies = [
    'Poppins',
    'Roboto',
    'Lobster',
    'Pacifico',
    'Merriweather',
    'Dancing Script',
    'Oswald',
    'Playfair Display',
  ];
  final colors = [Colors.white, Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.cyan, Colors.blue, Colors.purple, Colors.pink, Colors.black];
  Color selectedColor = Colors.white;

  void _notifyStyleChange() {
    final style = GoogleFonts.getFont(
      selectedFont,
      color: selectedColor,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      height: lineHeight,
    );
    widget.onStyleChanged?.call(style);
    widget.onAlignChanged?.call(selectedAlign);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340.setHeight,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.setHeight),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Image.asset(
                    AppAssets.icUndo,
                    color: Colors.white,
                    height: 18.setHeight,
                    width: 18.setWidth,
                  ),
                  onPressed: widget.onDone,
                ),
                CommonText(
                  text: "Text",
                  textColor: Colors.white,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilySemiBold600,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.white, size: 22),
                      onPressed: widget.onDone,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 60.setWidth,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(tabs.length, (index) {
                      final isSelected = selectedTabIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => selectedTabIndex = index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white12 : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            tabs[index],
                            color: isSelected ? Colors.white : Colors.white54,
                            size: 22,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const VerticalDivider(color: Colors.white10, width: 1),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: SizedBox.expand(
                      child: [
                        fontTabView(),
                        alignTabView(),
                        colorTabView(),
                        fontStyleView(),
                      ][selectedTabIndex],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fontTabView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(text: "Font", textColor: Colors.white, fontSize: 14.setFontSize, fontWeight: FontWeight.bold),
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 2.setHeight),
                child: CommonText(
                  text: "Reset",
                  textColor: Colors.white,
                  fontSize: 8.setFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: fontFamilies.length,
              itemBuilder: (context, index) {
                final font = fontFamilies[index];
                final isSelected = selectedFont == font;
                return ListTile(
                  dense: true,
                  visualDensity: VisualDensity.comfortable,
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    setState(() => selectedFont = font);
                    _notifyStyleChange();
                  },
                  title: Text(
                    font,
                    style: GoogleFonts.getFont(font, color: Colors.white, fontSize: 18),
                  ),
                  trailing: isSelected ? const Icon(Icons.check, color: Colors.white) : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget alignTabView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(text: "Align", textColor: Colors.white, fontSize: 14.setFontSize, fontWeight: FontWeight.bold),
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 2.setHeight),
                child: CommonText(
                  text: "Reset",
                  textColor: Colors.white,
                  fontSize: 8.setFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _alignButton(Icons.format_align_left, TextAlign.left),
              _alignButton(Icons.format_align_center, TextAlign.center),
              _alignButton(Icons.format_align_right, TextAlign.right),
            ],
          ),
          const SizedBox(height: 20),
          _slider(AppAssets.icTextHeight, fontSize, 12, 72, (v) {
            setState(() => fontSize = v);
            _notifyStyleChange();
          }),
          _slider(AppAssets.icTextSpace, letterSpacing, 0, 10, (v) {
            setState(() => letterSpacing = v);
            _notifyStyleChange();
          }),
          _slider(AppAssets.icTextLineHeight, lineHeight, 0.8, 2.0, (v) {
            setState(() => lineHeight = v);
            _notifyStyleChange();
          }),
        ],
      ),
    );
  }

  Widget _alignButton(IconData icon, TextAlign align) {
    final isSelected = selectedAlign == align;
    return GestureDetector(
      onTap: () {
        setState(() => selectedAlign = align);
        _notifyStyleChange();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white12 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _slider(String label, double value, double min, double max, ValueChanged<double> onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.setHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            label,
            width: 18.setWidth,
            height: 18.setHeight,
          ),
          Expanded(
            child: Slider(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              value: value,
              min: min,
              max: max,
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              onChanged: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CommonText(
              text: value.toStringAsFixed(0),
              textColor: CustomAppColor.of(context).white,
            ),
          )
        ],
      ),
    );
  }

  Widget colorTabView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Color", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: colors.map((color) {
              final isSelected = selectedColor == color;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedColor = color);
                  _notifyStyleChange();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget fontStyleView() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Font Style",
                textColor: Colors.white,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.bold,
              ),
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 2.setHeight),
                child: CommonText(
                  text: "Reset",
                  textColor: Colors.white,
                  fontSize: 8.setFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: fontFamilies.length,
              padding: EdgeInsets.symmetric(vertical: 16.setWidth),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.8,
              ),
              itemBuilder: (context, index) {
                final font = fontFamilies[index];
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedFont = font);
                    _notifyStyleChange();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      font,
                      style: GoogleFonts.getFont(font, color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
