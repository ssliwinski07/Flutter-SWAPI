import 'package:core_module/di/service_locator.dart';

import '/cubit/modules/general_module.dart';

class CubitFactory {
  CubitFactory._() : _serviceLocator = ServiceLocator();

  static final CubitFactory _instance = CubitFactory._();

  factory CubitFactory() => _instance;

  final ServiceLocator _serviceLocator;

  GeneralModule get generalModule =>
      GeneralModule(serviceLocator: _serviceLocator);
}
