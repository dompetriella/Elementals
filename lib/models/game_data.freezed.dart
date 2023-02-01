// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return _GameData.fromJson(json);
}

/// @nodoc
mixin _$GameData {
  List<ElementCardData> get playZone => throw _privateConstructorUsedError;
  int get totalTurns => throw _privateConstructorUsedError;
  int get currentTurns => throw _privateConstructorUsedError;
  List<PlayerData> get players => throw _privateConstructorUsedError;
  PlayerData get currentPlayer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameDataCopyWith<GameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDataCopyWith<$Res> {
  factory $GameDataCopyWith(GameData value, $Res Function(GameData) then) =
      _$GameDataCopyWithImpl<$Res, GameData>;
  @useResult
  $Res call(
      {List<ElementCardData> playZone,
      int totalTurns,
      int currentTurns,
      List<PlayerData> players,
      PlayerData currentPlayer});

  $PlayerDataCopyWith<$Res> get currentPlayer;
}

/// @nodoc
class _$GameDataCopyWithImpl<$Res, $Val extends GameData>
    implements $GameDataCopyWith<$Res> {
  _$GameDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playZone = null,
    Object? totalTurns = null,
    Object? currentTurns = null,
    Object? players = null,
    Object? currentPlayer = null,
  }) {
    return _then(_value.copyWith(
      playZone: null == playZone
          ? _value.playZone
          : playZone // ignore: cast_nullable_to_non_nullable
              as List<ElementCardData>,
      totalTurns: null == totalTurns
          ? _value.totalTurns
          : totalTurns // ignore: cast_nullable_to_non_nullable
              as int,
      currentTurns: null == currentTurns
          ? _value.currentTurns
          : currentTurns // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerData>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as PlayerData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerDataCopyWith<$Res> get currentPlayer {
    return $PlayerDataCopyWith<$Res>(_value.currentPlayer, (value) {
      return _then(_value.copyWith(currentPlayer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameDataCopyWith<$Res> implements $GameDataCopyWith<$Res> {
  factory _$$_GameDataCopyWith(
          _$_GameData value, $Res Function(_$_GameData) then) =
      __$$_GameDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ElementCardData> playZone,
      int totalTurns,
      int currentTurns,
      List<PlayerData> players,
      PlayerData currentPlayer});

  @override
  $PlayerDataCopyWith<$Res> get currentPlayer;
}

/// @nodoc
class __$$_GameDataCopyWithImpl<$Res>
    extends _$GameDataCopyWithImpl<$Res, _$_GameData>
    implements _$$_GameDataCopyWith<$Res> {
  __$$_GameDataCopyWithImpl(
      _$_GameData _value, $Res Function(_$_GameData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playZone = null,
    Object? totalTurns = null,
    Object? currentTurns = null,
    Object? players = null,
    Object? currentPlayer = null,
  }) {
    return _then(_$_GameData(
      playZone: null == playZone
          ? _value._playZone
          : playZone // ignore: cast_nullable_to_non_nullable
              as List<ElementCardData>,
      totalTurns: null == totalTurns
          ? _value.totalTurns
          : totalTurns // ignore: cast_nullable_to_non_nullable
              as int,
      currentTurns: null == currentTurns
          ? _value.currentTurns
          : currentTurns // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<PlayerData>,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as PlayerData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameData implements _GameData {
  const _$_GameData(
      {final List<ElementCardData> playZone = const [
        ElementCardData(
            id: '0', ownerId: '0', elementalType: ElementalType.fire, value: 4)
      ],
      this.totalTurns = 0,
      this.currentTurns = 0,
      final List<PlayerData> players = const [],
      this.currentPlayer = const PlayerData()})
      : _playZone = playZone,
        _players = players;

  factory _$_GameData.fromJson(Map<String, dynamic> json) =>
      _$$_GameDataFromJson(json);

  final List<ElementCardData> _playZone;
  @override
  @JsonKey()
  List<ElementCardData> get playZone {
    if (_playZone is EqualUnmodifiableListView) return _playZone;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playZone);
  }

  @override
  @JsonKey()
  final int totalTurns;
  @override
  @JsonKey()
  final int currentTurns;
  final List<PlayerData> _players;
  @override
  @JsonKey()
  List<PlayerData> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  @JsonKey()
  final PlayerData currentPlayer;

  @override
  String toString() {
    return 'GameData(playZone: $playZone, totalTurns: $totalTurns, currentTurns: $currentTurns, players: $players, currentPlayer: $currentPlayer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameData &&
            const DeepCollectionEquality().equals(other._playZone, _playZone) &&
            (identical(other.totalTurns, totalTurns) ||
                other.totalTurns == totalTurns) &&
            (identical(other.currentTurns, currentTurns) ||
                other.currentTurns == currentTurns) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_playZone),
      totalTurns,
      currentTurns,
      const DeepCollectionEquality().hash(_players),
      currentPlayer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      __$$_GameDataCopyWithImpl<_$_GameData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameDataToJson(
      this,
    );
  }
}

abstract class _GameData implements GameData {
  const factory _GameData(
      {final List<ElementCardData> playZone,
      final int totalTurns,
      final int currentTurns,
      final List<PlayerData> players,
      final PlayerData currentPlayer}) = _$_GameData;

  factory _GameData.fromJson(Map<String, dynamic> json) = _$_GameData.fromJson;

  @override
  List<ElementCardData> get playZone;
  @override
  int get totalTurns;
  @override
  int get currentTurns;
  @override
  List<PlayerData> get players;
  @override
  PlayerData get currentPlayer;
  @override
  @JsonKey(ignore: true)
  _$$_GameDataCopyWith<_$_GameData> get copyWith =>
      throw _privateConstructorUsedError;
}
