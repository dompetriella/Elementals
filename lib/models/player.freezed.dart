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

/// @nodoc
mixin _$Player {
  String get id => throw _privateConstructorUsedError;
  ElementalType get elementalType => throw _privateConstructorUsedError;
  int get totalCards => throw _privateConstructorUsedError;
  List<ElementCard> get deck => throw _privateConstructorUsedError;
  List<ElementCard> get hand => throw _privateConstructorUsedError;
  List<ElementCard> get discardPile => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

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
      int totalCards,
      List<ElementCard> deck,
      List<ElementCard> hand,
      List<ElementCard> discardPile,
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
    Object? totalCards = null,
    Object? deck = null,
    Object? hand = null,
    Object? discardPile = null,
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
      totalCards: null == totalCards
          ? _value.totalCards
          : totalCards // ignore: cast_nullable_to_non_nullable
              as int,
      deck: null == deck
          ? _value.deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      hand: null == hand
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      discardPile: null == discardPile
          ? _value.discardPile
          : discardPile // ignore: cast_nullable_to_non_nullable
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
      int totalCards,
      List<ElementCard> deck,
      List<ElementCard> hand,
      List<ElementCard> discardPile,
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
    Object? totalCards = null,
    Object? deck = null,
    Object? hand = null,
    Object? discardPile = null,
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
      totalCards: null == totalCards
          ? _value.totalCards
          : totalCards // ignore: cast_nullable_to_non_nullable
              as int,
      deck: null == deck
          ? _value._deck
          : deck // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      hand: null == hand
          ? _value._hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      discardPile: null == discardPile
          ? _value._discardPile
          : discardPile // ignore: cast_nullable_to_non_nullable
              as List<ElementCard>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Player implements _Player {
  const _$_Player(
      {required this.id,
      required this.elementalType,
      this.totalCards = 0,
      final List<ElementCard> deck = const [],
      final List<ElementCard> hand = const [],
      final List<ElementCard> discardPile = const [],
      this.name = 'CardPerson'})
      : _deck = deck,
        _hand = hand,
        _discardPile = discardPile;

  @override
  final String id;
  @override
  final ElementalType elementalType;
  @override
  @JsonKey()
  final int totalCards;
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

  final List<ElementCard> _discardPile;
  @override
  @JsonKey()
  List<ElementCard> get discardPile {
    if (_discardPile is EqualUnmodifiableListView) return _discardPile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discardPile);
  }

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'Player(id: $id, elementalType: $elementalType, totalCards: $totalCards, deck: $deck, hand: $hand, discardPile: $discardPile, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Player &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.elementalType, elementalType) ||
                other.elementalType == elementalType) &&
            (identical(other.totalCards, totalCards) ||
                other.totalCards == totalCards) &&
            const DeepCollectionEquality().equals(other._deck, _deck) &&
            const DeepCollectionEquality().equals(other._hand, _hand) &&
            const DeepCollectionEquality()
                .equals(other._discardPile, _discardPile) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      elementalType,
      totalCards,
      const DeepCollectionEquality().hash(_deck),
      const DeepCollectionEquality().hash(_hand),
      const DeepCollectionEquality().hash(_discardPile),
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      __$$_PlayerCopyWithImpl<_$_Player>(this, _$identity);
}

abstract class _Player implements Player {
  const factory _Player(
      {required final String id,
      required final ElementalType elementalType,
      final int totalCards,
      final List<ElementCard> deck,
      final List<ElementCard> hand,
      final List<ElementCard> discardPile,
      final String name}) = _$_Player;

  @override
  String get id;
  @override
  ElementalType get elementalType;
  @override
  int get totalCards;
  @override
  List<ElementCard> get deck;
  @override
  List<ElementCard> get hand;
  @override
  List<ElementCard> get discardPile;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerCopyWith<_$_Player> get copyWith =>
      throw _privateConstructorUsedError;
}
