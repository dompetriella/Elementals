import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'element_card.freezed.dart';
part 'element_card.g.dart';

@freezed
class ElementCard with _$ElementCard {
  const factory ElementCard(
      {required String id,
      required ElementalType elementalType,
      required int value,
      @Default(false) bool isFaceUp,
      @Default(false) bool isSelected}) = _ElementCard;

  factory ElementCard.fromJson(Map<String, Object?> json) =>
      _$ElementCardFromJson(json);
}
