import 'package:elementals/providers/playerProvider.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

setInitalPlayerProperties(WidgetRef ref) {
  var playerOneState = ref.watch(playerProvider.notifier).state;
  var playerTwoState = ref.watch(opponentProvider.notifier).state;

  playerOneState = playerOneState.copyWith(id: Guid.generate().toString());
  playerTwoState = playerTwoState.copyWith(id: Guid.generate().toString());
}
