import 'package:elementals/game_logic/logic.dart';
import 'package:elementals/game_logic/utility.dart';
import 'package:elementals/providers/gameDataProvider.dart';
import 'package:elementals/globals.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game_logic/elemental_abilities.dart';
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

  drawCard(WidgetRef ref, Players playerNumber) {
    if (state.deck.isEmpty) {
      state = state.copyWith(deck: state.discardPile);
      var deckCopy = state.deck.toList();
      deckCopy.shuffle();
      state = state.copyWith(deck: deckCopy);
      state = state.copyWith(discardPile: []);
      updatePlayerDataToGameData(ref, playerNumber);
    }
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
        shuffleDiscardIntoDeck(ref, playerNumber, state);
        drawCard(ref, playerNumber);
      }
    }

    updatePlayerDataToGameData(ref, playerNumber);
  }

  shuffleDiscardIntoDeck(
      WidgetRef ref, Players playerNumber, PlayerData state) {}

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

  //burn
  fireAbilityOne(WidgetRef ref, String cardId, Players playerNumber) {
    var handCopy = state.hand.toList();
    int selectIndex = handCopy.indexWhere((element) => element.id == cardId);
    handCopy[selectIndex] = createIntangibleCard(state.elementalType);
    state = state.copyWith(
        hand: handCopy,
        abilityCharges: state.abilityCharges - 1,
        abilityActive: false);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  //shift
  airAbilityOne(WidgetRef ref, String cardId, Players playerNumber) {
    var handCopy = state.hand.toList();
    var deckCopy = state.deck.toList();
    List<ElementCardData> cardsFromDeck = [];
    List<int> tangibleCardIndexes = [];
    int chosenCardIndex =
        handCopy.indexWhere((element) => element.id == cardId);

    for (var i = 0; i < chosenCardIndex + 1; i++) {
      if (handCopy[i].isTangible) {
        tangibleCardIndexes.add(i);
      }
    }
    if (tangibleCardIndexes.length > state.deck.length) {
      state = state.copyWith(deck: state.discardPile);
      var deckCopy = state.deck.toList();
      deckCopy.shuffle();
      state = state.copyWith(deck: deckCopy);
      state = state.copyWith(discardPile: []);
      updatePlayerDataToGameData(ref, playerNumber);
    }
    // pull from deck and remove
    for (var i = 0; i < tangibleCardIndexes.length; i++) {
      ElementCardData cardFromDeck = getRandomElementFromList(deckCopy);
      cardFromDeck = cardFromDeck.copyWith(canBeSelected: true);
      cardsFromDeck.add(cardFromDeck);
    }
    cardsFromDeck.forEach((cardFromDeck) {
      deckCopy.removeWhere((element) => element.id == cardFromDeck.id);
    });

    // retreives the missing tangible card indexes and replaces the cards
    // with the cards randomly got from deck
    for (var i = 0; i < tangibleCardIndexes.length; i++) {
      handCopy[tangibleCardIndexes[i]] = cardsFromDeck[i];
    }

    state = state.copyWith(
        hand: handCopy,
        deck: deckCopy,
        abilityCharges: state.abilityCharges - 1,
        abilityActive: false);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  //tide
  waterAbilityTwo(WidgetRef ref, String cardId, Players playerNumber) {
    if (state.discardPile.isEmpty) {
      notifyDynamicInfo(
          ref, 'Cannot use Ability: No Discard Pile Card to Switch With');
      return;
    }
    var handCopy = state.hand.toList();
    var discardPileCopy = state.discardPile.toList();
    int selectIndex = handCopy.indexWhere((element) => element.id == cardId);
    handCopy[selectIndex] = discardPileCopy.last
        .copyWith(id: Guid.generate().toString(), canBeSelected: true);
    discardPileCopy.first = handCopy[selectIndex]
        .copyWith(id: Guid.generate().toString(), canBeSelected: false);

    state = state.copyWith(
        hand: handCopy,
        discardPile: discardPileCopy,
        abilityCharges: state.abilityCharges - 1,
        abilityActive: false);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  // forge
  earthAbilityOne(WidgetRef ref, String cardId, Players playerNumber) {
    var handCopy = state.hand.toList();
    int selectIndex = handCopy.indexWhere((element) => element.id == cardId);
    if (handCopy[selectIndex].value < highestCardValue) {
      handCopy[selectIndex] = handCopy[selectIndex]
          .copyWith(value: handCopy[selectIndex].value + 1);
    } else {
      notifyDynamicInfo(
          ref, 'Cannot use Ability: Value cannot exceed $highestCardValue');
      return;
    }
    state = state.copyWith(
        hand: handCopy,
        abilityCharges: state.abilityCharges - 1,
        abilityActive: false);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  // crumble
  earthAbilityTwo(WidgetRef ref, String cardId, Players playerNumber) {
    var handCopy = state.hand.toList();
    int selectIndex = handCopy.indexWhere((element) => element.id == cardId);
    if (handCopy[selectIndex].value > lowestCardValue) {
      handCopy[selectIndex] = handCopy[selectIndex]
          .copyWith(value: handCopy[selectIndex].value - 1);
    } else {
      notifyDynamicInfo(ref,
          'Cannot use Ability: Value cannot be lower than $lowestCardValue');
      return;
    }
    state = state.copyWith(
        hand: handCopy,
        abilityCharges: state.abilityCharges - 1,
        abilityActive: false);
    updatePlayerDataToGameData(ref, playerNumber);
  }

  givePlayerTurnAbilityCharge(WidgetRef ref, Players playerNumber) {
    state = state.copyWith(abilityCharges: 1);
    updatePlayerDataToGameData(ref, playerNumber);
  }
}
