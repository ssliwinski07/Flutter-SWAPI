import 'package:base_module/interfaces/state_interfaces/counter_module_interface.dart';
import 'package:base_module/interfaces/state_interfaces/swapi_module_interface.dart';

abstract class AppStateInterface {
  CounterModuleInterface get counterModule;
  SwapiModuleInterface get swapiModule;
}
