// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SelectionStates<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectionStates<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SelectionStates<$T>()';
  }
}

/// @nodoc
class $SelectionStatesCopyWith<T, $Res> {
  $SelectionStatesCopyWith(
      SelectionStates<T> _, $Res Function(SelectionStates<T>) __);
}

/// @nodoc

class Initial<T> implements SelectionStates<T> {
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
    return 'SelectionStates<$T>.initial()';
  }
}

/// @nodoc

class SingleSelection<T> implements SelectionStates<T> {
  const SingleSelection({required this.item});

  final T? item;

  /// Create a copy of SelectionStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleSelectionCopyWith<T, SingleSelection<T>> get copyWith =>
      _$SingleSelectionCopyWithImpl<T, SingleSelection<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleSelection<T> &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(item));

  @override
  String toString() {
    return 'SelectionStates<$T>.singleSelection(item: $item)';
  }
}

/// @nodoc
abstract mixin class $SingleSelectionCopyWith<T, $Res>
    implements $SelectionStatesCopyWith<T, $Res> {
  factory $SingleSelectionCopyWith(
          SingleSelection<T> value, $Res Function(SingleSelection<T>) _then) =
      _$SingleSelectionCopyWithImpl;
  @useResult
  $Res call({T? item});
}

/// @nodoc
class _$SingleSelectionCopyWithImpl<T, $Res>
    implements $SingleSelectionCopyWith<T, $Res> {
  _$SingleSelectionCopyWithImpl(this._self, this._then);

  final SingleSelection<T> _self;
  final $Res Function(SingleSelection<T>) _then;

  /// Create a copy of SelectionStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = freezed,
  }) {
    return _then(SingleSelection<T>(
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class MultiSelection<T> implements SelectionStates<T> {
  const MultiSelection({required final Set<T> items}) : _items = items;

  final Set<T> _items;
  Set<T> get items {
    if (_items is EqualUnmodifiableSetView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_items);
  }

  /// Create a copy of SelectionStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MultiSelectionCopyWith<T, MultiSelection<T>> get copyWith =>
      _$MultiSelectionCopyWithImpl<T, MultiSelection<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MultiSelection<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'SelectionStates<$T>.multiSelection(items: $items)';
  }
}

/// @nodoc
abstract mixin class $MultiSelectionCopyWith<T, $Res>
    implements $SelectionStatesCopyWith<T, $Res> {
  factory $MultiSelectionCopyWith(
          MultiSelection<T> value, $Res Function(MultiSelection<T>) _then) =
      _$MultiSelectionCopyWithImpl;
  @useResult
  $Res call({Set<T> items});
}

/// @nodoc
class _$MultiSelectionCopyWithImpl<T, $Res>
    implements $MultiSelectionCopyWith<T, $Res> {
  _$MultiSelectionCopyWithImpl(this._self, this._then);

  final MultiSelection<T> _self;
  final $Res Function(MultiSelection<T>) _then;

  /// Create a copy of SelectionStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
  }) {
    return _then(MultiSelection<T>(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as Set<T>,
    ));
  }
}

// dart format on
