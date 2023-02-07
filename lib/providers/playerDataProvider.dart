import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    state = ref.read(gameDataProvider).players[playerNumber.index];
    state = state.copyWith(totalCards: state.deck.length);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  drawCard(WidgetRef ref, Players playerNumber) {
    ElementCardData newCard = state.deck.first;
    newCard = newCard.copyWith(canBeSelected: true);
    state = state.copyWith(hand: [...state.hand, newCard]);
    List<ElementCardData> deckCopy = state.deck.toList();
    deckCopy.removeAt(0);
    state = state.copyWith(deck: deckCopy);

    updatePlayerDataToGameData(ref, playerNumber);
  }

  drawCards(WidgetRef ref, Players playerNumber) {
    for (var i = 0; i < cardsInHand; i++) {
      drawCard(ref, playerNumber);
    }
  }

  fillPlayerHand(WidgetRef ref, Players playerNumber) {
    for (var i = 0; i < cardsInHand; i++) {
      if (state.deck.isNotEmpty) {
        drawCard(ref, playerNumber);
      } else {
        state = state.copyWith(deck: state.discardPile);
        var deckCopy = state.deck.toList();
        deckCopy.shuffle();
        state = state.copyWith(deck: deckCopy);
        state = state.copyWith(discardPile: []);
        updatePlayerDataToGameData(ref, playerNumber);
        drawCard(ref, playerNumber);
      }
    }

    updatePlayerDataToGameData(ref, playerNumber);
  }

  playCard(ElementCardData card, WidgetRef ref, Players playerNumber) {
    state = ref.read(gameDataProvider).players[playerNumber.index];
    ElementCardData newCard =
        state.hand.where((element) => element.id == card.id).first;
    ElementCardData cardInPlayZone = ref.read(gameDataProvider).playZone.last;
    newCard = newCard.copyWith(canBeSelected: false);
    ref.read(gameDataProvider.notifier).state = ref
        .read(gameDataProvider)
        .copyWith(playZone: [...ref.watch(gameDataProvider).playZone, newCard]);
    var handCopy = state.hand.toList();
    handCopy.removeWhere((element) => element.id == card.id);

    state = state.copyWith(hand: handCopy);

    state = state.copyWith(
        score: state.score +
            calculatePlayedCardPoints(
                state.elementalType, cardInPlayZone.value, newCard.value));

    updatePlayerDataToGameData(ref, playerNumber);
    updateOverallScore(ref);
    if (ref.read(gameDataProvider).overallScore >= winningScore) {
      ref.read(gameDataProvider.notifier).state =
          ref.read(gameDataProvider).copyWith(gameOver: true);
    }
  }

  discardHand(WidgetRef ref, Players playerNumber) {
    List<ElementCardData> playerHand = state.hand;
    playerHand =
        playerHand.map((e) => e.copyWith(canBeSelected: false)).toList();
    state = state.copyWith(hand: []);
    state = state.copyWith(discardPile: [...state.discardPile, ...playerHand]);

    updatePlayerDataToGameData(ref, playerNumber);
  }

  selectCard(WidgetRef ref, Players playerNumber, String cardId) {
    state = state.copyWith(selectedCard: cardId);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  updatePlayerDataToGameData(WidgetRef ref, Players playerNumber) {
    List<PlayerData> players = ref.read(gameDataProvider).players.toList();
    switch (playerNumber) {
      case Players.p1:
        players[0] = state;
        break;
      case Players.p2:
        players[1] = state;
        break;
    }

    ref.read(gameDataProvider.notifier).state =
        ref.read(gameDataProvider).copyWith(players: players);
  }
}
