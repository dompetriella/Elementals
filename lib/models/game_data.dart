import 'package:elementals/models/player_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'element_card_data.dart';
import 'enums.dart';

part 'game_data.freezed.dart';
part 'game_data.g.dart';

@freezed
class GameData with _$GameData {
  const factory GameData(
      {@Default([]) List<ElementCardData> playZone,
      @Default(0) int totalTurns,
      @Default(0) int currentTurns,
      @Default([]) List<PlayerData> players,
      @Default(PlayerData()) PlayerData currentPlayer,
      @Default(0) int overallScore,
      @Default(PlayerData()) currentWinner,
      @Default(false) bool gameOver}) = _GameData;

  factory GameData.fromJson(Map<String, Object?> json) =>
      _$GameDataFromJson(json);
}
