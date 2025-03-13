import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:state_module/cubit/factory/cubit_factory.dart';
import 'package:state_module/cubit/cubits/initialization/app_initialization_cubit.dart';

import 'views/main_view.dart';

class Root extends StatefulWidget {
  const Root({
    super.key,
  });

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late CubitFactory _cubitFactory;

  @override
  void initState() {
    super.initState();
    _cubitFactory = CubitFactory();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => _cubitFactory,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (_) => _cubitFactory.generalModule.appInitializationCubit
            ..initializeApp(),
          child: BlocBuilder<AppInitializationCubit, AppInitalizationState>(
            builder: (context, state) {
              switch (state) {
                case Loading():
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case Initialized():
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => _cubitFactory.generalModule.swapiCubit,
                      ),
                      BlocProvider(
                        create: (_) => _cubitFactory.generalModule
                            .selectionCubit<PeopleModel>(),
                      )
                    ],
                    child: const MainView(),
                  );
                case Error():
                  return const Scaffold(
                    body: Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
