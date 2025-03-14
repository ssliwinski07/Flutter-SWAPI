import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_module/cubit/factory/cubit_factory.dart';
import 'package:connector_module/exports/base_models.dart';

import 'routes/app_routes.dart';

class Root extends StatelessWidget {
  const Root({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubitFactory = CubitFactory();
    final appInitializationCubit =
        cubitFactory.generalModule.appInitializationCubit;
    final authCubit = cubitFactory.generalModule.authCubit;
    final appRoutes = AppRoutes(authCubit: authCubit);

    return Provider(
      create: (context) => cubitFactory,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => appInitializationCubit,
          ),
          BlocProvider(
            create: (_) => authCubit,
          ),
          BlocProvider(
            create: (_) => cubitFactory.generalModule.swapiCubit,
          ),
          BlocProvider(
            create: (_) =>
                cubitFactory.generalModule.selectionCubit<PeopleModel>(),
          )
        ],
        child: MaterialApp.router(
          routerConfig: appRoutes.goRouter,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
