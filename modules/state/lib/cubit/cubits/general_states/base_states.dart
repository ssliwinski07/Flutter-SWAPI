part of 'base_states_general.dart';

@freezed
sealed class BaseStates<T> with _$BaseStates<T> {
  const factory BaseStates.initial() = Initial<T>;
  const factory BaseStates.loading() = Loading<T>;
  const factory BaseStates.loaded(T? data) = Loaded<T>;
  const factory BaseStates.error(String? error) = Error<T>;
  const factory BaseStates.initialized() = Initialized<T>;
}
