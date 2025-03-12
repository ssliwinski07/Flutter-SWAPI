import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';
import 'package:core_module/di/service_locator.dart';

import '../cubits/swapi/swapi_cubit.dart';
import '../cubits/generics/selection_cubit.dart';
import '../cubits/generics/multi_selection_cubit.dart';
import '../cubits/initialization/app_initialization_cubit.dart';

class GeneralModule {
  GeneralModule._({required ServiceLocator serviceLocator})
      : _serviceLocator = serviceLocator;

  static final GeneralModule _instance =
      GeneralModule._(serviceLocator: ServiceLocator());

  factory GeneralModule({required ServiceLocator serviceLocator}) => _instance;

  final ServiceLocator _serviceLocator;

  SwapiCubit get swapiCubit =>
      SwapiCubit(swapiService: _serviceLocator.get<SwapiServiceInterface>());

  AppInitializationCubit get appInitializationCubit => AppInitializationCubit();

  SelectionCubit<T> selectionCubit<T>() => SelectionCubit<T>();

  MultiSelectionCubit<T> multiSelectionCubit<T>() => MultiSelectionCubit<T>();
}
