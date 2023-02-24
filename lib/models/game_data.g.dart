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
      totalTurns: json['totalTurns'] as int? ?? 1,
      playerTurns: json['playerTurns'] as int? ?? 1,
      players: (json['players'] as List<dynamic>?)
              ?.map((e) => PlayerData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentPlayer: json['currentPlayer'] == null
          ? const PlayerData()
          : PlayerData.fromJson(json['currentPlayer'] as Map<String, dynamic>),
      overallScore: json['overallScore'] as int? ?? 0,
      currentWinner: json['currentWinner'] == null
          ? const PlayerData()
          : PlayerData.fromJson(json['currentWinner'] as Map<String, dynamic>),
      gameOver: json['gameOver'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GameDataToJson(_$_GameData instance) =>
    <String, dynamic>{
      'playZone': instance.playZone,
      'totalTurns': instance.totalTurns,
      'playerTurns': instance.playerTurns,
      'players': instance.players,
      'currentPlayer': instance.currentPlayer,
      'overallScore': instance.overallScore,
      'currentWinner': instance.currentWinner,
      'gameOver': instance.gameOver,
    };
