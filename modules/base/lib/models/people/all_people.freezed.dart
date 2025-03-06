// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_people.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllPeopleModel {
  int? get count;
  String? get next;
  String? get previous;
  List<PeopleModel>? get results;

  /// Create a copy of AllPeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AllPeopleModelCopyWith<AllPeopleModel> get copyWith =>
      _$AllPeopleModelCopyWithImpl<AllPeopleModel>(
          this as AllPeopleModel, _$identity);

  /// Serializes this AllPeopleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AllPeopleModel &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(results));

  @override
  String toString() {
    return 'AllPeopleModel(count: $count, next: $next, previous: $previous, results: $results)';
  }
}

/// @nodoc
abstract mixin class $AllPeopleModelCopyWith<$Res> {
  factory $AllPeopleModelCopyWith(
          AllPeopleModel value, $Res Function(AllPeopleModel) _then) =
      _$AllPeopleModelCopyWithImpl;
  @useResult
  $Res call(
      {int? count, String? next, String? previous, List<PeopleModel>? results});
}

/// @nodoc
class _$AllPeopleModelCopyWithImpl<$Res>
    implements $AllPeopleModelCopyWith<$Res> {
  _$AllPeopleModelCopyWithImpl(this._self, this._then);

  final AllPeopleModel _self;
  final $Res Function(AllPeopleModel) _then;

  /// Create a copy of AllPeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_self.copyWith(
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _self.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PeopleModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AllPeopleModel implements AllPeopleModel {
  const _AllPeopleModel(
      {required this.count,
      required this.next,
      required this.previous,
      required final List<PeopleModel>? results})
      : _results = results;
  factory _AllPeopleModel.fromJson(Map<String, dynamic> json) =>
      _$AllPeopleModelFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PeopleModel>? _results;
  @override
  List<PeopleModel>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of AllPeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AllPeopleModelCopyWith<_AllPeopleModel> get copyWith =>
      __$AllPeopleModelCopyWithImpl<_AllPeopleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AllPeopleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AllPeopleModel &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  @override
  String toString() {
    return 'AllPeopleModel(count: $count, next: $next, previous: $previous, results: $results)';
  }
}

/// @nodoc
abstract mixin class _$AllPeopleModelCopyWith<$Res>
    implements $AllPeopleModelCopyWith<$Res> {
  factory _$AllPeopleModelCopyWith(
          _AllPeopleModel value, $Res Function(_AllPeopleModel) _then) =
      __$AllPeopleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? count, String? next, String? previous, List<PeopleModel>? results});
}

/// @nodoc
class __$AllPeopleModelCopyWithImpl<$Res>
    implements _$AllPeopleModelCopyWith<$Res> {
  __$AllPeopleModelCopyWithImpl(this._self, this._then);

  final _AllPeopleModel _self;
  final $Res Function(_AllPeopleModel) _then;

  /// Create a copy of AllPeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_AllPeopleModel(
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _self.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PeopleModel>?,
    ));
  }
}

// dart format on
