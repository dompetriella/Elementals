import 'package:elementals/providers/gameProvider.dart';
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
            ownerId: state.id,
            elementalType: state.elementalType,
            value: i));
      }
    }
    state = state.copyWith(deck: playerDeck);
  }

  drawCardFromDeck() {
    ElementCardData card = state.deck.first;
    state.copyWith(hand: [...state.hand, card]);
    List<ElementCardData> deckCopy = state.deck.toList();
    deckCopy.removeWhere((element) => element.id == card.id);
    state.copyWith(deck: deckCopy);
  }

  drawMultipleCardsFromDeck({amount = 5}) {
    for (int i = 0; i < amount; i++) {
      drawCardFromDeck();
    }
  }

  playCardFromHand(String cardId, WidgetRef ref) {
    ElementCardData card = retrieveCardById(cardId, state.hand);
    List<ElementCardData> handCopy = state.hand.toList();
    handCopy.removeWhere((element) => element.id == cardId);
    state.copyWith(hand: handCopy);
    ref.watch(playZoneProvider.notifier).state = [
      card,
      ...ref.watch(playZoneProvider)
    ];
  }
}

ElementCardData retrieveCardById(
    String cardId, List<ElementCardData> fromList) {
  return fromList.where((element) => element.id == cardId).first;
}
