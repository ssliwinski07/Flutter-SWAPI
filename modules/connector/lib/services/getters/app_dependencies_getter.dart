import 'package:core_module/di/service_locator.dart';

import '../../helpers/consts.dart';

class AppDependenciesGetter {
  factory AppDependenciesGetter() => _instance;
  static final AppDependenciesGetter _instance =
      AppDependenciesGetter._internal();
  AppDependenciesGetter._internal();

  void setupDependencies({String env = prodEnv}) =>
      configureDependencies(env: env);
}
