import 'package:elementals/models/element_card_data.dart';
import 'package:elementals/providers/playerProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../game_components/element_card.dart';
import '../models/game_data.dart';

final gameDataProvider = StateNotifierProvider<GameNotifier, GameData>((ref) {
  return GameNotifier();
});

class GameNotifier extends StateNotifier<GameData> {
  GameNotifier() : super(GameData());
}
