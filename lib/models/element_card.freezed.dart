// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElementCard _$ElementCardFromJson(Map<String, dynamic> json) {
  return _ElementCard.fromJson(json);
}

/// @nodoc
mixin _$ElementCard {
  String get id => throw _privateConstructorUsedError;
  ElementalType get elementalType => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  bool get isFaceUp => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementCardCopyWith<ElementCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementCardCopyWith<$Res> {
  factory $ElementCardCopyWith(
          ElementCard value, $Res Function(ElementCard) then) =
      _$ElementCardCopyWithImpl<$Res, ElementCard>;
  @useResult
  $Res call(
      {String id,
      ElementalType elementalType,
      int value,
      bool isFaceUp,
      bool isSelected});
}

/// @nodoc
class _$ElementCardCopyWithImpl<$Res, $Val extends ElementCard>
    implements $ElementCardCopyWith<$Res> {
  _$ElementCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? elementalType = null,
    Object? value = null,
    Object? isFaceUp = null,
    Object? isSelected = null,
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
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isFaceUp: null == isFaceUp
          ? _value.isFaceUp
          : isFaceUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElementCardCopyWith<$Res>
    implements $ElementCardCopyWith<$Res> {
  factory _$$_ElementCardCopyWith(
          _$_ElementCard value, $Res Function(_$_ElementCard) then) =
      __$$_ElementCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ElementalType elementalType,
      int value,
      bool isFaceUp,
      bool isSelected});
}

/// @nodoc
class __$$_ElementCardCopyWithImpl<$Res>
    extends _$ElementCardCopyWithImpl<$Res, _$_ElementCard>
    implements _$$_ElementCardCopyWith<$Res> {
  __$$_ElementCardCopyWithImpl(
      _$_ElementCard _value, $Res Function(_$_ElementCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? elementalType = null,
    Object? value = null,
    Object? isFaceUp = null,
    Object? isSelected = null,
  }) {
    return _then(_$_ElementCard(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      elementalType: null == elementalType
          ? _value.elementalType
          : elementalType // ignore: cast_nullable_to_non_nullable
              as ElementalType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isFaceUp: null == isFaceUp
          ? _value.isFaceUp
          : isFaceUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementCard implements _ElementCard {
  const _$_ElementCard(
      {required this.id,
      required this.elementalType,
      required this.value,
      this.isFaceUp = false,
      this.isSelected = false});

  factory _$_ElementCard.fromJson(Map<String, dynamic> json) =>
      _$$_ElementCardFromJson(json);

  @override
  final String id;
  @override
  final ElementalType elementalType;
  @override
  final int value;
  @override
  @JsonKey()
  final bool isFaceUp;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'ElementCard(id: $id, elementalType: $elementalType, value: $value, isFaceUp: $isFaceUp, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.elementalType, elementalType) ||
                other.elementalType == elementalType) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isFaceUp, isFaceUp) ||
                other.isFaceUp == isFaceUp) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, elementalType, value, isFaceUp, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementCardCopyWith<_$_ElementCard> get copyWith =>
      __$$_ElementCardCopyWithImpl<_$_ElementCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementCardToJson(
      this,
    );
  }
}

abstract class _ElementCard implements ElementCard {
  const factory _ElementCard(
      {required final String id,
      required final ElementalType elementalType,
      required final int value,
      final bool isFaceUp,
      final bool isSelected}) = _$_ElementCard;

  factory _ElementCard.fromJson(Map<String, dynamic> json) =
      _$_ElementCard.fromJson;

  @override
  String get id;
  @override
  ElementalType get elementalType;
  @override
  int get value;
  @override
  bool get isFaceUp;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_ElementCardCopyWith<_$_ElementCard> get copyWith =>
      throw _privateConstructorUsedError;
}
