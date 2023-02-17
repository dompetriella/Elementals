import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game_components/placeholder_card.dart';
import '../../../game_logic/logic.dart';
import '../../../models/element_card_data.dart';
import '../../../globals.dart';

class PlayerCardPile extends ConsumerWidget {
  final List<ElementCardData> cardPile;
  final bool isDiscard;
  const PlayerCardPile(
      {super.key, required this.cardPile, this.isDiscard = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: Text(
            '${cardPile.isEmpty ? '' : cardPile.length}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Stack(
              children: convertDataToCards(cardPile,
                  isFaceUp: isDiscard ? true : false, isShrunk: true)),
        ),
      ],
    );
  }
}
