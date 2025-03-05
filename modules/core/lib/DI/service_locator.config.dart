// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:base_module/interfaces/counter_service_interface.dart' as _i87;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../services/counter_service.dart' as _i1016;
import '../services/counter_service_mock.dart' as _i270;
import '../states/mobx/central/app_state.dart' as _i579;
import '../states/mobx/modules/counter_module.dart' as _i78;
import '../states/mobx/stores/counter_store.dart' as _i362;

const String _prodEnv = 'prodEnv';
const String _mockEnv = 'mockEnv';

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
    gh.lazySingleton<_i579.AppState>(() => _i579.AppState());
    gh.lazySingleton<_i78.CounterModule>(() => _i78.CounterModule());
    gh.lazySingleton<_i87.CounterServiceInterface>(
      () => _i1016.CounterService(),
      registerFor: {_prodEnv},
    );
    gh.lazySingleton<_i87.CounterServiceInterface>(
      () => _i270.CounterServiceMock(),
      registerFor: {_mockEnv},
    );
    gh.lazySingleton<_i362.CounterStore>(
        () => _i362.CounterStore(gh<_i87.CounterServiceInterface>()));
    return this;
  }
}
