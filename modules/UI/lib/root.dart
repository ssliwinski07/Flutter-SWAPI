import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connector_module/cubits/factory/cubit_factory.dart';

import '/views/counter_view.dart';

class Root extends StatelessWidget {
  const Root({
    super.key,
    required this.cubitFactory,
  });

  final CubitFactory cubitFactory;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => cubitFactory,
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
