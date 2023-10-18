// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValidationModel<V> {
  String get key => throw _privateConstructorUsedError;
  V? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidationModelCopyWith<V, ValidationModel<V>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationModelCopyWith<V, $Res> {
  factory $ValidationModelCopyWith(
          ValidationModel<V> value, $Res Function(ValidationModel<V>) then) =
      _$ValidationModelCopyWithImpl<V, $Res, ValidationModel<V>>;
  @useResult
  $Res call({String key, V? value});
}

/// @nodoc
class _$ValidationModelCopyWithImpl<V, $Res, $Val extends ValidationModel<V>>
    implements $ValidationModelCopyWith<V, $Res> {
  _$ValidationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as V?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidationModelCopyWith<V, $Res>
    implements $ValidationModelCopyWith<V, $Res> {
  factory _$$_ValidationModelCopyWith(_$_ValidationModel<V> value,
          $Res Function(_$_ValidationModel<V>) then) =
      __$$_ValidationModelCopyWithImpl<V, $Res>;
  @override
  @useResult
  $Res call({String key, V? value});
}

/// @nodoc
class __$$_ValidationModelCopyWithImpl<V, $Res>
    extends _$ValidationModelCopyWithImpl<V, $Res, _$_ValidationModel<V>>
    implements _$$_ValidationModelCopyWith<V, $Res> {
  __$$_ValidationModelCopyWithImpl(
      _$_ValidationModel<V> _value, $Res Function(_$_ValidationModel<V>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? value = freezed,
  }) {
    return _then(_$_ValidationModel<V>(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as V?,
    ));
  }
}

/// @nodoc

class _$_ValidationModel<V> implements _ValidationModel<V> {
  const _$_ValidationModel({required this.key, this.value});

  @override
  final String key;
  @override
  final V? value;

  @override
  String toString() {
    return 'ValidationModel<$V>(key: $key, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidationModel<V> &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, key, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidationModelCopyWith<V, _$_ValidationModel<V>> get copyWith =>
      __$$_ValidationModelCopyWithImpl<V, _$_ValidationModel<V>>(
          this, _$identity);
}

abstract class _ValidationModel<V> implements ValidationModel<V> {
  const factory _ValidationModel({required final String key, final V? value}) =
      _$_ValidationModel<V>;

  @override
  String get key;
  @override
  V? get value;
  @override
  @JsonKey(ignore: true)
  _$$_ValidationModelCopyWith<V, _$_ValidationModel<V>> get copyWith =>
      throw _privateConstructorUsedError;
}
