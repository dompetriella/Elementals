import 'package:elementals/game_logic/animation_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums.dart';
import '../providers/gameDataProvider.dart';
import '../providers/playerDataProvider.dart';

endPlayerTurn(WidgetRef ref) {
  ref.watch(gameDataProvider.notifier).discardPlayZone(ref);
  clearCardTransforms(ref);
  ref.watch(playerProvider.notifier).discardHand(ref, Players.p1);
}
