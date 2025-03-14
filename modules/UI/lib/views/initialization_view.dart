import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:connector_module/exports/base_models.dart';
import 'package:state_module/cubit/factory/cubit_factory.dart';
import 'package:state_module/cubit/cubits/initialization/app_initialization_cubit.dart';

import 'home_view.dart';

class InitializationView extends StatefulWidget {
  const InitializationView({super.key});

  @override
  State<InitializationView> createState() => _InitializationViewState();
}

class _InitializationViewState extends State<InitializationView> {
  late CubitFactory _cubitFactory;

  @override
  void initState() {
    super.initState();
    _cubitFactory = Provider.of<CubitFactory>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          _cubitFactory.generalModule.appInitializationCubit..initializeApp(),
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
                child: const HomeView(),
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
    );
  }
}
