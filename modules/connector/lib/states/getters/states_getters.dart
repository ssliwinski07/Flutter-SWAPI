import 'package:core_module/states/mobx/central/app_state.dart';
import 'package:base_module/interfaces/state_interfaces/app_state_interface.dart';

class StatesGetters {
  factory StatesGetters() => _instance;
  static final StatesGetters _instance = StatesGetters._internal();
  StatesGetters._internal();

  AppStateInterface get appState => AppState();
}
