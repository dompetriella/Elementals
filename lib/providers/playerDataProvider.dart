import 'package:elementals/providers/gameDataProvider.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_components/element_card.dart';
import '../game_logic/logic.dart';
import '../models/element_card_data.dart';
import '../models/enums.dart';
import '../models/player_data.dart';

final playerProvider =
    StateNotifierProvider<PlayerDataNotifier, PlayerData>((ref) {
  return PlayerDataNotifier();
});

final playerTwoProvider =
    StateNotifierProvider<PlayerDataNotifier, PlayerData>((ref) {
  return PlayerDataNotifier();
});

class PlayerDataNotifier extends StateNotifier<PlayerData> {
  PlayerDataNotifier()
      : super(PlayerData(id: '0', elementalType: ElementalType.fire));

  changePlayerElement(ElementalType elementalType) {
    state = state.copyWith(elementalType: elementalType);
  }

  updateCardTotal(WidgetRef ref, Players playerNumber) {
    state = ref.watch(gameDataProvider).players[playerNumber.index];
    state = state.copyWith(totalCards: state.deck.length);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  drawCard(WidgetRef ref, Players playerNumber) {
    state = ref.watch(gameDataProvider).players[playerNumber.index];
    ElementCardData newCard = state.deck.first;
    state = state.copyWith(hand: [...state.hand, newCard]);
    List<ElementCardData> deckCopy = state.deck.toList();
    deckCopy.removeAt(0);
    state = state.copyWith(deck: deckCopy);

    updatePlayerDataToGameData(ref, playerNumber);
  }

  drawCards(WidgetRef ref, Players playerNumber, {amount = 5}) {
    for (var i = 0; i < amount; i++) {
      drawCard(ref, playerNumber);
    }
  }

  playCard(String cardId, WidgetRef ref, Players playerNumber) {
    state = ref.watch(gameDataProvider).players[playerNumber.index];
    ElementCardData newCard =
        state.hand.where((element) => element.id == cardId).first;
    ref.watch(gameDataProvider.notifier).state = ref
        .watch(gameDataProvider)
        .copyWith(playZone: [...ref.watch(gameDataProvider).playZone, newCard]);
    var handCopy = state.hand.toList();
    handCopy.removeWhere((element) => element.id == cardId);

    state = state.copyWith(hand: handCopy);

    updatePlayerDataToGameData(ref, playerNumber);
  }

  updatePlayerDataToGameData(WidgetRef ref, Players playerNumber) {
    List<PlayerData> players = ref.watch(gameDataProvider).players.toList();
    switch (playerNumber) {
      case Players.p1:
        players[0] = state;
        break;
      case Players.p2:
        players[1] = state;
        break;
    }

    ref.watch(gameDataProvider.notifier).state =
        ref.watch(gameDataProvider).copyWith(players: players);
  }
}
