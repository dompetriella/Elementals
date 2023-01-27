import 'dart:math';

import 'package:elementals/providers/playerProvider.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums.dart';

setInitalPlayerProperties(WidgetRef ref) {
  var playerOneState = ref.watch(playerProvider.notifier).state;
  var playerTwoState = ref.watch(opponentProvider.notifier).state;

  playerOneState = playerOneState.copyWith(id: Guid.generate().toString());
  playerTwoState = playerTwoState.copyWith(
      id: Guid.generate().toString(),
      elementalType: ElementalType.values[Random().nextInt(3)]);
}
