// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'people_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PeopleModel {
  String? get name; // ignore: invalid_annotation_target
  @JsonKey(name: 'birth_year')
  String? get birthYear; // ignore: invalid_annotation_target
  @JsonKey(name: 'eye_color')
  String? get eyeColor;
  String? get gender; // ignore: invalid_annotation_target
  @JsonKey(name: 'hair_color')
  String? get hairColor;
  String? get height;
  String? get mass; // ignore: invalid_annotation_target
  @JsonKey(name: 'skin_color')
  String? get skinColor;
  String? get homeWorld;
  List<String>? get films;
  List<String>? get species;
  List<String>? get starships;
  List<String>? get vehicles;
  String? get url;
  String? get created;
  String? get edited;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PeopleModelCopyWith<PeopleModel> get copyWith =>
      _$PeopleModelCopyWithImpl<PeopleModel>(this as PeopleModel, _$identity);

  /// Serializes this PeopleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PeopleModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.eyeColor, eyeColor) ||
                other.eyeColor == eyeColor) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.hairColor, hairColor) ||
                other.hairColor == hairColor) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.mass, mass) || other.mass == mass) &&
            (identical(other.skinColor, skinColor) ||
                other.skinColor == skinColor) &&
            (identical(other.homeWorld, homeWorld) ||
                other.homeWorld == homeWorld) &&
            const DeepCollectionEquality().equals(other.films, films) &&
            const DeepCollectionEquality().equals(other.species, species) &&
            const DeepCollectionEquality().equals(other.starships, starships) &&
            const DeepCollectionEquality().equals(other.vehicles, vehicles) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.edited, edited) || other.edited == edited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      birthYear,
      eyeColor,
      gender,
      hairColor,
      height,
      mass,
      skinColor,
      homeWorld,
      const DeepCollectionEquality().hash(films),
      const DeepCollectionEquality().hash(species),
      const DeepCollectionEquality().hash(starships),
      const DeepCollectionEquality().hash(vehicles),
      url,
      created,
      edited);

  @override
  String toString() {
    return 'PeopleModel(name: $name, birthYear: $birthYear, eyeColor: $eyeColor, gender: $gender, hairColor: $hairColor, height: $height, mass: $mass, skinColor: $skinColor, homeWorld: $homeWorld, films: $films, species: $species, starships: $starships, vehicles: $vehicles, url: $url, created: $created, edited: $edited)';
  }
}

/// @nodoc
abstract mixin class $PeopleModelCopyWith<$Res> {
  factory $PeopleModelCopyWith(
          PeopleModel value, $Res Function(PeopleModel) _then) =
      _$PeopleModelCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'birth_year') String? birthYear,
      @JsonKey(name: 'eye_color') String? eyeColor,
      String? gender,
      @JsonKey(name: 'hair_color') String? hairColor,
      String? height,
      String? mass,
      @JsonKey(name: 'skin_color') String? skinColor,
      String? homeWorld,
      List<String>? films,
      List<String>? species,
      List<String>? starships,
      List<String>? vehicles,
      String? url,
      String? created,
      String? edited});
}

/// @nodoc
class _$PeopleModelCopyWithImpl<$Res> implements $PeopleModelCopyWith<$Res> {
  _$PeopleModelCopyWithImpl(this._self, this._then);

  final PeopleModel _self;
  final $Res Function(PeopleModel) _then;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? birthYear = freezed,
    Object? eyeColor = freezed,
    Object? gender = freezed,
    Object? hairColor = freezed,
    Object? height = freezed,
    Object? mass = freezed,
    Object? skinColor = freezed,
    Object? homeWorld = freezed,
    Object? films = freezed,
    Object? species = freezed,
    Object? starships = freezed,
    Object? vehicles = freezed,
    Object? url = freezed,
    Object? created = freezed,
    Object? edited = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthYear: freezed == birthYear
          ? _self.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as String?,
      eyeColor: freezed == eyeColor
          ? _self.eyeColor
          : eyeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      hairColor: freezed == hairColor
          ? _self.hairColor
          : hairColor // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      mass: freezed == mass
          ? _self.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as String?,
      skinColor: freezed == skinColor
          ? _self.skinColor
          : skinColor // ignore: cast_nullable_to_non_nullable
              as String?,
      homeWorld: freezed == homeWorld
          ? _self.homeWorld
          : homeWorld // ignore: cast_nullable_to_non_nullable
              as String?,
      films: freezed == films
          ? _self.films
          : films // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      species: freezed == species
          ? _self.species
          : species // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      starships: freezed == starships
          ? _self.starships
          : starships // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vehicles: freezed == vehicles
          ? _self.vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      edited: freezed == edited
          ? _self.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PeopleModel implements PeopleModel {
  const _PeopleModel(
      {required this.name,
      @JsonKey(name: 'birth_year') required this.birthYear,
      @JsonKey(name: 'eye_color') required this.eyeColor,
      required this.gender,
      @JsonKey(name: 'hair_color') required this.hairColor,
      required this.height,
      required this.mass,
      @JsonKey(name: 'skin_color') required this.skinColor,
      required this.homeWorld,
      required final List<String>? films,
      required final List<String>? species,
      required final List<String>? starships,
      required final List<String>? vehicles,
      required this.url,
      required this.created,
      required this.edited})
      : _films = films,
        _species = species,
        _starships = starships,
        _vehicles = vehicles;
  factory _PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);

