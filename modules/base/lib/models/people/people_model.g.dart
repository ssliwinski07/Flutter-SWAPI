// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) => _PeopleModel(
      name: json['name'] as String?,
      birthYear: json['birth_year'] as String?,
      eyeColor: json['eye_color'] as String?,
      gender: json['gender'] as String?,
      hairColor: json['hair_color'] as String?,
      height: json['height'] as String?,
      mass: json['mass'] as String?,
      skinColor: json['skin_color'] as String?,
      homeWorld: json['homeWorld'] as String?,
      films:
          (json['films'] as List<dynamic>?)?.map((e) => e as String).toList(),
      species:
          (json['species'] as List<dynamic>?)?.map((e) => e as String).toList(),
      starships: (json['starships'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      url: json['url'] as String?,
      created: json['created'] as String?,
      edited: json['edited'] as String?,
    );

Map<String, dynamic> _$PeopleModelToJson(_PeopleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth_year': instance.birthYear,
      'eye_color': instance.eyeColor,
      'gender': instance.gender,
      'hair_color': instance.hairColor,
      'height': instance.height,
      'mass': instance.mass,
      'skin_color': instance.skinColor,
      'homeWorld': instance.homeWorld,
      'films': instance.films,
      'species': instance.species,
      'starships': instance.starships,
      'vehicles': instance.vehicles,
      'url': instance.url,
      'created': instance.created,
      'edited': instance.edited,
    };
