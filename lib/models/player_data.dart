import 'package:freezed_annotation/freezed_annotation.dart';
import '../game_logic/elemental_abilities.dart';
import 'element_card_data.dart';
import 'enums.dart';

part 'player_data.freezed.dart';
part 'player_data.g.dart';

@freezed
class PlayerData with _$PlayerData {
  const factory PlayerData(
      {@Default('0') String id,
      @Default(0) int playerNumber,
      @Default(ElementalType.fire) ElementalType elementalType,
      @Default([]) List<ElementCardData> deck,
      @Default([]) List<ElementCardData> hand,
      @Default([]) List<ElementCardData> discardPile,
      @Default(0) int score,
      @Default('') String selectedCard,
      @Default(1) int abilityCharges,
      @Default(false) bool abilityActive,
      @Default(Ability.burn) Ability elementalAbility,
      @Default('') String name}) = _PlayerData;

  factory PlayerData.fromJson(Map<String, Object?> json) =>
      _$PlayerDataFromJson(json);
}
