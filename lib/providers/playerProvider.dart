import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/element_card_data.dart';
import '../models/enums.dart';
import '../models/player.dart';

final playerProvider = StateNotifierProvider<PlayerNotifier, Player>((ref) {
  return PlayerNotifier();
});

final opponentProvider = StateNotifierProvider<PlayerNotifier, Player>((ref) {
  return PlayerNotifier();
});

class PlayerNotifier extends StateNotifier<Player> {
  PlayerNotifier() : super(Player(id: '0', elementalType: ElementalType.fire));

  changePlayerElement(ElementalType elementalType) {
    state = state.copyWith(elementalType: elementalType);
  }

  createPlayerDeck() {
    List<ElementCardData> playerDeck = [];
    for (int n = 0; n < 2; n++) {
      for (int i = 1; i < 8; i++) {
        playerDeck.add(ElementCardData(
            id: Guid.generate().toString(),
            elementalType: state.elementalType,
            value: i));
      }
    }
    state = state.copyWith(deck: playerDeck);
  }
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
