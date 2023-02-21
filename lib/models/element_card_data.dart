import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'element_card_data.freezed.dart';
part 'element_card_data.g.dart';

@freezed
class ElementCardData with _$ElementCardData {
  const factory ElementCardData(
      {required String id,
      required String ownerId,
      required ElementalType elementalType,
      required int value,
      @Default(false) bool canBeSelected,
      @Default(true) bool isTangible}) = _ElementCardData;

  factory ElementCardData.fromJson(Map<String, Object?> json) =>
      _$ElementCardDataFromJson(json);
}
