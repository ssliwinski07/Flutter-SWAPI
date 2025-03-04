// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../state_management/mobx/central/app_state.dart' as _i378;
import '../../state_management/mobx/modules/counter_module.dart' as _i741;
import '../../state_management/mobx/stores/counter_store.dart' as _i810;
import '../services/counter_service.dart' as _i1016;
import '../services/counter_service_base.dart' as _i502;
import '../services/counter_service_mock.dart' as _i270;

const String _mock = 'mock';
const String _prod = 'prod';

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
    gh.lazySingleton<_i378.AppState>(() => _i378.AppState());
    gh.lazySingleton<_i741.CounterModule>(() => _i741.CounterModule());
    gh.lazySingleton<_i502.CounterServiceBase>(
      () => _i270.CounterServiceMock(),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i810.CounterStore>(
        () => _i810.CounterStore(gh<_i502.CounterServiceBase>()));
    gh.lazySingleton<_i502.CounterServiceBase>(
      () => _i1016.CounterService(),
      registerFor: {_prod},
    );
    return this;
  }
}
