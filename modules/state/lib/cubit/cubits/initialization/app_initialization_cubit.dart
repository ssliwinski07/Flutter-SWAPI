import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_module/interfaces/service_interfaces.dart';

import '../settings/local/local_settings_cubit.dart';

part 'app_initialization_state.dart';
part 'app_initialization_cubit.freezed.dart';

class AppInitializationCubit extends Cubit<AppInitalizationState> {
  AppInitializationCubit({
    required SharedPreferencesServiceInterface sharedPreferencesService,
    required LocalSettingsCubit localSettingsCubit,
  })  : _sharedPreferencesService = sharedPreferencesService,
        _localSettingsCubit = localSettingsCubit,
        super(const AppInitalizationState.initial());

  final SharedPreferencesServiceInterface _sharedPreferencesService;
  final LocalSettingsCubit _localSettingsCubit;

  Future<void> initializeApp() async {
    try {
      emit(const AppInitalizationState.initial());
      // loading simulation
      await Future.delayed(const Duration(seconds: 4));
      await _setup();
      emit(const AppInitalizationState.initialized());
    } catch (e) {
      emit(AppInitalizationState.error(e.toString()));
    }
  }

  Future<void> _setup() async {
    await _sharedPreferencesService.initialize();
    _localSettingsCubit.loadSettings();
  }
}
