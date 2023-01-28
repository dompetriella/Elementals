import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:elementals/providers/playerProvider.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_components/element_card.dart';
import '../models/game_data.dart';

final gameDataProvider = StateNotifierProvider<GameNotifier, GameData>((ref) {
  return GameNotifier();
});

class GameNotifier extends StateNotifier<GameData> {
  GameNotifier() : super(GameData());

  fillPlayerOneDeck() {
    state = state.copyWith(
        playerOneDeck:
            createPlayerDeck(state.playerOneId, state.playerOneElement));
  }

  fillPlayerTwoDeck() {
    state = state.copyWith(
        playerTwoDeck:
            createPlayerDeck(state.playerTwoId, state.playerTwoElement));
  }

  fillPlayersDeck() {
    fillPlayerOneDeck();
    fillPlayerTwoDeck();
  }
}

List<ElementCardData> createPlayerDeck(
    String ownerId, ElementalType ownerElementalType) {
  List<ElementCardData> playerDeck = [];
  for (int n = 0; n < 2; n++) {
    for (int i = 1; i < 8; i++) {
      playerDeck.add(ElementCardData(
          id: Guid.generate().toString(),
          ownerId: ownerId,
          elementalType: ownerElementalType,
          value: i));
    }
  }
  playerDeck.shuffle();
  return playerDeck;
}
