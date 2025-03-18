//@GeneratedMicroModule;CoreModulePackageModule;package:core_module/module/core_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:base_module/interfaces/domain_interfaces/get_people_service_interface.dart'
    as _i1024;
import 'package:base_module/interfaces/service_interfaces.dart' as _i540;
import 'package:base_module/interfaces/service_interfaces/counter_service_interface.dart'
    as _i229;
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart'
    as _i1059;
import 'package:core_module/networking/modules/network_module.dart' as _i943;
import 'package:core_module/services/counter_service.dart' as _i969;
import 'package:core_module/services/counter_service_mock.dart' as _i844;
import 'package:core_module/services/get_people_service.dart' as _i607;
import 'package:core_module/services/shared_preferences_service.dart' as _i398;
import 'package:core_module/services/swapi_service.dart' as _i447;
import 'package:core_module/services/swapi_service_mock.dart' as _i698;
import 'package:core_module/services/token_provider_service.dart' as _i633;
import 'package:dio/dio.dart' as _i361;
import 'package:injectable/injectable.dart' as _i526;

const String _mockEnv = 'mockEnv';
const String _prodEnv = 'prodEnv';

class CoreModulePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final networkModule = _$NetworkModule();
    gh.singleton<_i1059.SwapiServiceInterface>(
      () => _i698.SwapiServiceMock(),
      registerFor: {_mockEnv},
    );
    gh.lazySingleton<_i229.CounterServiceInterface>(
      () => _i844.CounterServiceMock(),
      registerFor: {_mockEnv},
    );
    gh.singleton<_i540.SharedPreferencesServiceInterface>(
      () => _i398.SharedPreferencesService(),
      registerFor: {
        _prodEnv,
        _mockEnv,
      },
    );
    gh.lazySingleton<_i229.CounterServiceInterface>(
      () => _i969.CounterService(),
      registerFor: {_prodEnv},
    );
    gh.singleton<_i540.TokenProviderServiceInterface>(
      () => _i633.TokenProviderService(
          sharedPreferencesServiceInterface:
              gh<_i540.SharedPreferencesServiceInterface>()),
      registerFor: {
        _prodEnv,
        _mockEnv,
      },
    );
    gh.factory<_i361.Dio>(
      () => networkModule.dio(gh<_i540.TokenProviderServiceInterface>()),
      instanceName: 'swapi',
    );
    gh.singleton<_i1059.SwapiServiceInterface>(
      () => _i447.SwapiService(gh<_i361.Dio>(instanceName: 'swapi')),
      registerFor: {_prodEnv},
    );
    gh.singleton<_i1024.GetPeopleServiceInterface>(
      () => _i607.GetPeopleService(
          swapiService: gh<_i1059.SwapiServiceInterface>()),
      registerFor: {_prodEnv},
    );
  }
}

class _$NetworkModule extends _i943.NetworkModule {}
