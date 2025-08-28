import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

enum ColorCategory { primary, accent, blackWhite }

class SelectColorBottomSheetDialog extends StatefulWidget {
  final Color? initialColor;
  final Function(Color)? onColorSelected;

  const SelectColorBottomSheetDialog({
    super.key,
    this.initialColor,
    this.onColorSelected,
  });

  @override
  State<SelectColorBottomSheetDialog> createState() => _SelectColorBottomSheetDialogState();
}

class _SelectColorBottomSheetDialogState extends State<SelectColorBottomSheetDialog> {
  ColorCategory selectedCategory = ColorCategory.primary;
  Color selectedColor = const Color(0xFFEE5B4A); // Default red color
  Color selectedShade = const Color(0xFFEE5B4A);

  // Primary colors
  final List<Color> primaryColors = [
    const Color(0xFFEE5B4A), // Red
    const Color(0xFFE91E63), // Pink
    const Color(0xFF9C27B0), // Purple
    const Color(0xFF673AB7), // Deep Purple
    const Color(0xFF3F51B5), // Indigo
    const Color(0xFF2196F3), // Blue
    const Color(0xFF03A9F4), // Light Blue
    const Color(0xFF00BCD4), // Cyan
    const Color(0xFF009688), // Teal
    const Color(0xFF4CAF50), // Green
    const Color(0xFF8BC34A), // Light Green
    const Color(0xFFCDDC39), // Lime
    const Color(0xFFFFC107), // Amber
    const Color(0xFFFF9800), // Orange
    const Color(0xFFFF5722), // Deep Orange
    const Color(0xFF795548), // Brown
    const Color(0xFF607D8B), // Blue Grey
    const Color(0xFF9E9E9E), // Grey
  ];

  // Accent colors
  final List<Color> accentColors = [
    const Color(0xFFFF5252), // Red Accent
    const Color(0xFFE91E63), // Pink Accent
    const Color(0xFF9C27B0), // Purple Accent
    const Color(0xFF673AB7), // Deep Purple Accent
    const Color(0xFF3F51B5), // Indigo Accent
    const Color(0xFF2196F3), // Blue Accent
    const Color(0xFF00BCD4), // Cyan Accent
    const Color(0xFF009688), // Teal Accent
    const Color(0xFF4CAF50), // Green Accent
    const Color(0xFF8BC34A), // Light Green Accent
    const Color(0xFFCDDC39), // Lime Accent
    const Color(0xFFFFC107), // Amber Accent
    const Color(0xFFFF9800), // Orange Accent
  ];

