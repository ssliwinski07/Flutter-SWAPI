// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_states_general.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseStates<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BaseStates<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BaseStates<$T>()';
  }
}

/// @nodoc
class $BaseStatesCopyWith<T, $Res> {
  $BaseStatesCopyWith(BaseStates<T> _, $Res Function(BaseStates<T>) __);
}

/// @nodoc

class Initial<T> implements BaseStates<T> {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BaseStates<$T>.initial()';
  }
}

/// @nodoc

class Loading<T> implements BaseStates<T> {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BaseStates<$T>.loading()';
  }
}

/// @nodoc

class Loaded<T> implements BaseStates<T> {
  const Loaded(this.data);

  final T? data;

  /// Create a copy of BaseStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<T, Loaded<T>> get copyWith =>
      _$LoadedCopyWithImpl<T, Loaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'BaseStates<$T>.loaded(data: $data)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<T, $Res>
    implements $BaseStatesCopyWith<T, $Res> {
  factory $LoadedCopyWith(Loaded<T> value, $Res Function(Loaded<T>) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class _$LoadedCopyWithImpl<T, $Res> implements $LoadedCopyWith<T, $Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded<T> _self;
  final $Res Function(Loaded<T>) _then;

  /// Create a copy of BaseStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(Loaded<T>(
      freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class Error<T> implements BaseStates<T> {
  const Error(this.error);

  final String? error;

  /// Create a copy of BaseStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<T, Error<T>> get copyWith =>
      _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'BaseStates<$T>.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<T, $Res>
    implements $BaseStatesCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class _$ErrorCopyWithImpl<T, $Res> implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

  /// Create a copy of BaseStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = freezed,
  }) {
    return _then(Error<T>(
      freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class Initialized<T> implements BaseStates<T> {
  const Initialized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initialized<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BaseStates<$T>.initialized()';
  }
}

/// @nodoc

class Selected<T> implements BaseStates<T> {
  const Selected(this.value);

  final T? value;

  /// Create a copy of BaseStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectedCopyWith<T, Selected<T>> get copyWith =>
      _$SelectedCopyWithImpl<T, Selected<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Selected<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @override
  String toString() {
    return 'BaseStates<$T>.selected(value: $value)';
  }
}

/// @nodoc
abstract mixin class $SelectedCopyWith<T, $Res>
    implements $BaseStatesCopyWith<T, $Res> {
  factory $SelectedCopyWith(
          Selected<T> value, $Res Function(Selected<T>) _then) =
      _$SelectedCopyWithImpl;
  @useResult
  $Res call({T? value});
}

/// @nodoc
class _$SelectedCopyWithImpl<T, $Res> implements $SelectedCopyWith<T, $Res> {
  _$SelectedCopyWithImpl(this._self, this._then);

  final Selected<T> _self;
  final $Res Function(Selected<T>) _then;

  /// Create a copy of BaseStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Selected<T>(
      freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

// dart format on
