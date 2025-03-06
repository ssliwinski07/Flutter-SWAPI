import 'package:freezed_annotation/freezed_annotation.dart';

part 'people_model.freezed.dart';
part 'people_model.g.dart';

@freezed
abstract class PeopleModel with _$PeopleModel {
  const factory PeopleModel({
    required String? name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'birth_year') required String? birthYear,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'eye_color') required String? eyeColor,
    required String? gender,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'hair_color') required String? hairColor,
    required String? height,
    required String? mass,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'skin_color') required String? skinColor,
    required String? homeWorld,
    required List<String>? films,
    required List<String>? species,
    required List<String>? starships,
    required List<String>? vehicles,
    required String? url,
    required String? created,
    required String? edited,
  }) = _PeopleModel;

  factory PeopleModel.fromJson(Map<String, Object?> json) =>
      _$PeopleModelFromJson(json);
}
