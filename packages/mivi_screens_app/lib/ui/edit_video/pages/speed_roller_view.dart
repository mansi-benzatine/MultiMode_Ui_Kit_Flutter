import 'package:flutter/material.dart';
import 'package:mivi_screens_app/ui/choose_media/datamodel/choose_media_data.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/text/common_text.dart';

class SpeedSelectorView extends StatefulWidget {
  final List<MediaModel> imageList;

  const SpeedSelectorView({super.key, required this.imageList});

  @override
  State<SpeedSelectorView> createState() => _SpeedSelectorViewState();
}

class _SpeedSelectorViewState extends State<SpeedSelectorView> {
  double _overlayLeft = 0.0;
  final double _overlayWidth = 80.0;
  double _selectedSpeed = 2.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),

          // --------- IMAGE STRIP WITH DRAGGABLE SELECTOR ---------
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.imageList.map((path) {
                      return Container(
                        width: 100.setWidth,
                        height: 55.setHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(path.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Positioned(
                left: _overlayLeft,
                top: 0,
                bottom: 0,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      _overlayLeft += details.delta.dx;
                      if (_overlayLeft < 0) _overlayLeft = 0;
                      double maxLeft = (widget.imageList.length * 106) - _overlayWidth;
                      if (_overlayLeft > maxLeft) _overlayLeft = maxLeft;
                    });
                  },
                  child: Container(
                    width: _overlayWidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // --------- SPEED RULER ---------
          _buildSpeedRuler(),

          const SizedBox(height: 25),

          // --------- SPEED OPTION CONTAINERS ---------
          _buildSpeedOptions()
        ],
      ),
    );
  }

  Widget _buildSpeedRuler() {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 61,
            itemBuilder: (context, index) {
              double label = index / 10;
              bool isMajor = index % 10 == 0;
              return Container(
                width: 10,
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 2,
                      height: isMajor ? 12 : 8,
                      color: isMajor ? Colors.white : Colors.grey,
                    ),
                    if (isMajor)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: CommonText(text: "${label.toStringAsFixed(0)}x", textColor: Colors.white, fontSize: 10.setFontSize),
                      ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 0.setHeight,
            child: Container(
              height: 20.setHeight,
              width: 3.setWidth,
              color: CustomAppColor.of(context).secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpeedOptions() {
    List<double> speeds = [0.125, 0.25, 0.5, 1, 2, 4];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: speeds.map((s) {
          bool selected = s == _selectedSpeed;
          return GestureDetector(
            onTap: () => setState(() => _selectedSpeed = s),
            child: Container(
              width: 45.setWidth,
              height: 45.setHeight,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 6.setWidth),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: selected ? CustomAppColor.of(context).secondary.withValues(alpha: 0.2) : null,
                border: Border.all(color: selected ? CustomAppColor.of(context).secondary : const Color(0xFF2B2C34), width: 1),
              ),
              child: CommonText(
                text: s >= 1 ? "${s.toInt()}x" : "1/${(1 / s).toInt()}x",
                textColor: selected ? CustomAppColor.of(context).secondary : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.setFontSize,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
