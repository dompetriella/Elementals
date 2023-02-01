import 'dart:math';

import 'package:elementals/game_logic/game_loop.dart';
import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

import '../models/enums.dart';

cpuTurn(WidgetRef ref) async {
  await Future.delayed(Duration(milliseconds: 3000));
  while (ref.watch(playerTwoProvider).hand.length > 0) {
    int newPlayValue = ref.watch(gameDataProvider).playZone.last.value;

    List<ElementCardData> playableCards = [];
    for (var card in ref.watch(playerTwoProvider).hand) {
      if (isCardPlayable(newPlayValue, card)) {
        playableCards.add(card);
      }
    }
    if (playableCards.isNotEmpty) {
      ref
          .watch(playerTwoProvider.notifier)
          .playCard(playableCards.first.id, ref, Players.p2);
    } else {
      break;
    }
    await Future.delayed(Duration(milliseconds: Random().nextInt(3000) + 1000));
  }
}
