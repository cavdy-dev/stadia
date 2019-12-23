import 'package:flutter/material.dart';
import '../styleguide/colors.dart';

class GameProgressWidget extends StatelessWidget {
  final double gameProgress, screenWidth;

  const GameProgressWidget({Key key, this.gameProgress, this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenWidth * 0.33 - 32;
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: tertiaryTextColor, width: 1)
          ),
        ),
        Container(
          width: width * gameProgress,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              gradient: appGradient
          ),
        ),
      ],
    );
  }
}
