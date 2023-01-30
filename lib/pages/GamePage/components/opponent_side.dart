import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../game_logic/logic.dart';
import '../../../providers/gameDataProvider.dart';
import '../../../providers/playerDataProvider.dart';
import '../../../providers/themeProvider.dart';
import 'player_icon_display.dart';

class OpponentSide extends ConsumerWidget {
  const OpponentSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var element = ref.watch(gameDataProvider).players[1].elementalType;
    return Flexible(
      flex: 20,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              HexColor(element.primaryColor),
              HexColor(element.secondaryColor)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerIconDisplay(
                  icon: Icons.bakery_dining,
                  bgColor: ref.watch(themeProvider).colorScheme.primary,
                ),
                PlayerIconDisplay(
                  icon: Icons.fire_extinguisher,
                  bgColor: HexColor(element.primaryColor),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    convertDataToCards(ref.watch(playerTwoProvider).hand)),
          ],
        ),
      ),
    );
  }
}
