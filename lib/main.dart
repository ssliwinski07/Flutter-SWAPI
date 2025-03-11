import 'package:flutter/material.dart';
import 'package:ui_module/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set env parameter with prodEnv or mockEnv to init with prod/mock dependencies
  // by defualt env=prodEnv
  // if env=prodEnv app will fetch person's name from SWAPI
  // if env=mockEnv app will fetch person's name from mock - 'Mock Person' each time

  runApp(const Root());
}
