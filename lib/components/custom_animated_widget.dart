import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimatedWidget extends StatelessWidget {

  final int position;
  final int milliseconds;
  final double horizontalOffset;
  final double verticalOffset;
  final Widget widget;

  const CustomAnimatedWidget({Key key, this.position, this.milliseconds, this.horizontalOffset, this.verticalOffset, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: AnimationConfiguration.staggeredList(
          duration: Duration(milliseconds: milliseconds),
          position: position,
          child: SlideAnimation(
            horizontalOffset: horizontalOffset,
            verticalOffset: verticalOffset,
            child: FadeInAnimation(
                child: widget
            ),
          )
      ),
    );
  }
}
