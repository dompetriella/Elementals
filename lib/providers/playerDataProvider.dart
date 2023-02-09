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
    print('ability charges: ${state.abilityCharges}');
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

    print('ability charges: ${state.abilityCharges}');
    updatePlayerDataToGameData(ref, playerNumber);
    print('ability charges: ${state.abilityCharges}');
    updateOverallScore(ref);
    if (ref.read(gameDataProvider).overallScore >= winningScore) {
      ref.read(gameDataProvider.notifier).state =
          ref.read(gameDataProvider).copyWith(gameOver: true);
    }
    print('ability charges: ${state.abilityCharges}');
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

  // skills

  //fire
  burnCard(WidgetRef ref, String cardId, Players playerNumber) {
    if (state.hand.isNotEmpty &&
        state.selectedCard != '' &&
        state.abilityCharges > 0) {
      List<ElementCardData> handCopy = state.hand.toList();
      handCopy.removeWhere((element) => element.id == cardId);
      state = state.copyWith(
          hand: handCopy,
          abilityCharges: useAbilityCharge(state.abilityCharges));

      updatePlayerDataToGameData(ref, playerNumber);
    }
  }

  //earth
  moldCard(
      WidgetRef ref, String cardId, PlayerData player, Players playerNumber) {
    if (state.hand.isNotEmpty &&
        state.selectedCard != '' &&
        state.abilityCharges > 0) {
      int value =
          state.hand.where((element) => element.id == cardId).first.value;
      state = state.copyWith(deck: [
        ...state.deck,
        ElementCardData(
            id: Guid.generate().toString(),
            ownerId: player.id,
            elementalType: player.elementalType,
            value: value)
      ], abilityCharges: useAbilityCharge(state.abilityCharges));
      updatePlayerDataToGameData(ref, playerNumber);
    }
  }

  //water
  castCard(WidgetRef ref, Players playerNumber) {
    if (state.hand.length < cardsInHand &&
        state.discardPile.isNotEmpty &&
        state.abilityCharges > 0) {
      List<ElementCardData> discardCopy = state.discardPile.toList();
      discardCopy.removeLast();
      state = state.copyWith(
          hand: [
            ...state.hand,
            state.discardPile.last.copyWith(canBeSelected: true)
          ],
          discardPile: discardCopy,
          abilityCharges: useAbilityCharge(state.abilityCharges));

      updatePlayerDataToGameData(ref, playerNumber);
    }
  }

  //air
  gustCard(WidgetRef ref, Players playerNumber) {
    if (state.hand.isNotEmpty &&
        state.deck.isNotEmpty &&
        state.abilityCharges > 0) {
      List<ElementCardData> handCopy = state.hand.toList();
      List<ElementCardData> deckCopy = state.deck.toList();
      ElementCardData cardFromHand = pickRandomCardFromList(state.hand);
      ElementCardData cardFromDeck = pickRandomCardFromList(state.deck);
      handCopy.removeWhere((element) => element.id == cardFromHand.id);
      deckCopy.removeWhere((element) => element.id == cardFromDeck.id);
      handCopy.add(cardFromDeck);
      deckCopy.add(cardFromHand);
      deckCopy.shuffle();

      state = state.copyWith(
          hand: handCopy,
          deck: deckCopy,
          abilityCharges: useAbilityCharge(state.abilityCharges));

      updatePlayerDataToGameData(ref, playerNumber);
    }
  }

  givePlayerTurnAbilityCharge(WidgetRef ref, Players playerNumber) {
    state = state.copyWith(abilityCharges: 1);
    updatePlayerDataToGameData(ref, playerNumber);
  }
}
