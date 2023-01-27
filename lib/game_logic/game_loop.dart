import 'package:elementals/providers/gameProvider.dart';
import 'package:elementals/providers/playerProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

endPlayerTurn(WidgetRef ref) {
  if (ref.watch(currentPlayerTurnProvider) == ref.watch(playerProvider).id) {
    ref.watch(currentPlayerTurnProvider.notifier).state =
        ref.watch(opponentProvider).id;
  } else {
    ref.watch(currentPlayerTurnProvider.notifier).state =
        ref.watch(playerProvider).id;
  }
}
