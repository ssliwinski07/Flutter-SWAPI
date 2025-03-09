import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';

import '../cubits/swapi/swapi_cubit.dart';
import '../cubits/counter/counter_cubit.dart';
import '/di/service_locator.dart';

class GeneralModule {
  GeneralModule._({required ServiceLocator serviceLocator})
      : _serviceLocator = serviceLocator;

  static GeneralModule? _instance;

  factory GeneralModule({required ServiceLocator serviceLocator}) =>
      _instance ??= GeneralModule._(serviceLocator: serviceLocator);

  final ServiceLocator _serviceLocator;

  SwapiCubit get swapiCubit =>
      SwapiCubit(swapiService: _serviceLocator.get<SwapiServiceInterface>());

  CounterCubit get counterCubit => CounterCubit();
}
