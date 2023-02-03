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
        Row(
          children: [
            PlayerIconDisplay(
              icon: Icons.bakery_dining,
              bgColor: ref.watch(themeProvider).colorScheme.primary,
            ),
            Container(
              color: Colors.black,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref.watch(playerProvider).score.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              color: Colors.black,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ref.watch(playerTwoProvider).score.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            PlayerIconDisplay(
              icon: Icons.fire_extinguisher,
              bgColor: HexColor(element.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
