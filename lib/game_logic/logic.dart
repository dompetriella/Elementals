import 'package:elementals/game_components/element_card.dart';
import 'package:elementals/providers/dynamicInfoProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_components/placeholder_card.dart';
import '../models/element_card_data.dart';
import '../models/enums.dart';
import '../providers/gameDataProvider.dart';
import '../providers/playerDataProvider.dart';
import 'animation_logic.dart';

int numberOfCopiesInDeck = 4;

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
  for (int n = 0; n < numberOfCopiesInDeck; n++) {
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
            .playCard(elementCardData.id, ref, Players.p1);
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
          .playCard(elementCardData.id, ref, Players.p1);
      clearCardTransforms(ref);
    } else {
      clearCardTransforms(ref);
      notifyDynamicInfo(ref, 'Card is unplayable');
    }
  }
}
