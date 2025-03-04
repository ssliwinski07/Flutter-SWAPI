import 'dart:developer';

import 'package:mobx/mobx.dart';

import '/state_management/mobx/modules/counter_module.dart';
import '/core/di/service_locator.dart';

part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store {
  AppStateBase() : _serviceLocator = ServiceLocator();

  final ServiceLocator _serviceLocator;

  late CounterModule _counterModule;

  CounterModule get counterModule {
    _counterModule = _serviceLocator.get<CounterModule>();
    return _counterModule;
  }
}
