import 'package:core_module/states/mobx/central/app_state.dart';

class StatesGetters {
  factory StatesGetters() => _instance;
  static final StatesGetters _instance = StatesGetters._internal();
  StatesGetters._internal();

  AppState get appState => AppState();
}
