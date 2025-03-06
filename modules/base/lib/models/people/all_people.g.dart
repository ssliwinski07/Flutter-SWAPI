// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllPeopleModel _$AllPeopleModelFromJson(Map<String, dynamic> json) =>
    _AllPeopleModel(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PeopleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllPeopleModelToJson(_AllPeopleModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
