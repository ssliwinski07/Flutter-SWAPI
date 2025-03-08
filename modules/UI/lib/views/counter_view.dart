import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/cubits/factory/cubit_factory.dart';
import 'package:core_module/state_management/cubit/cubits/swapi/swapi_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitFactory = Provider.of<CubitFactory>(context);
    final swapiCubit = cubitFactory.generalModule.swapiCubit;
    final random = Random();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocProvider(
        create: (context) => swapiCubit..fetchPeople(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Person:',
              ),
              BlocBuilder<SwapiCubit, SwapiState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const CircularProgressIndicator(),
                    loaded: (data) {
                      int max = data?.results?.length ?? 0;
                      int number = random.nextInt(max);

                      return Text(data?.results?[number].name ?? 'Unknown');
                    },
                    orElse: () => const Text('Unknown'),
                  );
                },
              ),
              IconButton(
                onPressed: () async {
                  await swapiCubit.fetchPeople();
                },
                icon: const Icon(Icons.refresh),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
