import 'package:core_module/di/service_locator.dart';

import '../../helpers/consts.dart';

class AppDependenciesFactory {
  AppDependenciesFactory._();

  static AppDependenciesFactory? _instance;

  factory AppDependenciesFactory() => _instance ??= AppDependenciesFactory._();

  void setupDependencies({String env = prodEnv}) =>
      configureDependencies(env: env);
}
