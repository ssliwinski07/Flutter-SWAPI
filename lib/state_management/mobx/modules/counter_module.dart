import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import '/state_management/mobx/stores/counter_store.dart';
import '/core/di/service_locator.dart';

part 'counter_module.g.dart';

@LazySingleton()
class CounterModule = CounterModuleBase with _$CounterModule;

abstract class CounterModuleBase with Store {
  CounterModuleBase() : _serviceLocator = ServiceLocator();

  final ServiceLocator _serviceLocator;

  late CounterStore _counterStore;

  CounterStore get counterStore {
    _counterStore = _serviceLocator.get<CounterStore>();
    return _counterStore;
  }
}
