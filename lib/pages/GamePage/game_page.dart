import 'package:elementals/globals.dart';
import 'package:flutter/material.dart';
import 'components/background_areas.dart';
import 'components/opponent_side.dart';
import 'components/play_zone.dart';
import 'components/player_hand_area.dart';
import 'components/player_side.dart';
import 'components/settings_button.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: [
            Flexible(
              flex: gameField,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          OpponentSideBackground(),
                          PlayerBackground(),
                        ],
                      ),
                      Column(
                        children: [
                          OpponentSide(),
                          PlayerSide(),
                        ],
                      ),
                    ],
                  ),
                  SettingsButton(),
                  Center(
                    child: PlayZone(),
                  ),
                ],
              ),
            ),
            Flexible(flex: playerField, child: PlayerHandArea())
          ],
        ),
      ),
    );
  }
}
