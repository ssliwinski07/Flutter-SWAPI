import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:base_module/interfaces/counter_service_interface.dart';

part 'counter_store.g.dart';

@LazySingleton()
class CounterStore = CounterBase with _$CounterStore;

abstract class CounterBase with Store {
  CounterBase(this._counterService);

  final CounterServiceInterface _counterService;

  @observable
  int value = 0;

  @action
  void increament() {
    value += _counterService.increament();
  }
}
