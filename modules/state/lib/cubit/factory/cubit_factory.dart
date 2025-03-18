import 'package:connector_module/DI/di.dart';

import '/cubit/modules/general_module.dart';

class CubitFactory {
  CubitFactory._() : _serviceLocator = ServiceLocator.I;

  static final CubitFactory _instance = CubitFactory._();

  factory CubitFactory() => _instance;

  final ServiceLocator _serviceLocator;

  GeneralModule get generalModule =>
      GeneralModule(serviceLocator: _serviceLocator);
}
