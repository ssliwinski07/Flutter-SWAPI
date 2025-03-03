import 'package:flutter/material.dart';
import 'package:flutter_automatic_di/utils/helpers/consts/consts.dart';
import 'package:provider/provider.dart';

import 'core/di/service_locator.dart';
import 'UI/views/counter_view.dart';
import 'state_management/mobx/stores/counter_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // set env parameter with prodEnv or mockEnv to init with prod/mock dependencies
  // by defualt env=prodEnv
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceLocator = ServiceLocator();

    return MultiProvider(
      providers: [
        Provider(create: (_) => serviceLocator.get<CounterStore>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: const CounterView(),
      ),
    );
  }
}
