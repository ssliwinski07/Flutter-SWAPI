// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalSettingsStates {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LocalSettingsStates);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocalSettingsStates()';
  }
}

/// @nodoc
class $LocalSettingsStatesCopyWith<$Res> {
  $LocalSettingsStatesCopyWith(
      LocalSettingsStates _, $Res Function(LocalSettingsStates) __);
}

/// @nodoc

class Initial implements LocalSettingsStates {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LocalSettingsStates.initial()';
  }
}

/// @nodoc

class ToggleSelectionSwitch implements LocalSettingsStates {
  const ToggleSelectionSwitch({required this.value});

  final bool value;

  /// Create a copy of LocalSettingsStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ToggleSelectionSwitchCopyWith<ToggleSelectionSwitch> get copyWith =>
      _$ToggleSelectionSwitchCopyWithImpl<ToggleSelectionSwitch>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ToggleSelectionSwitch &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @override
  String toString() {
    return 'LocalSettingsStates.toggleSelectionSwitch(value: $value)';
  }
}

/// @nodoc
abstract mixin class $ToggleSelectionSwitchCopyWith<$Res>
    implements $LocalSettingsStatesCopyWith<$Res> {
  factory $ToggleSelectionSwitchCopyWith(ToggleSelectionSwitch value,
          $Res Function(ToggleSelectionSwitch) _then) =
      _$ToggleSelectionSwitchCopyWithImpl;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class _$ToggleSelectionSwitchCopyWithImpl<$Res>
    implements $ToggleSelectionSwitchCopyWith<$Res> {
  _$ToggleSelectionSwitchCopyWithImpl(this._self, this._then);

  final ToggleSelectionSwitch _self;
  final $Res Function(ToggleSelectionSwitch) _then;

  /// Create a copy of LocalSettingsStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
  }) {
    return _then(ToggleSelectionSwitch(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
