abstract interface class SharedPreferencesServiceInterface {
  Future<void> initialize();
  Future<void> setString({required String key, required String value});
  Future<void> setInt({required String key, required int value});
  Future<void> setDouble({required String key, required double value});
  Future<void> setBool({required String key, required bool value});
  Future<void> setStringList(
      {required String key, required List<String> values});
  Future<void> remove({required String key});
  Future<void> clear();
  String? getString({required String key});
  int? getInt({required String key});
  double? getDouble({required String key});
  bool? getBool({required String key});
  List<String>? getStringList({required String key});
}
