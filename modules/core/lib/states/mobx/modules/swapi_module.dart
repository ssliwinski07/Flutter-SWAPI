import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:base_module/interfaces/state_interfaces/people_store_interface.dart';
import 'package:base_module/interfaces/state_interfaces/swapi_module_interface.dart';

import '/DI/service_locator.dart';
import '/states/mobx/stores/people_store.dart';

part 'swapi_module.g.dart';

class SwapiModule = SwapiModuleBase with _$SwapiModule;

abstract class SwapiModuleBase with Store implements SwapiModuleInterface {
  SwapiModuleBase(ServiceLocator serviceLocator)
      : _serviceLocator = serviceLocator;

  final ServiceLocator _serviceLocator;

  PeopleStore? _peopleStore;

  // singleton pattern + lazy conecept using getter, so store is created only when needed
  @override
  PeopleStoreInterface get peopleStore {
    _peopleStore ??= PeopleStore(_serviceLocator.get<SwapiServiceInterface>());
    return _peopleStore!;
  }
}
