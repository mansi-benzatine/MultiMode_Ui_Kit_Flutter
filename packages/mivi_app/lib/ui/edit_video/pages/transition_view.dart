import 'package:flutter/material.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

class TransitionSelectorView extends StatefulWidget {
  const TransitionSelectorView({super.key});

  @override
  State<TransitionSelectorView> createState() => _TransitionSelectorViewState();
}

class _TransitionSelectorViewState extends State<TransitionSelectorView> {
  int _selectedBasic = 0;
  int _selectedAdvance = -1;

  final List<String> basicTransitions = [
    "None",
    "Blur",
    "Blur In",
    "Blur Out",
    "Left",
    "Right",
  ];

  final List<String> advancedTransitions = [
    "Blur From Left",
    "Blur From Right",
    "Blur From Up",
    "Blur From Down",
    "Blur From Top Left",
    "Blur From Top Right",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Basic",
            textColor: CustomAppColor.of(context).white,
            fontFamily: Constant.fontFamilyMedium500,
            fontSize: 12.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          _buildTransitionRow(
            items: basicTransitions,
            selectedIndex: _selectedBasic,
            onSelect: (i) => setState(() => _selectedBasic = i),
          ),
          CommonText(
            text: "Advance",
            textColor: CustomAppColor.of(context).white,
            fontFamily: Constant.fontFamilyMedium500,
            fontSize: 12.setFontSize,
          ),
          SizedBox(height: 12.setHeight),
          _buildTransitionRow(
            items: advancedTransitions,
            selectedIndex: _selectedAdvance,
            onSelect: (i) => setState(() => _selectedAdvance = i),
          ),
        ],
      ),
    );
  }

  Widget _buildTransitionRow({
    required List<String> items,
    required int selectedIndex,
    required Function(int) onSelect,
  }) {
    return SizedBox(
      height: 100.setHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final bool selected = index == selectedIndex;
          final name = items[index];

          return GestureDetector(
            onTap: () => onSelect(index),
            child: SizedBox(
              width: 80.setWidth,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 55.setHeight,
                    width: 55.setWidth,
                    decoration: BoxDecoration(
                      color: _getEffectColor(name),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: selected ? CustomAppColor.of(context).secondary : Colors.transparent,
                        width: 1,
                      ),
                      gradient: _getEffectGradient(name),
                      boxShadow: _getEffectShadow(name),
                    ),
                    child: Center(
                      child: _getEffectIcon(name, selected),
                    ),
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: name,
                    textAlign: TextAlign.center,
                    textColor: selected ? Colors.white : Colors.white70,
                    fontSize: 10.setFontSize,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Gradient? _getEffectGradient(String name) {
    if (name.contains("Left")) {
      return const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.grey, Colors.black],
      );
    } else if (name.contains("Right")) {
      return const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [Colors.grey, Colors.black],
      );
    } else if (name.contains("Up")) {
      return const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.grey, Colors.black],
      );
    } else if (name.contains("Down")) {
      return const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Colors.grey, Colors.black],
      );
    } else if (name.contains("Blur")) {
      return const RadialGradient(
        colors: [Colors.white24, Colors.black54],
        center: Alignment.center,
        radius: 0.8,
      );
    }
    return null;
  }

  List<BoxShadow>? _getEffectShadow(String name) {
    if (name.contains("Blur")) {
      return [
        BoxShadow(
          color: Colors.white.withValues(alpha: 0.1),
          blurRadius: 12,
          spreadRadius: 2,
        ),
      ];
    }
    return null;
  }

  Color _getEffectColor(String name) {
    if (name == "None") return Colors.transparent;
    return const Color(0xFF2B2C34);
  }

  Widget _getEffectIcon(String name, bool selected) {
    if (name == "None") {
      return Icon(Icons.block, color: selected ? CustomAppColor.of(context).secondary : Colors.white60, size: 22);
    } else if (name.contains("Left")) {
      return Icon(Icons.arrow_back_ios_new, color: selected ? CustomAppColor.of(context).secondary : Colors.white70, size: 18);
    } else if (name.contains("Right")) {
      return Icon(Icons.arrow_forward_ios, color: selected ? CustomAppColor.of(context).secondary : Colors.white70, size: 18);
    } else if (name.contains("Up")) {
      return Icon(Icons.keyboard_arrow_up, color: selected ? CustomAppColor.of(context).secondary : Colors.white70, size: 22);
    } else if (name.contains("Down")) {
      return Icon(Icons.keyboard_arrow_down, color: selected ? CustomAppColor.of(context).secondary : Colors.white70, size: 22);
    }
    return Icon(Icons.blur_on, color: selected ? CustomAppColor.of(context).secondary : Colors.white70, size: 20);
  }
}
