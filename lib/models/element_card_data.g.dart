// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ElementCardData _$$_ElementCardDataFromJson(Map<String, dynamic> json) =>
    _$_ElementCardData(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      elementalType: $enumDecode(_$ElementalTypeEnumMap, json['elementalType']),
      value: json['value'] as int,
      canBeSelected: json['canBeSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ElementCardDataToJson(_$_ElementCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'elementalType': _$ElementalTypeEnumMap[instance.elementalType]!,
      'value': instance.value,
      'canBeSelected': instance.canBeSelected,
    };

const _$ElementalTypeEnumMap = {
  ElementalType.fire: 'fire',
  ElementalType.air: 'air',
  ElementalType.water: 'water',
  ElementalType.earth: 'earth',
};