  @override
  final String? name;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'birth_year')
  final String? birthYear;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'eye_color')
  final String? eyeColor;
  @override
  final String? gender;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'hair_color')
  final String? hairColor;
  @override
  final String? height;
  @override
  final String? mass;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'skin_color')
  final String? skinColor;
  @override
  final String? homeWorld;
  final List<String>? _films;
  @override
  List<String>? get films {
    final value = _films;
    if (value == null) return null;
    if (_films is EqualUnmodifiableListView) return _films;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _species;
  @override
  List<String>? get species {
    final value = _species;
    if (value == null) return null;
    if (_species is EqualUnmodifiableListView) return _species;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _starships;
  @override
  List<String>? get starships {
    final value = _starships;
    if (value == null) return null;
    if (_starships is EqualUnmodifiableListView) return _starships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _vehicles;
  @override
  List<String>? get vehicles {
    final value = _vehicles;
    if (value == null) return null;
    if (_vehicles is EqualUnmodifiableListView) return _vehicles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? url;
  @override
  final String? created;
  @override
  final String? edited;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PeopleModelCopyWith<_PeopleModel> get copyWith =>
      __$PeopleModelCopyWithImpl<_PeopleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PeopleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PeopleModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.eyeColor, eyeColor) ||
                other.eyeColor == eyeColor) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.hairColor, hairColor) ||
                other.hairColor == hairColor) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.mass, mass) || other.mass == mass) &&
            (identical(other.skinColor, skinColor) ||
                other.skinColor == skinColor) &&
            (identical(other.homeWorld, homeWorld) ||
                other.homeWorld == homeWorld) &&
            const DeepCollectionEquality().equals(other._films, _films) &&
            const DeepCollectionEquality().equals(other._species, _species) &&
            const DeepCollectionEquality()
                .equals(other._starships, _starships) &&
            const DeepCollectionEquality().equals(other._vehicles, _vehicles) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.edited, edited) || other.edited == edited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      birthYear,
      eyeColor,
      gender,
      hairColor,
      height,
      mass,
      skinColor,
      homeWorld,
      const DeepCollectionEquality().hash(_films),
      const DeepCollectionEquality().hash(_species),
      const DeepCollectionEquality().hash(_starships),
      const DeepCollectionEquality().hash(_vehicles),
      url,
      created,
      edited);

  @override
  String toString() {
    return 'PeopleModel(name: $name, birthYear: $birthYear, eyeColor: $eyeColor, gender: $gender, hairColor: $hairColor, height: $height, mass: $mass, skinColor: $skinColor, homeWorld: $homeWorld, films: $films, species: $species, starships: $starships, vehicles: $vehicles, url: $url, created: $created, edited: $edited)';
  }
}

/// @nodoc
abstract mixin class _$PeopleModelCopyWith<$Res>
    implements $PeopleModelCopyWith<$Res> {
  factory _$PeopleModelCopyWith(
          _PeopleModel value, $Res Function(_PeopleModel) _then) =
      __$PeopleModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      @JsonKey(name: 'birth_year') String? birthYear,
      @JsonKey(name: 'eye_color') String? eyeColor,
      String? gender,
      @JsonKey(name: 'hair_color') String? hairColor,
      String? height,
      String? mass,
      @JsonKey(name: 'skin_color') String? skinColor,
      String? homeWorld,
      List<String>? films,
      List<String>? species,
      List<String>? starships,
      List<String>? vehicles,
      String? url,
      String? created,
      String? edited});
}

/// @nodoc
class __$PeopleModelCopyWithImpl<$Res> implements _$PeopleModelCopyWith<$Res> {
  __$PeopleModelCopyWithImpl(this._self, this._then);

  final _PeopleModel _self;
  final $Res Function(_PeopleModel) _then;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? birthYear = freezed,
    Object? eyeColor = freezed,
    Object? gender = freezed,
    Object? hairColor = freezed,
    Object? height = freezed,
    Object? mass = freezed,
    Object? skinColor = freezed,
    Object? homeWorld = freezed,
    Object? films = freezed,
    Object? species = freezed,
    Object? starships = freezed,
    Object? vehicles = freezed,
    Object? url = freezed,
    Object? created = freezed,
    Object? edited = freezed,
  }) {
    return _then(_PeopleModel(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      birthYear: freezed == birthYear
          ? _self.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as String?,
      eyeColor: freezed == eyeColor
          ? _self.eyeColor
          : eyeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      hairColor: freezed == hairColor
          ? _self.hairColor
          : hairColor // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as String?,
      mass: freezed == mass
          ? _self.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as String?,
      skinColor: freezed == skinColor
          ? _self.skinColor
          : skinColor // ignore: cast_nullable_to_non_nullable
              as String?,
      homeWorld: freezed == homeWorld
          ? _self.homeWorld
          : homeWorld // ignore: cast_nullable_to_non_nullable
              as String?,
      films: freezed == films
          ? _self._films
          : films // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      species: freezed == species
          ? _self._species
          : species // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      starships: freezed == starships
          ? _self._starships
          : starships // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vehicles: freezed == vehicles
          ? _self._vehicles
          : vehicles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      edited: freezed == edited
          ? _self.edited
          : edited // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
