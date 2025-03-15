// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_module/interfaces/service_interfaces.dart' as _i540;
import 'package:base_module/interfaces/service_interfaces/counter_service_interface.dart'
    as _i229;
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart'
    as _i1059;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../networking/modules/network_module.dart' as _i793;
import '../services/counter_service.dart' as _i1016;
import '../services/counter_service_mock.dart' as _i270;
import '../services/shared_preferences_service.dart' as _i29;
import '../services/swapi_service.dart' as _i505;
import '../services/swapi_service_mock.dart' as _i796;

const String _mockEnv = 'mockEnv';
const String _prodEnv = 'prodEnv';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i1059.SwapiServiceInterface>(
      () => _i796.SwapiServiceMock(),
      registerFor: {_mockEnv},
    );
    gh.lazySingleton<_i229.CounterServiceInterface>(
      () => _i270.CounterServiceMock(),
      registerFor: {_mockEnv},
    );
    gh.singleton<_i540.SharedPreferencesServiceInterface>(
      () => _i29.SharedPreferencesService(),
      registerFor: {
        _prodEnv,
        _mockEnv,
      },
    );
    gh.lazySingleton<_i229.CounterServiceInterface>(
      () => _i1016.CounterService(),
      registerFor: {_prodEnv},
    );
    gh.factory<_i361.Dio>(
      () => networkModule.dio(gh<_i540.SharedPreferencesServiceInterface>()),
      instanceName: 'swapi',
    );
    gh.singleton<_i1059.SwapiServiceInterface>(
      () => _i505.SwapiService(gh<_i361.Dio>(instanceName: 'swapi')),
      registerFor: {_prodEnv},
    );
    return this;
  }
}

class _$NetworkModule extends _i793.NetworkModule {}
