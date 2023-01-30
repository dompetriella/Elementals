import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game_components/placeholder_card.dart';
import '../../../game_logic/logic.dart';
import '../../../models/element_card_data.dart';
import '../../../providers/globalProvider.dart';

class PlayerCardPile extends ConsumerWidget {
  final List<ElementCardData> cardPile;
  final bool isDiscard;
  const PlayerCardPile(
      {super.key, required this.cardPile, this.isDiscard = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: ref.read(cardHeightP1) * ref.read(cardWidthProportion),
          child: Center(
            child: Text(
              '${cardPile.length}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        cardPile.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: PlaceholderCard(),
              )
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  children: [
                    Stack(children: convertDataToCards(cardPile)),
                    if (isDiscard)
                      Container(
                        height: ref.read(cardHeightP1),
                        width: ref.read(cardHeightP1) *
                                ref.read(cardWidthProportion) +
                            3,
                        color: Colors.grey.shade600.withOpacity(.35),
                      )
                  ],
                ),
              ),
      ],
    );
  }
}
