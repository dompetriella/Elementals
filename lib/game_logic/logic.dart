import 'package:elementals/game_components/element_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_guid/flutter_guid.dart';

import '../game_components/placeholder_card.dart';
import '../models/element_card_data.dart';
import '../models/enums.dart';

List<ElementCard> convertDataToCards(List<ElementCardData> cardData,
    {bool hasShadow = false}) {
  return cardData
      .map((e) => ElementCard(
            elementCardData: e,
            hasShadow: hasShadow,
          ))
      .toList();
}

int copiesOfEachNumber = 3;

List<ElementCardData> createPlayerDeck(
    String ownerId, ElementalType ownerElementalType) {
  List<ElementCardData> playerDeck = [];
  for (int n = 0; n < copiesOfEachNumber; n++) {
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
