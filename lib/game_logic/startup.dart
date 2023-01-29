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

  ref.watch(gameDataProvider.notifier).state = GameData(players: [
    PlayerData(
        id: playerOneGuid,
        elementalType: ref.watch(playerProvider).elementalType,
        deck: createPlayerDeck(
            playerOneGuid, ref.watch(playerProvider).elementalType)),
    PlayerData(
        id: playerTwoGuid,
        elementalType: randomElement,
        deck: createPlayerDeck(playerTwoGuid, randomElement))
  ]);

  ref.watch(playerProvider.notifier).drawCards(ref, Players.p1);
}
