import 'package:freezed_annotation/freezed_annotation.dart';

import 'element_card.dart';
import 'enums.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required ElementalType elementalType,
    @Default([]) List<ElementCard> deck,
    @Default([]) List<ElementCard> hand,
    @Default([]) List<ElementCard> tableCards,
    @Default('CardPerson') String name,
  }) = _Player;

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);
}
