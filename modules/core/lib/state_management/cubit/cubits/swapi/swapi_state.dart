part of 'swapi_cubit.dart';

@freezed
class SwapiState with _$SwapiState {
  const factory SwapiState.initial() = _Initial;
  const factory SwapiState.loading() = _Loading;
  const factory SwapiState.loaded(AllPeopleModel? data) = _Loaded;
  const factory SwapiState.error() = _Error;
}
