import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:core_module/module/core_module.module.dart';

import '/helpers/consts.dart';
import 'di.config.dart';

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true,
    includeMicroPackages: true,
    externalPackageModulesBefore: [
      ExternalModule(CoreModulePackageModule),
    ])
Future<void> configureDependencies({String env = prodEnv}) async =>
    await ServiceLocator.I.init(env: env);

class ServiceLocator {
  ServiceLocator._();

  static final ServiceLocator I = ServiceLocator._();

  final GetIt _getIt = GetIt.instance;

  Future<void> init({String env = prodEnv}) async =>
      await _getIt.init(environment: env);

  T get<T extends Object>() => _getIt<T>();
}
