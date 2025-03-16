import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:injectable/injectable.dart';

import '/utils/helpers/consts.dart';

@Singleton(as: TokenProviderServiceInterface, env: [prodEnv, mockEnv])
class TokenProviderService implements TokenProviderServiceInterface {
  TokenProviderService(
      {required SharedPreferencesServiceInterface
          sharedPreferencesServiceInterface})
      : _sharedPreferencesServiceInterface = sharedPreferencesServiceInterface;

  final SharedPreferencesServiceInterface _sharedPreferencesServiceInterface;

  @override
  Future<void> saveToken({required String name, required String token}) async {
    await _sharedPreferencesServiceInterface.setString(key: name, value: token);
  }

  @override
  String? getToken({required String name}) {
    return _sharedPreferencesServiceInterface.getString(key: name);
  }
}
