import 'package:freezed_annotation/freezed_annotation.dart';
import 'people_model.dart';

part 'all_people.freezed.dart';
part 'all_people.g.dart';

@freezed
abstract class AllPeopleModel with _$AllPeopleModel {
  const factory AllPeopleModel({
    required int? count,
    required String? next,
    required String? previous,
    required List<PeopleModel>? results,
  }) = _AllPeopleModel;

  factory AllPeopleModel.fromJson(Map<String, Object?> json) =>
      _$AllPeopleModelFromJson(json);
}
