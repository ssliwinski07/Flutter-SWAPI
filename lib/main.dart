import 'package:flutter/material.dart';
import 'package:connector_module/states/getters/services_getters.dart';
import 'package:ui_module/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // set env parameter with prodEnv or mockEnv to init with prod/mock dependencies
  // by defualt env=prodEnv
  ServicesGetters().setupDependencies();
  runApp(const Root());
}
