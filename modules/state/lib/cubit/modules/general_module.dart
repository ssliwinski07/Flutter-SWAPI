import 'package:base_module/interfaces/service_interfaces/shared_prefererences_service_interface.dart';
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';
import 'package:core_module/di/service_locator.dart';

import '../cubits/swapi/swapi_cubit.dart';
import '../cubits/generics/selection_cubit.dart';
import '../cubits/initialization/app_initialization_cubit.dart';
import '../cubits/auth/auth_cubit.dart';

class GeneralModule {
  GeneralModule._({required ServiceLocator serviceLocator})
      : _serviceLocator = serviceLocator;

  static final GeneralModule _instance =
      GeneralModule._(serviceLocator: ServiceLocator());

  factory GeneralModule({required ServiceLocator serviceLocator}) => _instance;

  final ServiceLocator _serviceLocator;

  SwapiCubit get swapiCubit => SwapiCubit(
        swapiService: _serviceLocator.get<SwapiServiceInterface>(),
      );

  AuthCubit get authCubit => AuthCubit(
        sharedPreferencesServiceInterface:
            _serviceLocator.get<SharedPreferencesServiceInterface>(),
      );

  AppInitializationCubit get appInitializationCubit => AppInitializationCubit(
        sharedPreferencesService:
            _serviceLocator.get<SharedPreferencesServiceInterface>(),
      );

  SelectionCubit<T> selectionCubit<T>() => SelectionCubit<T>();
}
