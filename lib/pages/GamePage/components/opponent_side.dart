import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../game_logic/logic.dart';
import '../../../providers/gameDataProvider.dart';
import '../../../providers/playerDataProvider.dart';
import 'scoreboard.dart';

class OpponentSide extends ConsumerWidget {
  const OpponentSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var element = ref.watch(gameDataProvider).players[1].elementalType;
    return Flexible(
      flex: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Scoreboard(element: element),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: convertDataToCards(ref.watch(playerTwoProvider).hand,
                  isShrunk: true, isFaceUp: false)),
        ],
      ),
    );
  }
}
