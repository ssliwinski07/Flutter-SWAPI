import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:core_module/di/service_locator.dart';

import '../cubits/swapi/swapi_cubit.dart';
import '../cubits/generics/selection_cubit.dart';
import '../cubits/initialization/app_initialization_cubit.dart';
import '../cubits/auth/auth_cubit.dart';
import '../cubits/settings/local/local_settings_cubit.dart';

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
        tokenProviderService:
            _serviceLocator.get<TokenProviderServiceInterface>(),
      );

  LocalSettingsCubit get localSettingsCubit => LocalSettingsCubit(
        localSettingsService:
            _serviceLocator.get<LocalSettingsServiceInterface>(),
      );
  // can't be a getter since it requires a parameter
  AppInitializationCubit appInitializationCubit(
          {required LocalSettingsCubit localSettingsCubit}) =>
      AppInitializationCubit(
        localSettingsCubit: localSettingsCubit,
        sharedPreferencesService:
            _serviceLocator.get<SharedPreferencesServiceInterface>(),
      );

  SelectionCubit<T> selectionCubit<T>() => SelectionCubit<T>();
}
