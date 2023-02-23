import 'dart:math';
import 'package:elementals/game_logic/logic.dart';
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
  while (randomElement == ref.read(playerProvider).elementalType) {
    randomElement = ElementalType.values[Random().nextInt(3)];
  }
  ref.read(playerProvider.notifier).state = PlayerData(
      id: playerOneGuid,
      name: 'Player One',
      elementalType: ref.read(playerProvider).elementalType,
      deck: createPlayerDeck(
          playerOneGuid, ref.read(playerProvider).elementalType));

  ref.read(playerTwoProvider.notifier).state = PlayerData(
      id: playerTwoGuid,
      name: 'Player Two',
      elementalType: randomElement,
      deck: createPlayerDeck(playerTwoGuid, randomElement));

  ref.read(gameDataProvider.notifier).state = ref
      .read(gameDataProvider.notifier)
      .state
      .copyWith(
          players: [ref.read(playerProvider), ref.read(playerTwoProvider)]);

  ref.read(playerProvider.notifier).drawCards(ref, Players.p1);
  ref.read(playerTwoProvider.notifier).drawCards(ref, Players.p2);

  ref.read(gameDataProvider.notifier).state = ref
      .read(gameDataProvider)
      .copyWith(currentPlayer: ref.read(playerProvider));

  ref.read(gameDataProvider.notifier).resetPlayZone();
  notifyDynamicInfo(ref, "Player One's Turn");
}
