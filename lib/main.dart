import 'package:connector_module/cubits/factory/cubit_factory.dart';
import 'package:flutter/material.dart';
import 'package:connector_module/dependencies/factory/app_dependencies_factory.dart';
import 'package:ui_module/root.dart';

import 'utils/helpers/consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set env parameter with prodEnv or mockEnv to init with prod/mock dependencies
  // by defualt env=prodEnv
  // if env=prodEnv counter will increase by 1, if env=mockEnv counter will increase by 4
  AppDependenciesFactory().setupDependencies();

  final cubitFactory = CubitFactory();

  runApp(Root(cubitFactory: cubitFactory));
}
