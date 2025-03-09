import 'package:core_module/di/service_locator.dart';

import 'package:core_module/state_management/cubit/modules/general_module.dart';

class CubitFactory {
  CubitFactory._() : _serviceLocator = ServiceLocator();

  static CubitFactory? _instance;

  factory CubitFactory() => _instance ??= CubitFactory._();

  final ServiceLocator _serviceLocator;

  GeneralModule? _generalModule;

  GeneralModule get generalModule =>
      _generalModule ??= GeneralModule(serviceLocator: _serviceLocator);
}
