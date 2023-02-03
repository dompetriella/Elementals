// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerData _$PlayerDataFromJson(Map<String, dynamic> json) {
  return _PlayerData.fromJson(json);
}

/// @nodoc
mixin _$PlayerData {
  String get id => throw _privateConstructorUsedError;
  ElementalType get elementalType => throw _privateConstructorUsedError;
  int get totalCards => throw _privateConstructorUsedError;
  List<ElementCardData> get deck => throw _privateConstructorUsedError;
  List<ElementCardData> get hand => throw _privateConstructorUsedError;
  List<ElementCardData> get discardPile => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  String get selectedCard => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerDataCopyWith<PlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerDataCopyWith<$Res> {
  factory $PlayerDataCopyWith(
          PlayerData value, $Res Function(PlayerData) then) =
      _$PlayerDataCopyWithImpl<$Res, PlayerData>;
  @useResult
  $Res call(
      {String id,
      ElementalType elementalType,
      int totalCards,
      List<ElementCardData> deck,
      List<ElementCardData> hand,
      List<ElementCardData> discardPile,
      int score,
      String selectedCard,
      String name});
}

/// @nodoc
class _$PlayerDataCopyWithImpl<$Res, $Val extends PlayerData>
    implements $PlayerDataCopyWith<$Res> {
  _$PlayerDataCopyWithImpl(this._value, this._then);

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
    Object? score = null,
    Object? selectedCard = null,
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
              as List<ElementCardData>,
      hand: null == hand
          ? _value.hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<ElementCardData>,
      discardPile: null == discardPile
          ? _value.discardPile
          : discardPile // ignore: cast_nullable_to_non_nullable
              as List<ElementCardData>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCard: null == selectedCard
          ? _value.selectedCard
          : selectedCard // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlayerDataCopyWith<$Res>
    implements $PlayerDataCopyWith<$Res> {
  factory _$$_PlayerDataCopyWith(
          _$_PlayerData value, $Res Function(_$_PlayerData) then) =
      __$$_PlayerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ElementalType elementalType,
      int totalCards,
      List<ElementCardData> deck,
      List<ElementCardData> hand,
      List<ElementCardData> discardPile,
      int score,
      String selectedCard,
      String name});
}

/// @nodoc
class __$$_PlayerDataCopyWithImpl<$Res>
    extends _$PlayerDataCopyWithImpl<$Res, _$_PlayerData>
    implements _$$_PlayerDataCopyWith<$Res> {
  __$$_PlayerDataCopyWithImpl(
      _$_PlayerData _value, $Res Function(_$_PlayerData) _then)
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
    Object? score = null,
    Object? selectedCard = null,
    Object? name = null,
  }) {
    return _then(_$_PlayerData(
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
              as List<ElementCardData>,
      hand: null == hand
          ? _value._hand
          : hand // ignore: cast_nullable_to_non_nullable
              as List<ElementCardData>,
      discardPile: null == discardPile
          ? _value._discardPile
          : discardPile // ignore: cast_nullable_to_non_nullable
              as List<ElementCardData>,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCard: null == selectedCard
          ? _value.selectedCard
          : selectedCard // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlayerData implements _PlayerData {
  const _$_PlayerData(
      {this.id = '0',
      this.elementalType = ElementalType.fire,
      this.totalCards = 20,
      final List<ElementCardData> deck = const [],
      final List<ElementCardData> hand = const [],
      final List<ElementCardData> discardPile = const [],
      this.score = 0,
      this.selectedCard = '',
      this.name = ''})
      : _deck = deck,
        _hand = hand,
        _discardPile = discardPile;

  factory _$_PlayerData.fromJson(Map<String, dynamic> json) =>
      _$$_PlayerDataFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final ElementalType elementalType;
  @override
  @JsonKey()
  final int totalCards;
  final List<ElementCardData> _deck;
  @override
  @JsonKey()
  List<ElementCardData> get deck {
    if (_deck is EqualUnmodifiableListView) return _deck;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deck);
  }

  final List<ElementCardData> _hand;
  @override
  @JsonKey()
  List<ElementCardData> get hand {
    if (_hand is EqualUnmodifiableListView) return _hand;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hand);
  }

  final List<ElementCardData> _discardPile;
  @override
  @JsonKey()
  List<ElementCardData> get discardPile {
    if (_discardPile is EqualUnmodifiableListView) return _discardPile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discardPile);
  }

  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final String selectedCard;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'PlayerData(id: $id, elementalType: $elementalType, totalCards: $totalCards, deck: $deck, hand: $hand, discardPile: $discardPile, score: $score, selectedCard: $selectedCard, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayerData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.elementalType, elementalType) ||
                other.elementalType == elementalType) &&
            (identical(other.totalCards, totalCards) ||
                other.totalCards == totalCards) &&
            const DeepCollectionEquality().equals(other._deck, _deck) &&
            const DeepCollectionEquality().equals(other._hand, _hand) &&
            const DeepCollectionEquality()
                .equals(other._discardPile, _discardPile) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.selectedCard, selectedCard) ||
                other.selectedCard == selectedCard) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      elementalType,
      totalCards,
      const DeepCollectionEquality().hash(_deck),
      const DeepCollectionEquality().hash(_hand),
      const DeepCollectionEquality().hash(_discardPile),
      score,
      selectedCard,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayerDataCopyWith<_$_PlayerData> get copyWith =>
      __$$_PlayerDataCopyWithImpl<_$_PlayerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlayerDataToJson(
      this,
    );
  }
}

abstract class _PlayerData implements PlayerData {
  const factory _PlayerData(
      {final String id,
      final ElementalType elementalType,
      final int totalCards,
      final List<ElementCardData> deck,
      final List<ElementCardData> hand,
      final List<ElementCardData> discardPile,
      final int score,
      final String selectedCard,
      final String name}) = _$_PlayerData;

  factory _PlayerData.fromJson(Map<String, dynamic> json) =
      _$_PlayerData.fromJson;

  @override
  String get id;
  @override
  ElementalType get elementalType;
  @override
  int get totalCards;
  @override
  List<ElementCardData> get deck;
  @override
  List<ElementCardData> get hand;
  @override
  List<ElementCardData> get discardPile;
  @override
  int get score;
  @override
  String get selectedCard;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PlayerDataCopyWith<_$_PlayerData> get copyWith =>
      throw _privateConstructorUsedError;
}
