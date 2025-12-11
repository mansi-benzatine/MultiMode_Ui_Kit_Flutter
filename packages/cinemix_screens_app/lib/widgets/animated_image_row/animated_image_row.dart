import 'package:flutter/material.dart';

import '../../utils/sizer_utils.dart';

class AnimatedImageRow extends StatefulWidget {
  final List<String> images;
  final bool reverse;
  final double itemWidth;
  final double itemHeight;
  final double borderRadius;
  final Duration duration;

  const AnimatedImageRow({
    super.key,
    required this.images,
    this.reverse = false,
    this.itemWidth = 165,
    this.itemHeight = 200,
    this.borderRadius = 20,
    this.duration = const Duration(seconds: 15),
  });

  @override
  State<AnimatedImageRow> createState() => _AnimatedImageRowState();
}

class _AnimatedImageRowState extends State<AnimatedImageRow> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildImageItem(String img) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.setHeight,
        horizontal: 5.setWidth,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Image.asset(
          img,
          fit: BoxFit.fill,
          width: widget.itemWidth.setWidth,
          height: widget.itemHeight.setHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final direction = widget.reverse ? -1.0 : 1.0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final totalWidth = (widget.itemWidth.setWidth + 12) * widget.images.length;
        final offset = (_controller.value * totalWidth * direction) % totalWidth;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Transform.translate(
            offset: Offset(-offset, 0),
            child: Row(
              children: [
                ...widget.images.map(_buildImageItem),
                ...widget.images.map(_buildImageItem),
              ],
            ),
          ),
        );
      },
    );
  }
}
