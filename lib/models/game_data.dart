import 'package:freezed_annotation/freezed_annotation.dart';
import '../game_components/element_card.dart';
import 'element_card_data.dart';
import 'enums.dart';

part 'game_data.freezed.dart';
part 'game_data.g.dart';

@freezed
class GameData with _$GameData {
  const factory GameData({
    @Default([]) List<ElementCardData> playZone,
    @Default(0) int totalTurns,
    @Default(0) int currentTurns,
    @Default([]) List<String> playerIds,
    @Default('0') String playerOneId,
    @Default(ElementalType.fire) ElementalType playerOneElement,
    @Default([]) List<ElementCardData> playerOneHand,
    @Default([]) List<ElementCardData> playerOneDeck,
    @Default([]) List<ElementCardData> playerOneDiscard,
    @Default('0') String playerTwoId,
    @Default(ElementalType.fire) ElementalType playerTwoElement,
    @Default([]) List<ElementCardData> playerTwoHand,
    @Default([]) List<ElementCardData> playerTwoDeck,
    @Default([]) List<ElementCardData> playerTwoDiscard,
  }) = _GameData;

  factory GameData.fromJson(Map<String, Object?> json) =>
      _$GameDataFromJson(json);
}
