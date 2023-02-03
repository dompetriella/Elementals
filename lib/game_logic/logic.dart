import 'package:elementals/game_components/element_card.dart';
import 'package:elementals/providers/dynamicInfoProvider.dart';
import 'package:elementals/globals.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/element_card_data.dart';
import '../models/enums.dart';
import '../models/player_data.dart';
import '../providers/gameDataProvider.dart';
import '../providers/playerDataProvider.dart';
import 'animation_logic.dart';
import 'dart:math';

List<ElementCard> convertDataToCards(List<ElementCardData> cardData,
    {bool hasShadow = false, bool isFaceUp = true, bool isShrunk = false}) {
  return cardData
      .map((e) => ElementCard(
            elementCardData: e,
            hasShadow: hasShadow,
            isFaceUp: isFaceUp,
            isShrunk: isShrunk,
          ))
      .toList();
}

List<ElementCardData> createPlayerDeck(
    String ownerId, ElementalType ownerElementalType) {
  List<ElementCardData> playerDeck = [];
  for (int n = 0; n < cardDuplicates; n++) {
    for (int i = lowestCardValue; i <= highestCardValue; i++) {
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

bool isCardPlayable(int playableValue, ElementCardData checkedCard) {
  if (checkedCard.value == playableValue) return true;
  if (checkedCard.value == playableValue + 1) return true;
  if (checkedCard.value == playableValue - 1) return true;
  return false;
}

fillPlayersHands(WidgetRef ref) {
  ref.watch(playerProvider.notifier).updateCardTotal(ref, Players.p1);
  ref.watch(playerProvider.notifier).fillPlayerHand(ref, Players.p1);

  ref.watch(playerTwoProvider.notifier).updateCardTotal(ref, Players.p2);
  ref.watch(playerTwoProvider.notifier).fillPlayerHand(ref, Players.p2);
}

notifyDynamicInfo(WidgetRef ref, String message) {
  ref.watch(dynamicInfoProvider.notifier).state = message;
}

selectCardToPlay(ElementCardData elementCardData, WidgetRef ref) {
  if (elementCardData.canBeSelected &&
      elementCardData.ownerId == ref.watch(playerProvider).id &&
      ref.watch(gameDataProvider).currentPlayer.id ==
          ref.watch(playerProvider).id) {
    if (ref.watch(playerProvider).selectedCard == elementCardData.id) {
      if (isCardPlayable(
          ref.watch(gameDataProvider).playZone.last.value, elementCardData)) {
        ref
            .watch(playerProvider.notifier)
            .playCard(elementCardData, ref, Players.p1);
        clearCardTransforms(ref);
      } else {
        clearCardTransforms(ref);
        notifyDynamicInfo(ref, 'Card is unplayable');
      }
      // select the card
    } else {
      ref.watch(playerProvider.notifier).state = ref
          .watch(playerProvider.notifier)
          .state
          .copyWith(selectedCard: elementCardData.id);
      // updates DIC with whether playable or not
      if (isCardPlayable(
          ref.watch(gameDataProvider).playZone.last.value, elementCardData)) {
        notifyDynamicInfo(ref, 'Playable Card');
      } else {
        notifyDynamicInfo(ref, 'Unplayable Card');
      }
    }
  }
}

immediatelyPlayCard(ElementCardData elementCardData, WidgetRef ref) {
  if (elementCardData.ownerId == ref.watch(playerProvider).id &&
      ref.watch(gameDataProvider).currentPlayer.id ==
          ref.watch(playerProvider).id) {
    if (isCardPlayable(
        ref.watch(gameDataProvider).playZone.last.value, elementCardData)) {
      ref
          .watch(playerProvider.notifier)
          .playCard(elementCardData, ref, Players.p1);
      clearCardTransforms(ref);
    } else {
      clearCardTransforms(ref);
      notifyDynamicInfo(ref, 'Card is unplayable');
    }
  }
}

int calculatePlayedCardPoints(
    ElementalType elementalType, int playZoneValue, int playedCardValue) {
  switch (elementalType) {
    case ElementalType.fire:
      if (determineValueDifference(playZoneValue, playedCardValue) ==
              ValueDifference.increase &&
          playedCardValue == highestCardValue) {
        return fireMax;
      } else if (determineValueDifference(playZoneValue, playedCardValue) ==
          ValueDifference.increase) {
        return fireBonus;
      } else if (playedCardValue == lowestCardValue) {
        return firePenalty;
      }
      return 1;
    case ElementalType.air:
      if (determineValueDifference(playZoneValue, playedCardValue) ==
              ValueDifference.decrease &&
          playedCardValue == lowestCardValue) {
        return airMax;
      } else if (determineValueDifference(playZoneValue, playedCardValue) ==
          ValueDifference.decrease) {
        return airBonus;
      } else if (playZoneValue == highestCardValue) {
        return airPenalty;
      }
      return 1;
    case ElementalType.water:
      if (determineValueDifference(playZoneValue, playedCardValue) ==
              ValueDifference.decrease ||
          determineValueDifference(playZoneValue, playedCardValue) ==
              ValueDifference.increase) {
        return waterBonus;
      }
      return 1;
    case ElementalType.earth:
      if (determineValueDifference(playZoneValue, playedCardValue) ==
          ValueDifference.noChange) {
        return earthBonus;
      }
      return 1;
    default:
      return 1;
  }
}

ValueDifference determineValueDifference(
    int playZoneValue, int playedCardValue) {
  if (playedCardValue > playZoneValue) return ValueDifference.increase;
  if (playedCardValue < playZoneValue) return ValueDifference.decrease;
  return ValueDifference.noChange;
}

updateOverallScore(WidgetRef ref) {
  PlayerData playerOne = ref.watch(gameDataProvider).players[0];
  PlayerData playerTwo = ref.watch(gameDataProvider).players[1];

  int scoreDiff = (playerOne.score - playerTwo.score).abs();

  print(scoreDiff);

  PlayerData winningPlayer =
      playerOne.score > playerTwo.score ? playerOne : playerTwo;

  print(winningPlayer.name);

  ref.watch(gameDataProvider.notifier).state = ref
      .watch(gameDataProvider)
      .copyWith(overallScore: scoreDiff, currentWinner: winningPlayer);
}

int calculateOvertakeSize(PlayerData player, WidgetRef ref) {
  if (player.id == ref.watch(gameDataProvider).currentWinner.id) {
    return winningScore + ref.watch(gameDataProvider).overallScore >
            winningScore * 2
        ? winningScore * 2
        : winningScore + ref.watch(gameDataProvider).overallScore;
  }
  return winningScore - ref.watch(gameDataProvider).overallScore < 0
      ? 0
      : winningScore - ref.watch(gameDataProvider).overallScore;
}
