import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/providers/playerProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playZoneProvider =
    StateNotifierProvider<PlayZoneNotifier, List<ElementCardData>>((ref) {
  return PlayZoneNotifier();
});

class PlayZoneNotifier extends StateNotifier<List<ElementCardData>> {
  PlayZoneNotifier() : super([]);

  discardPlayedCards(WidgetRef ref) {
    ElementCardData lastCardPlayed = state.last;
    List<ElementCardData> stateCopy = state.toList();
    stateCopy.removeLast();
    state = stateCopy;
    for (ElementCardData playedCard in state) {
      if (playedCard.ownerId == ref.read(playerProvider).id) {
        ref
            .watch(playerProvider.notifier)
            .state
            .copyWith(deck: [...ref.watch(playerProvider).deck, playedCard]);
      } else if (playedCard.ownerId == ref.read(opponentProvider).id) {
        ref
            .watch(opponentProvider.notifier)
            .state
            .copyWith(deck: [...ref.watch(opponentProvider).deck, playedCard]);
      }
    }
    state = [lastCardPlayed];
  }
}
