import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '/utils/helpers/consts.dart';
import 'service_locator.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies({String env = prodEnv}) =>
    ServiceLocator().init(env: env);

class ServiceLocator {
  ServiceLocator._();

  final GetIt _getIt = GetIt.instance;

  static final ServiceLocator _instance = ServiceLocator._();

  factory ServiceLocator() => _instance;

  void init({String env = prodEnv}) {
    _getIt.init(environment: env);
  }

  T get<T extends Object>() => _getIt<T>();
}
