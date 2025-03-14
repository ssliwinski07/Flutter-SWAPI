import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:connector_module/dependencies/factory/app_dependencies_factory.dart';

part 'app_initialization_state.dart';
part 'app_initialization_cubit.freezed.dart';

class AppInitializationCubit extends Cubit<AppInitalizationState> {
  AppInitializationCubit() : super(const AppInitalizationState.loading());

  Future<void> initializeApp() async {
    try {
      emit(const AppInitalizationState.loading());
      // loading simulation
      await Future.delayed(const Duration(seconds: 4));
      _setupDependencies();
      emit(const AppInitalizationState.initialized());
    } catch (e) {
      emit(AppInitalizationState.error(e.toString()));
    }
  }

  void _setupDependencies() {
    AppDependenciesFactory().setupDependencies();
  }
}
