import 'package:flutter/material.dart';

import 'bottom_dot_navigation_bar_item.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.curve,
    required this.duration,
    required this.selectedItemColor,
    required this.theme,
    required this.unselectedItemColor,
    required this.onTap,
    required this.itemPadding,
    required this.enablePaddingAnimation,
    this.splashColor,
  });

  final List<DotNavigationBarItem> items;
  final int currentIndex;
  final Curve curve;
  final Duration duration;
  final Color? selectedItemColor;
  final ThemeData theme;
  final Color? unselectedItemColor;
  final Function(int p1) onTap;
  final EdgeInsets itemPadding;
  final bool enablePaddingAnimation;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final item in items)
          TweenAnimationBuilder<double>(
            tween: Tween(
              end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
            ),
            curve: curve,
            duration: duration,
            builder: (context, t, _) {
              final selectedColor =
                  item.selectedColor ?? selectedItemColor ?? theme.primaryColor;

              final unselectedColor = item.unselectedColor ??
                  unselectedItemColor ??
                  theme.iconTheme.color;

              return Material(
                color: Color.lerp(Colors.transparent, Colors.transparent, t),
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => onTap.call(items.indexOf(item)),
                  focusColor: splashColor ?? selectedColor.withValues(alpha: 0.1),
                  highlightColor: splashColor ?? selectedColor.withValues(alpha: 0.1),
                  splashColor: splashColor ?? selectedColor.withValues(alpha: 0.1),
                  hoverColor: splashColor ?? selectedColor.withValues(alpha: 0.1),
                  child: Padding(
                    padding:
                        itemPadding,
                    child: Row(
                      children: [
                        IconTheme(
                          data: IconThemeData(
                            color: Color.lerp(unselectedColor, selectedColor, t),
                            size: 24,
                          ),
                          child: item.icon,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
