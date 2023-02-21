import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/globals.dart';
import 'package:flutter_guid/flutter_guid.dart';
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
    // accounts for first card played now
    int cardInPlayZoneValue = ref.read(gameDataProvider).playZone.isEmpty
        ? -1
        : ref.read(gameDataProvider).playZone.last.value;
    newCard = newCard.copyWith(canBeSelected: false);
    ref.read(gameDataProvider.notifier).state = ref
        .read(gameDataProvider)
        .copyWith(playZone: [...ref.watch(gameDataProvider).playZone, newCard]);
    var handCopy = state.hand.toList();
    int selectedCardIndex =
        handCopy.indexWhere((element) => element.id == card.id);

    handCopy[selectedCardIndex] = createIntangibleCard(state.elementalType);

    state = state.copyWith(hand: handCopy);
    state = state.copyWith(
        score: state.score +
            calculatePlayedCardPoints(
                state.elementalType, cardInPlayZoneValue, newCard.value));

    updatePlayerDataToGameData(ref, playerNumber);
    updateOverallScore(ref);
    if (ref.read(gameDataProvider).overallScore >= winningScore) {
      ref.read(gameDataProvider.notifier).state =
          ref.read(gameDataProvider).copyWith(gameOver: true);
    }
  }

  discardHand(WidgetRef ref, Players playerNumber) {
    List<ElementCardData> playerHand = state.hand.toList();
    playerHand.removeWhere((element) => element.isTangible == false);
    playerHand =
        playerHand.map((e) => e.copyWith(canBeSelected: false)).toList();
    state = state.copyWith(hand: []);
    state = state.copyWith(discardPile: [...state.discardPile, ...playerHand]);

    updatePlayerDataToGameData(ref, playerNumber);
  }

  selectCard(WidgetRef ref, Players playerNumber, String cardId) {
    state = state.copyWith(selectedCard: cardId);
    if (state.abilityActive) {
      switch (state.elementalType) {
        case ElementalType.fire:
          fireAbility(ref, cardId, playerNumber);
          break;
        default:
      }
    }
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

  // skills

  fireAbility(WidgetRef ref, String cardId, Players playerNumber) {
    var handCopy = state.hand.toList();
    int selectIndex = handCopy.indexWhere((element) => element.id == cardId);
    handCopy[selectIndex] = createIntangibleCard(state.elementalType);
    state = state.copyWith(
        hand: handCopy,
        abilityCharges: state.abilityCharges - 1,
        abilityActive: false);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  airAbility(WidgetRef ref, String cardId) {}

  givePlayerTurnAbilityCharge(WidgetRef ref, Players playerNumber) {
    state = state.copyWith(abilityCharges: 1);
    updatePlayerDataToGameData(ref, playerNumber);
  }
}
