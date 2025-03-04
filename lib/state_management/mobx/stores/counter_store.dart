import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import '/core/services/counter_service_base.dart';

part 'counter_store.g.dart';

@LazySingleton()
class CounterStore = CounterBase with _$CounterStore;

abstract class CounterBase with Store {
  CounterBase(this._counterService);

  final CounterServiceBase _counterService;

  @observable
  int value = 0;

  @action
  void increament() {
    value += _counterService.increament();
  }
}
