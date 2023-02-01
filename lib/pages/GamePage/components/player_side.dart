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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              PlayerCardPile(
                cardPile: ref.watch(playerProvider).deck,
              ),
              Stack(
                children: [
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
