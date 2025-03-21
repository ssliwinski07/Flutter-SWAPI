import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:injectable/injectable.dart';

import '/utils/helpers/consts.dart';

@Singleton(as: LocalSettingsServiceInterface, env: [prodEnv, mockEnv])
class LocalSettingsService implements LocalSettingsServiceInterface {
  LocalSettingsService(
      {required SharedPreferencesServiceInterface
          sharedPreferencesServiceInterface})
      : _sharedPreferencesServiceInterface = sharedPreferencesServiceInterface;

  final SharedPreferencesServiceInterface _sharedPreferencesServiceInterface;

  @override
  Future<void> saveSwitchSetting(
      {required String name, required bool value}) async {
    await _sharedPreferencesServiceInterface.setBool(key: name, value: value);
  }

  @override
  bool? getSwitchSetting({required String name}) {
    return _sharedPreferencesServiceInterface.getBool(key: name);
  }
}
