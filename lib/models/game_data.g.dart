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
      players: (json['players'] as List<dynamic>?)
              ?.map((e) => PlayerData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GameDataToJson(_$_GameData instance) =>
    <String, dynamic>{
      'playZone': instance.playZone,
      'totalTurns': instance.totalTurns,
      'currentTurns': instance.currentTurns,
      'players': instance.players,
    };
