part of 'local_settings_cubit.dart';

@freezed
sealed class LocalSettingsStates with _$LocalSettingsStates {
  const factory LocalSettingsStates.initial() = Initial;
  const factory LocalSettingsStates.toggleSelectionSwitch(
      {required bool value}) = ToggleSelectionSwitch;
}
