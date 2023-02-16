import 'package:elementals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../game_logic/logic.dart';
import '../../../providers/gameDataProvider.dart';

class PlayZone extends ConsumerWidget {
  const PlayZone({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ref.watch(gameDataProvider).currentWinner.name != ''
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            boxShadow: [
              if (ref.watch(gameDataProvider).currentWinner.name != '')
                BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 2 *
                        (ref.watch(gameDataProvider).overallScore.toDouble() /
                            winningScore),
                    offset: ref.watch(gameDataProvider).currentWinner.name != ''
                        ? Offset(2, 4)
                        : Offset(0, 0))
            ]),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
                children:
                    convertDataToCards(ref.watch(gameDataProvider).playZone))));
  }
}
