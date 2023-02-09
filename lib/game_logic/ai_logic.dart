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
  await Future.delayed(Duration(milliseconds: 500));
  if (ref.read(playerTwoProvider).hand.isEmpty) {
    ref.read(playerTwoProvider.notifier).fillPlayerHand(ref, Players.p2);
  }

  await Future.delayed(Duration(milliseconds: 3000));
  while (ref.read(playerTwoProvider).hand.length > 0) {
    int newPlayValue = ref.read(gameDataProvider).playZone.last.value;

    List<ElementCardData> playableCards = [];
    for (var card in ref.read(playerTwoProvider).hand) {
      if (isCardPlayable(newPlayValue, card)) {
        playableCards.add(card);
      }
    }
    if (playableCards.isNotEmpty) {
      ref
          .read(playerTwoProvider.notifier)
          .playCard(playableCards.first, ref, Players.p2);
    } else {
      break;
    }
    await Future.delayed(Duration(milliseconds: Random().nextInt(3000) + 1000));
  }
}