  // Black & White colors
  final List<Color> blackWhiteColors = [
    const Color(0xFF000000), // Black
    const Color(0xFF212121), // Dark Grey
    const Color(0xFF424242), // Dark Grey
    const Color(0xFF616161), // Medium Grey
    const Color(0xFF757575), // Medium Grey
    const Color(0xFF9E9E9E), // Grey
    const Color(0xFFBDBDBD), // Light Grey
    const Color(0xFFE0E0E0), // Light Grey
    const Color(0xFFEEEEEE), // Very Light Grey
    const Color(0xFFF5F5F5), // Very Light Grey
    const Color(0xFFFAFAFA), // Almost White
    const Color(0xFFFFFFFF), // White
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialColor != null) {
      selectedColor = widget.initialColor!;
      selectedShade = widget.initialColor!;
    }
  }

  List<Color> get currentColors {
    switch (selectedCategory) {
      case ColorCategory.primary:
        return primaryColors;
      case ColorCategory.accent:
        return accentColors;
      case ColorCategory.blackWhite:
        return blackWhiteColors;
    }
  }

  List<Color> getShades(Color baseColor) {
    // Special handling for black, white, and grey colors
    if (_isGreyscale(baseColor)) {
      return _getGreyscaleShades();
    }

    final HSVColor hsvColor = HSVColor.fromColor(baseColor);
    List<Color> shades = [];

    // Generate lighter shades by reducing saturation and increasing value
    shades.add(hsvColor.withSaturation(0.2).withValue(0.95).toColor());
    shades.add(hsvColor.withSaturation(0.4).withValue(0.9).toColor());

    // Add the base color
    shades.add(baseColor);

    // Generate darker shades by increasing saturation and reducing value
    shades.add(hsvColor.withSaturation(1.0).withValue(0.8).toColor());
    shades.add(hsvColor.withSaturation(1.0).withValue(0.6).toColor());
    shades.add(hsvColor.withSaturation(1.0).withValue(0.4).toColor());
    shades.add(hsvColor.withSaturation(1.0).withValue(0.2).toColor());

    return shades.take(10).toList();
  }

  bool _isGreyscale(Color color) {
    // Check if the color is black, white, or grey (R=G=B or very close)
    final rg = (color.r - color.g).abs();
    final rb = (color.r - color.b).abs();
    final gb = (color.g - color.b).abs();

    return rg <= 10 && rb <= 10 && gb <= 10;
  }

  List<Color> _getGreyscaleShades() {
    return [
      const Color(0xFFF5F5F5), // Very light grey
      const Color(0xFFEEEEEE), // Light grey
      const Color(0xFFE0E0E0), // Light grey
      const Color(0xFFBDBDBD), // Medium light grey
      const Color(0xFF9E9E9E), // Medium grey
      const Color(0xFF757575), // Medium dark grey
      const Color(0xFF616161), // Dark grey
      const Color(0xFF424242), // Very dark grey
      const Color(0xFF212121), // Almost black
      const Color(0xFF000000), // Black
    ];
  }

  String getColorName(Color color) {
    if (color == const Color(0xFFEE5B4A)) return "Red";
    if (color == const Color(0xFFE91E63)) return "Pink";
    if (color == const Color(0xFF9C27B0)) return "Purple";
    if (color == const Color(0xFF673AB7)) return "Deep Purple";
    if (color == const Color(0xFF3F51B5)) return "Indigo";
    if (color == const Color(0xFF2196F3)) return "Blue";
    if (color == const Color(0xFF03A9F4)) return "Light Blue";
    if (color == const Color(0xFF00BCD4)) return "Cyan";
    if (color == const Color(0xFF009688)) return "Teal";
    if (color == const Color(0xFF4CAF50)) return "Green";
    if (color == const Color(0xFF8BC34A)) return "Light Green";
    if (color == const Color(0xFFCDDC39)) return "Lime";
    if (color == const Color(0xFFFFC107)) return "Amber";
    if (color == const Color(0xFFFF9800)) return "Orange";
    if (color == const Color(0xFFFF5722)) return "Deep Orange";
    if (color == const Color(0xFF795548)) return "Brown";
    if (color == const Color(0xFF607D8B)) return "Blue Grey";
    if (color == const Color(0xFF9E9E9E)) return "Grey";
    if (color == const Color(0xFF000000)) return "Black";
    if (color == const Color(0xFFFFFFFF)) return "White";
    return "Custom";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.setHeight),
            topRight: Radius.circular(20.setHeight),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Padding(
              padding: EdgeInsets.all(20.setWidth),
              child: CommonText(
                text: Languages.of(context).txtSelectColor,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).primary,
              ),
            ),

            // Category tabs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Row(
                children: [
                  Expanded(
                    child: _buildCategoryTab(Languages.of(context).txtPrimary, ColorCategory.primary),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: _buildCategoryTab(Languages.of(context).txtAccent, ColorCategory.accent),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: _buildCategoryTab(Languages.of(context).txtBlackWhite, ColorCategory.blackWhite),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.setHeight),

            // Color grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Wrap(
                spacing: 12.setWidth,
                runSpacing: 12.setHeight,
                children: currentColors.map((color) => _buildColorCircle(color, false)).toList(),
              ),
            ),

            SizedBox(height: 30.setHeight),

            // Color shade section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtSelectColorShade,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 15.setHeight),
                  Wrap(
                    spacing: 8.setWidth,
                    runSpacing: 8.setHeight,
                    children: getShades(selectedColor).map((shade) => _buildColorCircle(shade, true)).toList(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.setHeight),

            // Color name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonText(
                text: "${getColorName(selectedColor)} (500) ${getColorName(selectedShade)}",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtGray,
              ),
            ),

            SizedBox(height: 30.setHeight),

            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtCancel.toUpperCase(),
                      buttonColor: Colors.transparent,
                      buttonTextColor: CustomAppColor.of(context).primary,
                      height: 45.setHeight,
                      borderColor: CustomAppColor.of(context).primary,
                      buttonTextSize: 14.setFontSize,
                      buttonTextWeight: FontWeight.w500,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 15.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtOk.toUpperCase(),
                      buttonColor: CustomAppColor.of(context).primary,
                      buttonTextColor: CustomAppColor.of(context).white,
                      height: 45.setHeight,
                      buttonTextSize: 14.setFontSize,
                      buttonTextWeight: FontWeight.w500,
                      onTap: () {
                        if (widget.onColorSelected != null) {
                          widget.onColorSelected!(selectedShade);
                        }
                        Navigator.pop(context, selectedShade);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTab(String title, ColorCategory category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 7.setHeight),
          decoration: BoxDecoration(
            color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20.setHeight),
            border: Border.all(
              color: CustomAppColor.of(context).primary,
              width: 1,
            ),
          ),
          child: CommonText(
            text: title,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color, bool isShade) {
    final isSelected = isShade ? selectedShade == color : selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isShade) {
            selectedShade = color;
          } else {
            selectedColor = color;
            selectedShade = color; // Reset shade selection when base color changes
          }
        });
      },
      child: Container(
        width: isShade ? 28.setWidth : 32.setWidth,
        height: isShade ? 28.setHeight : 32.setHeight,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                color: _getContrastColor(color),
                size: isShade ? 18.setWidth : 20.setWidth,
              )
            : null,
      ),
    );
  }

  Color _getContrastColor(Color color) {
    // Calculate the luminance to determine if white or black text should be used
    return Colors.white;
    // final luminance = (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    // return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
