part of 'swapi_cubit.dart';

@freezed
sealed class SwapiStates with _$SwapiStates {
  const factory SwapiStates.initial() = Initial;
  const factory SwapiStates.loading() = Loading;
  const factory SwapiStates.loaded(Object? data) = Loaded;
  const factory SwapiStates.error(String? error) = Error;
}
