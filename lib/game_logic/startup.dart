import 'dart:math';
import 'package:elementals/providers/gameProvider.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/enums.dart';
import '../providers/playerProvider.dart';

setInitalPlayerProperties(WidgetRef ref) {
  ref
      .watch(playerProvider.notifier)
      .state
      .copyWith(id: Guid.generate().toString());

  ref
      .watch(opponentProvider.notifier)
      .state
      .copyWith(id: Guid.generate().toString());
  ref
      .watch(opponentProvider.notifier)
      .changePlayerElement(ElementalType.values[Random().nextInt(3)]);
  ref.watch(currentPlayerTurnProvider.notifier).state =
      chooseStartingPlayer(ref);
}

String chooseStartingPlayer(WidgetRef ref) {
  List<String> list = [
    ref.read(playerProvider).id,
    ref.read(opponentProvider).id
  ];
  final _random = new Random();
  var element = list[_random.nextInt(list.length)];
  return element;
}
