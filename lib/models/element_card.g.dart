// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ElementCard _$$_ElementCardFromJson(Map<String, dynamic> json) =>
    _$_ElementCard(
      id: json['id'] as String,
      elementalType: $enumDecode(_$ElementalTypeEnumMap, json['elementalType']),
      value: json['value'] as int,
      isFaceUp: json['isFaceUp'] as bool? ?? false,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ElementCardToJson(_$_ElementCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'elementalType': _$ElementalTypeEnumMap[instance.elementalType]!,
      'value': instance.value,
      'isFaceUp': instance.isFaceUp,
      'isSelected': instance.isSelected,
    };

const _$ElementalTypeEnumMap = {
  ElementalType.fire: 'fire',
  ElementalType.water: 'water',
  ElementalType.air: 'air',
  ElementalType.earth: 'earth',
};
