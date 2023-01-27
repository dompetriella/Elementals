// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'element_card_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElementCardData _$ElementCardDataFromJson(Map<String, dynamic> json) {
  return _ElementCardData.fromJson(json);
}

/// @nodoc
mixin _$ElementCardData {
  String get id => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  ElementalType get elementalType => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementCardDataCopyWith<ElementCardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementCardDataCopyWith<$Res> {
  factory $ElementCardDataCopyWith(
          ElementCardData value, $Res Function(ElementCardData) then) =
      _$ElementCardDataCopyWithImpl<$Res, ElementCardData>;
  @useResult
  $Res call(
      {String id, String ownerId, ElementalType elementalType, int value});
}

/// @nodoc
class _$ElementCardDataCopyWithImpl<$Res, $Val extends ElementCardData>
    implements $ElementCardDataCopyWith<$Res> {
  _$ElementCardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? elementalType = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      elementalType: null == elementalType
          ? _value.elementalType
          : elementalType // ignore: cast_nullable_to_non_nullable
              as ElementalType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ElementCardDataCopyWith<$Res>
    implements $ElementCardDataCopyWith<$Res> {
  factory _$$_ElementCardDataCopyWith(
          _$_ElementCardData value, $Res Function(_$_ElementCardData) then) =
      __$$_ElementCardDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String ownerId, ElementalType elementalType, int value});
}

/// @nodoc
class __$$_ElementCardDataCopyWithImpl<$Res>
    extends _$ElementCardDataCopyWithImpl<$Res, _$_ElementCardData>
    implements _$$_ElementCardDataCopyWith<$Res> {
  __$$_ElementCardDataCopyWithImpl(
      _$_ElementCardData _value, $Res Function(_$_ElementCardData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? elementalType = null,
    Object? value = null,
  }) {
    return _then(_$_ElementCardData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      elementalType: null == elementalType
          ? _value.elementalType
          : elementalType // ignore: cast_nullable_to_non_nullable
              as ElementalType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ElementCardData implements _ElementCardData {
  const _$_ElementCardData(
      {required this.id,
      required this.ownerId,
      required this.elementalType,
      required this.value});

  factory _$_ElementCardData.fromJson(Map<String, dynamic> json) =>
      _$$_ElementCardDataFromJson(json);

  @override
  final String id;
  @override
  final String ownerId;
  @override
  final ElementalType elementalType;
  @override
  final int value;

  @override
  String toString() {
    return 'ElementCardData(id: $id, ownerId: $ownerId, elementalType: $elementalType, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ElementCardData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.elementalType, elementalType) ||
                other.elementalType == elementalType) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ownerId, elementalType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementCardDataCopyWith<_$_ElementCardData> get copyWith =>
      __$$_ElementCardDataCopyWithImpl<_$_ElementCardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementCardDataToJson(
      this,
    );
  }
}

abstract class _ElementCardData implements ElementCardData {
  const factory _ElementCardData(
      {required final String id,
      required final String ownerId,
      required final ElementalType elementalType,
      required final int value}) = _$_ElementCardData;

  factory _ElementCardData.fromJson(Map<String, dynamic> json) =
      _$_ElementCardData.fromJson;

  @override
  String get id;
  @override
  String get ownerId;
  @override
  ElementalType get elementalType;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_ElementCardDataCopyWith<_$_ElementCardData> get copyWith =>
      throw _privateConstructorUsedError;
}
