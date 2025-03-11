import 'package:bloc/bloc.dart';
import 'package:connector_module/dependencies/factory/app_dependencies_factory.dart';
import 'package:state_module/cubit/cubits/general_states/base_states_general.dart';

class AppInitializationCubit extends Cubit<BaseStates> {
  AppInitializationCubit() : super(const BaseStates.loading());

  Future<void> initializeApp() async {
    try {
      emit(const BaseStates.loading());
      // loading simulation
      await Future.delayed(const Duration(seconds: 4));
      _setupDependencies();
      emit(const BaseStates.initialized());
    } catch (e) {
      emit(BaseStates.error(e.toString()));
    }
  }

  void _setupDependencies() {
    AppDependenciesFactory().setupDependencies();
  }
}
