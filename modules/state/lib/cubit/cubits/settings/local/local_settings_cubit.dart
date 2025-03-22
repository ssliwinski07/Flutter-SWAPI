import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'local_settings_states.dart';
part 'local_settings_cubit.freezed.dart';

class LocalSettingsCubit extends Cubit<LocalSettingsStates> {
  LocalSettingsCubit(
      {required LocalSettingsServiceInterface localSettingsService})
      : _localSettingsService = localSettingsService,
        super(const LocalSettingsStates.initial());

  final LocalSettingsServiceInterface _localSettingsService;

  void loadSettings() {
    final selectionSwitchValue =
        _localSettingsService.getSwitchSetting(name: 'selectionKey') ?? false;

    emit(
        LocalSettingsStates.toggleSelectionSwitch(value: selectionSwitchValue));
  }

  Future<void> toggleSelectionSwitch({required bool value}) async {
    await _localSettingsService.saveSwitchSetting(
        name: 'selectionKey', value: value);

    emit(LocalSettingsStates.toggleSelectionSwitch(value: value));
  }
}
