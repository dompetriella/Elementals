import 'package:freezed_annotation/freezed_annotation.dart';

import 'element_card_data.dart';
import 'enums.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required ElementalType elementalType,
    @Default(0) int totalCards,
    @Default([]) List<ElementCardData> deck,
    @Default([]) List<ElementCardData> hand,
    @Default([]) List<ElementCardData> discardPile,
    @Default('CardPerson') String name,
  }) = _Player;

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
