import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/globalProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:elementals/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../game_components/placeholder_card.dart';
import '../../models/element_card_data.dart';
import 'components/opponent_side.dart';
import 'components/play_zone.dart';
import 'components/player_hand_area.dart';
import 'components/player_side.dart';
import 'components/settings_button.dart';

double phoneHeight(var context) => MediaQuery.of(context).size.height;
double phoneWidth(var context) => MediaQuery.of(context).size.width;

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
              flex: 5,
              child: Stack(
                children: [
                  Column(
                    children: [
                      OpponentSide(),
                      PlayerSide(),
                    ],
                  ),
                  SettingsButton(),
                  Center(
                    child: PlayZone(),
                  )
                ],
              ),
            ),
            Flexible(flex: 3, child: PlayerHandArea())
          ],
        ),
      ),
    );
  }
}
