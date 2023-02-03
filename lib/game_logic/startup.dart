import 'dart:math';

import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/models/game_data.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/providers/playerDataProvider.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums.dart';
import '../models/player_data.dart';

setInitalGameProperties(WidgetRef ref) {
  String playerOneGuid = Guid.generate().toString();
  String playerTwoGuid = Guid.generate().toString();
  ElementalType randomElement = ElementalType.values[Random().nextInt(3)];

  ref.watch(playerProvider.notifier).state = PlayerData(
      id: playerOneGuid,
      name: 'Player One',
      elementalType: ref.watch(playerProvider).elementalType,
      deck: createPlayerDeck(
          playerOneGuid, ref.watch(playerProvider).elementalType));

  ref.watch(playerTwoProvider.notifier).state = PlayerData(
      id: playerTwoGuid,
      name: 'Player Two',
      elementalType: randomElement,
      deck: createPlayerDeck(playerTwoGuid, randomElement));

  ref.watch(gameDataProvider.notifier).state = ref
      .watch(gameDataProvider.notifier)
      .state
      .copyWith(
          players: [ref.watch(playerProvider), ref.watch(playerTwoProvider)]);

  ref.watch(playerProvider.notifier).updateCardTotal(ref, Players.p1);
  ref.watch(playerProvider.notifier).drawCards(ref, Players.p1);

  ref.watch(playerTwoProvider.notifier).updateCardTotal(ref, Players.p2);
  ref.watch(playerTwoProvider.notifier).drawCards(ref, Players.p2);

  ref.watch(gameDataProvider.notifier).state = ref
      .watch(gameDataProvider)
      .copyWith(currentPlayer: ref.watch(playerProvider));

  ref.watch(gameDataProvider.notifier).resetPlayZone();
  notifyDynamicInfo(ref, "Player One's Turn");
}
