// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameData _$$_GameDataFromJson(Map<String, dynamic> json) => _$_GameData(
      playZone: (json['playZone'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalTurns: json['totalTurns'] as int? ?? 0,
      currentTurns: json['currentTurns'] as int? ?? 0,
      playerIds: (json['playerIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      playerOneId: json['playerOneId'] as String? ?? '0',
      playerOneHand: (json['playerOneHand'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerOneDeck: (json['playerOneDeck'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerOneDiscard: (json['playerOneDiscard'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerTwoId: json['playerTwoId'] as String? ?? '0',
      playerTwoHand: (json['playerTwoHand'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerTwoDeck: (json['playerTwoDeck'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playerTwoDiscard: (json['playerTwoDiscard'] as List<dynamic>?)
              ?.map((e) => ElementCardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GameDataToJson(_$_GameData instance) =>
    <String, dynamic>{
      'playZone': instance.playZone,
      'totalTurns': instance.totalTurns,
      'currentTurns': instance.currentTurns,
      'playerIds': instance.playerIds,
      'playerOneId': instance.playerOneId,
      'playerOneHand': instance.playerOneHand,
      'playerOneDeck': instance.playerOneDeck,
      'playerOneDiscard': instance.playerOneDiscard,
      'playerTwoId': instance.playerTwoId,
      'playerTwoHand': instance.playerTwoHand,
      'playerTwoDeck': instance.playerTwoDeck,
      'playerTwoDiscard': instance.playerTwoDiscard,
    };
