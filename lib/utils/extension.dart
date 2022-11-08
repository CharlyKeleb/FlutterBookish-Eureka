import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

extension AnimatedWidgetExtension on Widget {
  fadeInList(int index, bool isVertical) {
    double offset = 50.0;
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: isVertical ? 0.0 : offset,
        verticalOffset: !isVertical ? 0.0 : offset,
        child: FadeInAnimation(
          child: this,
        ),
      ),
    );
  }

  fadeInGrid(int index) {
    double offset = 50.0;
    return AnimationConfiguration.staggeredGrid(
      columnCount: 2,
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        // horizontalOffset: isVertical ? 0.0 : offset,
        verticalOffset: 50,
        child: FadeInAnimation(
          child: this,
        ),
      ),
    );
  }
}
