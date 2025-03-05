import 'package:mobx/mobx.dart';
import 'package:base_module/interfaces/state_interfaces/app_state_interface.dart';
import 'package:base_module/interfaces/state_interfaces/counter_module_interface.dart';

import '/states/mobx/modules/counter_module.dart';

part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store implements AppStateInterface {
  AppStateBase();

  late CounterModule _counterModule;

  @override
  CounterModuleInterface get counterModule {
    _counterModule = CounterModule();
    return _counterModule;
  }
}
