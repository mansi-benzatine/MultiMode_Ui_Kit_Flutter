import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

import '../../../utils/app_assets.dart';
import '../../choose_media/datamodel/choose_media_data.dart';

class ClipTrackView extends StatelessWidget {
  final List<MediaModel> list;
  const ClipTrackView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 10.setWidth),
        child: Row(
          children: list
              .map((item) => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 100.setWidth,
                        height: 50.setHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 2),
                          image: DecorationImage(
                            image: AssetImage(item.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: item.isVideo
                            ? const Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.play_arrow, color: Colors.white, size: 18),
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        left: -5,
                        top: 0,
                        bottom: 0,
                        child: Image.asset(
                          AppAssets.icAdd,
                          height: 24.setHeight,
                          width: 24.setWidth,
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
