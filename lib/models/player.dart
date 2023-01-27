import 'package:freezed_annotation/freezed_annotation.dart';
import '../game_components/element_card.dart';
import 'enums.dart';

part 'player.freezed.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required ElementalType elementalType,
    @Default(0) int totalCards,
    @Default([]) List<ElementCard> deck,
    @Default([]) List<ElementCard> hand,
    @Default([]) List<ElementCard> discardPile,
    @Default('CardPerson') String name,
  }) = _Player;
}
