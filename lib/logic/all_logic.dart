import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/models/enums.dart';
import 'package:flutter_guid/flutter_guid.dart';

List<ElementCardData> createPlayerDeck(
    bool isPlayer, ElementalType elementalType) {
  int numberCopies = 2;
  List<ElementCardData> playerDeck = [];
  for (int n = 0; n < numberCopies; n++) {
    for (int i = 1; i < 8; i++) {
      playerDeck.add(ElementCardData(
          id: Guid.generate().toString(),
          elementalType: elementalType,
          value: i));
    }
  }
  playerDeck.shuffle();
  return playerDeck;
}

ElementCardData dealPlayerCard(List<ElementCardData> playerDeck) {
  ElementCardData returnCard = playerDeck.first;
  playerDeck.removeAt(0);
  return returnCard;
}

List<ElementCardData> dealPlayerHand(List<ElementCardData> playerDeck,
    {int amount = 5}) {
  List<ElementCardData> playerHand = [];
  for (int i = 0; i < amount; i++) {
    playerHand.add(dealPlayerCard(playerDeck));
  }
  return playerHand;
}
