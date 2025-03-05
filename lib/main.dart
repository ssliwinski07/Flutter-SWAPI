import 'package:flutter/material.dart';
import 'package:connector_module/services/getters/app_dependencies_getter.dart';
import 'package:ui_module/root.dart';

import 'utils/helpers/consts/consts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // set env parameter with prodEnv or mockEnv to init with prod/mock dependencies
  // by defualt env=prodEnv
  // if env=prodEnv counter will increase by 1, if env=mockEnv counter will increase by 4
  AppDependenciesGetter().setupDependencies();
  runApp(const Root());
}
