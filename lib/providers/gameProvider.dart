import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_components/element_card.dart';
import '../models/game.dart';
import '../models/game_data.dart';

final gameProvider = StateNotifierProvider<GameNotifier, Game>((ref) {
  return GameNotifier();
});

class GameNotifier extends StateNotifier<Game> {
  GameNotifier() : super(Game());
}
