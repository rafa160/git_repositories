import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:git_repositories/components/custom_animated_widget.dart';
import 'package:git_repositories/style/style.dart';

class CustomIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final int position;

  const CustomIconText({Key key, this.icon, this.text, this.color, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedWidget(
      milliseconds: 1000,
      horizontalOffset: 100,
      position: position,
      widget: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: Row(
          children: [
            FaIcon(
              icon,
              size: 20,
              color: color,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(child: Text(text, style: name,))
          ],
        ),
      ),
    );
  }
}
