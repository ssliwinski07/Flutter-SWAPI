import 'package:base_module/interfaces/state_interfaces/swapi_module_interface.dart';
import 'package:core_module/states/mobx/modules/swapi_module.dart';
import 'package:mobx/mobx.dart';
import 'package:base_module/interfaces/state_interfaces/app_state_interface.dart';
import 'package:base_module/interfaces/state_interfaces/counter_module_interface.dart';

import '/states/mobx/modules/counter_module.dart';
import '/DI/service_locator.dart';

part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store implements AppStateInterface {
  AppStateBase() : _serviceLocator = ServiceLocator() {
    _swapiModule = SwapiModule(_serviceLocator);
  }

  final ServiceLocator _serviceLocator;
  late CounterModule _counterModule;
  late SwapiModule _swapiModule;

  @override
  CounterModuleInterface get counterModule {
    _counterModule = CounterModule(_serviceLocator);
    return _counterModule;
  }

  @override
  SwapiModuleInterface get swapiModule => _swapiModule;
}
