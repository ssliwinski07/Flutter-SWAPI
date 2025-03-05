import 'package:core_module/di/service_locator.dart';

import '../../helpers/consts.dart';

class ServicesGetters {
  factory ServicesGetters() => _instance;
  static final ServicesGetters _instance = ServicesGetters._internal();
  ServicesGetters._internal();

  void setupDependencies({String env = prodEnv}) =>
      configureDependencies(env: env);
}
