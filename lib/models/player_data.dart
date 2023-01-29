import 'package:freezed_annotation/freezed_annotation.dart';
import 'element_card_data.dart';
import 'enums.dart';

part 'player_data.freezed.dart';
part 'player_data.g.dart';

@freezed
class PlayerData with _$PlayerData {
  const factory PlayerData({
    @Default('0') String id,
    @Default(ElementalType.fire) ElementalType elementalType,
    @Default(20) int totalCards,
    @Default([]) List<ElementCardData> deck,
    @Default([]) List<ElementCardData> hand,
    @Default([]) List<ElementCardData> discardPile,
    @Default('CardPerson') String name,
  }) = _PlayerData;

  factory PlayerData.fromJson(Map<String, Object?> json) =>
      _$PlayerDataFromJson(json);
}
