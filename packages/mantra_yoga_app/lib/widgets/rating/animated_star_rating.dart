import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../utils/app_color.dart';

class AnimatedStarRating extends StatefulWidget {
  final int maxRating;
  final double currentRating;
  final Function(double) onRatingChanged;
  final double size;
  final Color? fillColor;
  final Color? emptyColor;
  final Duration animationDuration;
  final bool allowHalfRating;

  const AnimatedStarRating({
    super.key,
    this.maxRating = 5,
    this.currentRating = 0,
    required this.onRatingChanged,
    this.size = 50,
    this.fillColor,
    this.emptyColor,
    this.animationDuration = const Duration(milliseconds: 300),
    this.allowHalfRating = false,
  });

  @override
  State<AnimatedStarRating> createState() => _AnimatedStarRatingState();
}

class _AnimatedStarRatingState extends State<AnimatedStarRating> with TickerProviderStateMixin {
  late double _currentRating;
  double _hoverRating = 0;
  bool _isHovering = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  int _animatingStarIndex = -1;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.currentRating;
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onStarTap(int index) {
    double newRating = (index + 1).toDouble();
    setState(() {
      _currentRating = newRating;
      _animatingStarIndex = index;
    });

    _animationController.forward().then((_) {
      _animationController.reverse().then((_) {
        setState(() {
          _animatingStarIndex = -1;
        });
      });
    });

    widget.onRatingChanged(newRating);
  }

  void _onStarHover(int index, bool isHovering) {
    setState(() {
      _isHovering = isHovering;
      if (isHovering) {
        _hoverRating = (index + 1).toDouble();
      } else {
        _hoverRating = 0;
      }
    });
  }

  void _onPanUpdate(DragUpdateDetails details, BoxConstraints constraints) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.globalToLocal(details.globalPosition);
    final starWidth = constraints.maxWidth / widget.maxRating;
    final starIndex = (position.dx / starWidth).floor();

    if (starIndex >= 0 && starIndex < widget.maxRating) {
      double rating;
      if (widget.allowHalfRating) {
        final relativePosition = (position.dx % starWidth) / starWidth;
        rating = starIndex + (relativePosition > 0.5 ? 1.0 : 0.5);
      } else {
        rating = (starIndex + 1).toDouble();
      }

      setState(() {
        _currentRating = rating;
      });
      widget.onRatingChanged(rating);
    }
  }

  Widget _buildStar(int index) {
    final displayRating = _isHovering ? _hoverRating : _currentRating;
    final isFullStar = index < displayRating.floor();
    final isHalfStar = widget.allowHalfRating && index == displayRating.floor() && displayRating % 1 != 0;
    final isAnimating = _animatingStarIndex == index;

    Widget star = AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: isAnimating ? _scaleAnimation.value : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Stack(
              children: [
                // Background star (empty)
                Icon(
                  Icons.star_rounded,
                  size: widget.size.setHeight,
                  color: widget.emptyColor ?? CustomAppColor.of(context).txtLightGray.withValues(alpha: 0.3),
                ),
                // Foreground star (filled)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: isFullStar
                          ? 1.0
                          : isHalfStar
                              ? 0.5
                              : 0.0,
                      child: Icon(
                        Icons.star_rounded,
                        size: widget.size.setHeight,
                        color: widget.fillColor ?? CustomAppColor.of(context).primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return MouseRegion(
      onEnter: (_) => _onStarHover(index, true),
      onExit: (_) => _onStarHover(index, false),
      child: GestureDetector(
        onTap: () => _onStarTap(index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.setWidth),
          child: star,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanUpdate: (details) => _onPanUpdate(details, constraints),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.maxRating,
              (index) => _buildStar(index),
            ),
          ),
        );
      },
    );
  }
}
