import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

@freezed
class Ability with _$Ability {
  const factory Ability(
      {required ElementalType elementalType,
      required String name,
      required String description}) = _Ability;

  factory Ability.fromJson(Map<String, Object?> json) =>
      _$AbilityFromJson(json);
}
