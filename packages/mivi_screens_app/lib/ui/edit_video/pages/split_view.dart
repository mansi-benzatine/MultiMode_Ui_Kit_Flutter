import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/edit_video/widget/timeline_view.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';

import '../../../widgets/text/common_text.dart';
import '../../choose_media/datamodel/choose_media_data.dart';

class SplitView extends StatefulWidget {
  final List<MediaModel> imageList;
  const SplitView({super.key, required this.imageList});

  @override
  State<SplitView> createState() => _SplitViewState();
}

class _SplitViewState extends State<SplitView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 20.setHeight),
          const TimeLineRuler(),
          SizedBox(height: 10.setHeight),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 60.setHeight,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.imageList.length,
                  itemBuilder: (context, index) {
                    final item = widget.imageList[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image: AssetImage(item.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                left: 30.setWidth,
                right: 200,
                top: 0,
                child: Column(
                  children: [
                    Container(
                      height: 60.setHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: CustomAppColor.of(context).secondary,
                            width: 3,
                          ),
                          color: CustomAppColor.of(context).secondary.withValues(alpha: 0.1)),
                    ),
                    SizedBox(height: 6.setHeight),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: "00:02",
                          textColor: Colors.white,
                          fontSize: 12,
                        ),
                        CommonText(
                          text: "00:13",
                          textColor: Colors.white,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          const Spacer(),
          CommonButton(
            width: 120.setWidth,
            image: AppAssets.icTrim,
            imageColor: CustomAppColor.of(context).black,
            imageSize: 14,
            height: 40.setHeight,
            text: "Split",
          )
        ],
      ),
    );
  }
}
