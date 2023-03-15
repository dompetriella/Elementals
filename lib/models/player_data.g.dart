// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlayerData _$$_PlayerDataFromJson(Map<String, dynamic> json) =>
    _$_PlayerData(
      id: json['id'] as String? ?? '0',
      playerNumber: json['playerNumber'] as int? ?? 0,
      elementalType:
          $enumDecodeNullable(_$ElementalTypeEnumMap, json['elementalType']) ??
              ElementalType.fire,
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
      score: json['score'] as int? ?? 0,
      selectedCard: json['selectedCard'] as String? ?? '',
      abilityCharges: json['abilityCharges'] as int? ?? 1,
      abilityActive: json['abilityActive'] as bool? ?? false,
      elementalAbility:
          $enumDecodeNullable(_$AbilityEnumMap, json['elementalAbility']) ??
              Ability.burn,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$_PlayerDataToJson(_$_PlayerData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playerNumber': instance.playerNumber,
      'elementalType': _$ElementalTypeEnumMap[instance.elementalType]!,
      'deck': instance.deck,
      'hand': instance.hand,
      'discardPile': instance.discardPile,
      'score': instance.score,
      'selectedCard': instance.selectedCard,
      'abilityCharges': instance.abilityCharges,
      'abilityActive': instance.abilityActive,
      'elementalAbility': _$AbilityEnumMap[instance.elementalAbility]!,
      'name': instance.name,
    };

const _$ElementalTypeEnumMap = {
  ElementalType.fire: 'fire',
  ElementalType.air: 'air',
  ElementalType.water: 'water',
  ElementalType.earth: 'earth',
};

const _$AbilityEnumMap = {
  Ability.burn: 'burn',
  Ability.gust: 'gust',
  Ability.float: 'float',
  Ability.forge: 'forge',
  Ability.glow: 'glow',
  Ability.gale: 'gale',
  Ability.tide: 'tide',
  Ability.crumble: 'crumble',
};
