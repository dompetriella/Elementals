// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerData _$$_PlayerDataFromJson(Map<String, dynamic> json) =>
    _$_PlayerData(
      id: json['id'] as String? ?? '0',
      elementalType:
          $enumDecodeNullable(_$ElementalTypeEnumMap, json['elementalType']) ??
              ElementalType.fire,
      totalCards: json['totalCards'] as int? ?? 20,
      deck: (json['deck'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hand: (json['hand'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      discardPile: (json['discardPile'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedCard: json['selectedCard'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$_PlayerDataToJson(_$_PlayerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'elementalType': _$ElementalTypeEnumMap[instance.elementalType]!,
      'totalCards': instance.totalCards,
      'deck': instance.deck,
      'hand': instance.hand,
      'discardPile': instance.discardPile,
      'selectedCard': instance.selectedCard,
      'name': instance.name,
    };

const _$ElementalTypeEnumMap = {
  ElementalType.fire: 'fire',
  ElementalType.air: 'air',
  ElementalType.water: 'water',
  ElementalType.earth: 'earth',
};
