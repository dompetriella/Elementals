// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  ElementalType get elementalType => throw _privateConstructorUsedError;
  List<ElementCard> get deck => throw _privateConstructorUsedError;
  List<ElementCard> get hand => throw _privateConstructorUsedError;
  List<ElementCard> get tableCards => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call(
      {String id,
      ElementalType elementalType,
      List<ElementCard> deck,
      List<ElementCard> hand,
      List<ElementCard> tableCards,
      String name});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? elementalType = null,
    Object? deck = null,
    Object? hand = null,
    Object? tableCards = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      elementalType: null == elementalType
          ? _value.elementalType
          : elementalType // ignore: cast_nullable_to_non_nullable
              as ElementalType,
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      hand: null == hand
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      tableCards: null == tableCards
          ? _value.tableCards
          : tableCards // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$_PlayerCopyWith(_$_Player value, $Res Function(_$_Player) then) =
      __$$_PlayerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ElementalType elementalType,
      List<ElementCard> deck,
      List<ElementCard> hand,
      List<ElementCard> tableCards,
      String name});
}

/// @nodoc
class __$$_PlayerCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$_Player>
    implements _$$_PlayerCopyWith<$Res> {
  __$$_PlayerCopyWithImpl(_$_Player _value, $Res Function(_$_Player) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? elementalType = null,
    Object? deck = null,
    Object? hand = null,
    Object? tableCards = null,
    Object? name = null,
  }) {
    return _then(_$_Player(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      elementalType: null == elementalType
          ? _value.elementalType
          : elementalType // ignore: cast_nullable_to_non_nullable
              as ElementalType,
      deck: null == deck
          ? _value._deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      hand: null == hand
          ? _value._hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      tableCards: null == tableCards
          ? _value._tableCards
          : tableCards // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Player implements _Player {
  const _$_Player(
      {required this.id,
      required this.elementalType,
      final List<ElementCard> deck = const [],
      final List<ElementCard> hand = const [],
      final List<ElementCard> tableCards = const [],
      this.name = 'CardPerson'})
      : _deck = deck,
        _hand = hand,
        _tableCards = tableCards;

  factory _$_Player.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerFromJson(json);

  @override
  final String id;
  @override
  final ElementalType elementalType;
  final List<ElementCard> _deck;
  @override
  @JsonKey()
  List<ElementCard> get deck {
    if (_deck is EqualUnmodifiableListView) return _deck;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deck);
  }

  final List<ElementCard> _hand;
  @override
  @JsonKey()
  List<ElementCard> get hand {
    if (_hand is EqualUnmodifiableListView) return _hand;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hand);
  }

  final List<ElementCard> _tableCards;
  @override
  @JsonKey()
  List<ElementCard> get tableCards {
    if (_tableCards is EqualUnmodifiableListView) return _tableCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableCards);
  }

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'Player(id: $id, elementalType: $elementalType, deck: $deck, hand: $hand, tableCards: $tableCards, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Player &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.elementalType, elementalType) ||
                other.elementalType == elementalType) &&
            const DeepCollectionEquality().equals(other._deck, _deck) &&
            const DeepCollectionEquality().equals(other._hand, _hand) &&
            const DeepCollectionEquality()
                .equals(other._tableCards, _tableCards) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      elementalType,
      const DeepCollectionEquality().hash(_deck),
      const DeepCollectionEquality().hash(_hand),
      const DeepCollectionEquality().hash(_tableCards),
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      __$$_PlayerCopyWithImpl<_$_Player>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {required final String id,
      required final ElementalType elementalType,
      final List<ElementCard> deck,
      final List<ElementCard> hand,
      final List<ElementCard> tableCards,
      final String name}) = _$_Player;

  factory _Player.fromJson(Map<String, dynamic> json) = _$_Player.fromJson;

  @override
  String get id;
  @override
  ElementalType get elementalType;
  @override
  List<ElementCard> get deck;
  @override
  List<ElementCard> get hand;
  @override
  List<ElementCard> get tableCards;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      throw _privateConstructorUsedError;
}
