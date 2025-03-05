import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connector_module/states/getters/states_getters.dart';

import '/views/counter_view.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = StatesGetters().appState;

    return Provider(
      create: (_) => appState,
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
