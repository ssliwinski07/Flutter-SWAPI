import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../modules/counter_module.dart';
import '/DI/service_locator.dart';

part 'app_state.g.dart';

@LazySingleton()
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
