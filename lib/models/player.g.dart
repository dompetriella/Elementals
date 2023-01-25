// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Player _$$_PlayerFromJson(Map<String, dynamic> json) => _$_Player(
      id: json['id'] as String,
      elementalType: $enumDecode(_$ElementalTypeEnumMap, json['elementalType']),
      deck: (json['deck'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hand: (json['hand'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tableCards: (json['tableCards'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      name: json['name'] as String? ?? 'CardPerson',
    );

Map<String, dynamic> _$$_PlayerToJson(_$_Player instance) => <String, dynamic>{
      'id': instance.id,
      'elementalType': _$ElementalTypeEnumMap[instance.elementalType]!,
      'deck': instance.deck,
      'hand': instance.hand,
      'tableCards': instance.tableCards,
      'name': instance.name,
    };

const _$ElementalTypeEnumMap = {
  ElementalType.fire: 'fire',
  ElementalType.water: 'water',
  ElementalType.air: 'air',
  ElementalType.earth: 'earth',
};
