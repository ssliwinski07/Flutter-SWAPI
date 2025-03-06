import 'package:mobx/mobx.dart';
import 'package:base_module/interfaces/service_interfaces/counter_service_interface.dart';
import 'package:base_module/interfaces/state_interfaces/counter_store_interface.dart';

part 'counter_store.g.dart';

class CounterStore = CounterBase with _$CounterStore;

abstract class CounterBase with Store implements CounterStoreInterface {
  CounterBase(CounterServiceInterface counterServiceInterface)
      : _counterService = counterServiceInterface;

  final CounterServiceInterface _counterService;

  @override
  @observable
  int value = 0;

  @override
  @action
  void increament() {
    value += _counterService.increament();
  }
}
