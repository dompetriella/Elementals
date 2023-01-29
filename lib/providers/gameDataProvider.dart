import 'package:elementals/models/player_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_data.dart';

final gameDataProvider = StateNotifierProvider<GameNotifier, GameData>((ref) {
  return GameNotifier();
});

class GameNotifier extends StateNotifier<GameData> {
  GameNotifier() : super(GameData(players: [PlayerData(), PlayerData()]));
}
