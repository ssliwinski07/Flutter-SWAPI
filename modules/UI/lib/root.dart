import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_module/cubit/factory/cubit_factory.dart';

import 'routes/app_routes.dart';

class Root extends StatelessWidget {
  const Root({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CubitFactory(),
      child: MaterialApp.router(
        routerConfig: AppRoutes().goRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
      ),
    );
  }
}
