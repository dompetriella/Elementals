import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        if (ref.watch(gameDataProvider).overallScore > 0)
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Text(
                    '${ref.watch(gameDataProvider).currentWinner.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Score: ${ref.watch(gameDataProvider).overallScore}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Positioned(
                  top: -15,
                  left: -14,
                  child: Transform.rotate(
                      angle: 6, child: FaIcon(FontAwesomeIcons.crown)))
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
