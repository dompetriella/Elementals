import 'package:freezed_annotation/freezed_annotation.dart';
import '../game_components/element_card.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    @Default([]) List<ElementCard> playZone,
  }) = _Game;
}
