import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stadia/common/content_heading_widget.dart';
import 'package:stadia/common/last_played_game_tile_widget.dart';
import 'package:stadia/common/rounded_image_widget.dart';
import 'package:stadia/model/last_played_game.dart';

import '../image_asset.dart';
import '../styleguide/colors.dart';
import '../styleguide/text_styles.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.4;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 10),
            child: Transform.rotate(
              angle: -0.1,
              child: SvgPicture.asset(logo, height: logoHeight, color: logoTintColor,)
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.menu, color: primaryTextColor,),
                      Icon(Icons.search, color: primaryTextColor,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            RoundedImageWidget(imagePath: player1, ranking: 39, showRanking: true),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Hello',
                                      style: userNameTextStyle,
                                    ),
                                    TextSpan(text: '\n'),
                                    TextSpan(text: "Jon Snow", style: userNameTextStyle),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, bottom: 16.0, top: 16.0),
                        child: Material(
                          elevation: 4,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "HOURS PLAYED",
                                      style: hoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "297 Hours",
                                  style: hoursPlayedTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeadingWidget(heading: "Last played games",),
                      for (var i = 0; i < lastPlayedGames.length; i++) LastPlayedGameTile(
                        lastPlayedGame: lastPlayedGames[i],
                        screenWidth: screenWidth,
                        gameProgress: lastPlayedGames[i].gameProgress,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
