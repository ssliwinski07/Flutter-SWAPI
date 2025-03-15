import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

import '/utils/helpers/consts.dart';

@Singleton(as: SharedPreferencesServiceInterface, env: [prodEnv, mockEnv])
class SharedPreferencesService implements SharedPreferencesServiceInterface {
  SharedPreferences? _prefs;

  @override
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setString({required String key, required String value}) async {
    await _prefs?.setString(key, value);
  }

  @override
  Future<void> setInt({required String key, required int value}) async {
    await _prefs?.setInt(key, value);
  }

  @override
  Future<void> setDouble({required String key, required double value}) async {
    await _prefs?.setDouble(key, value);
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  @override
  Future<void> setStringList(
      {required String key, required List<String> values}) async {
    await _prefs?.setStringList(key, values);
  }

  @override
  Future<void> remove({required String key}) async {
    await _prefs?.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs?.clear();
  }

  @override
  String? getString({required String key}) {
    return _prefs?.getString(key);
  }

  @override
  int? getInt({required String key}) {
    return _prefs?.getInt(key);
  }

  @override
  double? getDouble({required String key}) {
    return _prefs?.getDouble(key);
  }

  @override
  bool? getBool({required String key}) {
    return _prefs?.getBool(key);
  }

  @override
  List<String>? getStringList({required String key}) {
    return _prefs?.getStringList(key);
  }
}
