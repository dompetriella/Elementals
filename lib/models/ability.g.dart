// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ability _$$_AbilityFromJson(Map<String, dynamic> json) => _$_Ability(
      elementalType: $enumDecode(_$ElementalTypeEnumMap, json['elementalType']),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_AbilityToJson(_$_Ability instance) =>
    <String, dynamic>{
      'elementalType': _$ElementalTypeEnumMap[instance.elementalType]!,
      'name': instance.name,
      'description': instance.description,
    };

const _$ElementalTypeEnumMap = {
  ElementalType.fire: 'fire',
  ElementalType.air: 'air',
  ElementalType.water: 'water',
  ElementalType.earth: 'earth',
};
