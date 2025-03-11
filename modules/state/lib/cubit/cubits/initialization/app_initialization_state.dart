part of 'app_initialization_cubit.dart';

@freezed
sealed class AppInitalizationState with _$AppInitalizationState {
  const factory AppInitalizationState.loading() = Loading;
  const factory AppInitalizationState.initialized() = Initialized;
  const factory AppInitalizationState.error(String? error) = Error;
}
