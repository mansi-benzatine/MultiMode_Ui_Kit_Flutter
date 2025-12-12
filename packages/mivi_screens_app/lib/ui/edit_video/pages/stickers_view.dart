import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

import '../../../widgets/text/common_text.dart';

class StickersView extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const StickersView());
  }

  const StickersView({super.key});

  @override
  State<StickersView> createState() => _StickersViewState();
}

class _StickersViewState extends State<StickersView> {
  final categories = ["All", "Trending", "Mood", "Travel", "Food", "Nature"];
  final stickers = [
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
    AppAssets.icAppIcon,
  ];
  String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final isSelected = selectedCategory == categories[index];
              return GestureDetector(
                onTap: () => setState(() => selectedCategory = categories[index]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: categories[index],
                      textColor: isSelected ? Colors.white : Colors.white54,
                      fontSize: 14.setFontSize,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    const SizedBox(height: 4),
                    if (isSelected)
                      Container(
                        height: 2,
                        width: 20,
                        color: Colors.cyanAccent,
                      ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemCount: categories.length,
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, top: 8.setHeight),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: stickers.length,
          itemBuilder: (context, index) {
            final sticker = stickers[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    sticker,
                    height: 10.setHeight,
                    width: 10.setWidth,
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
