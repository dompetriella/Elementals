import 'package:elementals/game_logic/ai_logic.dart';
import 'package:elementals/game_logic/animation_logic.dart';
import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/game_logic/startup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums.dart';
import '../providers/gameDataProvider.dart';
import '../providers/playerDataProvider.dart';

endPlayerTurn(WidgetRef ref, Players playerNumber) async {
  ref.watch(gameDataProvider.notifier).discardPlayZone(ref);
  clearCardTransforms(ref);
  if (playerNumber == Players.p1) {
    ref.watch(playerProvider.notifier).discardHand(ref, playerNumber);
    Future.delayed(Duration(seconds: 1));
  } else {
    ref.watch(playerTwoProvider.notifier).discardHand(ref, playerNumber);
    Future.delayed(Duration(seconds: 1));
  }
  ref.watch(gameDataProvider.notifier).switchActivePlayer(ref);
}

continueGameLoop(WidgetRef ref) async {
  endPlayerTurn(ref, Players.p1);
  notifyDynamicInfo(ref, "The CPU is thinking...");
  await cpuTurn(ref);
  endPlayerTurn(ref, Players.p2);
  notifyDynamicInfo(ref, "Player One's Turn");
  fillPlayersHands(ref);
}
