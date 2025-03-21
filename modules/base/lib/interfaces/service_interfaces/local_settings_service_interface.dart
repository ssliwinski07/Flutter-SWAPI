abstract interface class LocalSettingsServiceInterface {
  Future<void> saveSwitchSetting({required String name, required bool value});
  bool? getSwitchSetting({required String name});
}
