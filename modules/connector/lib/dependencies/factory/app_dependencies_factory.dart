import 'package:core_module/di/service_locator.dart';

import '../../helpers/consts.dart';

class AppDependenciesFactory {
  AppDependenciesFactory._();

  static final AppDependenciesFactory _instance = AppDependenciesFactory._();

  factory AppDependenciesFactory() => _instance;

  ServiceLocator get serviceLocator => ServiceLocator();

  void registerServices({String env = prodEnv}) =>
      configureDependencies(env: env);
}
