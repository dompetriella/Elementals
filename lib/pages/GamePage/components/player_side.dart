import 'package:elementals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/playerDataProvider.dart';
import 'player_card_pile.dart';

class PlayerSide extends ConsumerWidget {
  const PlayerSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      flex: 20,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Stack(
                children: [
                  SizedBox(
                    height: cardHeightP2,
                    width: cardHeightP2 * cardWidthProportion,
                  ),
                  PlayerCardPile(
                    cardPile: ref.watch(playerProvider).deck,
                  ),
                ],
              ),
              Stack(
                children: [
                  SizedBox(
                    height: cardHeightP2,
                    width: cardHeightP2 * cardWidthProportion,
                  ),
                  PlayerCardPile(
                    cardPile: ref.watch(playerProvider).discardPile,
                    isDiscard: true,
                  ),
                ],
              )
            ])
          ]),
    );
  }
}
