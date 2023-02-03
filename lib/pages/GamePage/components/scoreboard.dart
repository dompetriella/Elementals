import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../models/enums.dart';
import '../../../providers/themeProvider.dart';
import 'player_icon_display.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({
    Key? key,
    required this.element,
  }) : super(key: key);

  final ElementalType element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PlayerIconDisplay(
          icon: Icons.bakery_dining,
          bgColor: ref.watch(themeProvider).colorScheme.primary,
        ),
        Column(
          children: [
            Text('Current Winner: '),
            Text(ref.watch(gameDataProvider).overallScore > 0
                ? ref.watch(gameDataProvider).currentWinner.name
                : 'Tie Game!'),
            Text(ref.watch(gameDataProvider).overallScore > 0
                ? 'Overtake Points: ${ref.watch(gameDataProvider).overallScore.toString()}'
                : ' ')
          ],
        ),
        PlayerIconDisplay(
          icon: Icons.fire_extinguisher,
          bgColor: HexColor(element.primaryColor),
        ),
      ],
    );
  }
}
