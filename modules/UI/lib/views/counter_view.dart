import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/cubits/factory/cubit_factory.dart';
import 'package:core_module/state_management/cubit/cubits/swapi/swapi_cubit.dart';
import 'package:core_module/state_management/cubit/cubits/counter/counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitFactory = Provider.of<CubitFactory>(context);
    final swapiCubit = cubitFactory.generalModule.swapiCubit;
    final counterCubit = cubitFactory.generalModule.counterCubit;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => swapiCubit
                ..fetchPerson()), // fetching person immediatly, during build
          BlocProvider(create: (_) => counterCubit),
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Person:',
              ),
              BlocBuilder<SwapiCubit, SwapiState>(
                builder: (context, state) {
                  switch (state) {
                    case Initial():
                      {
                        return const SizedBox.shrink();
                      }
                    case Loading():
                      {
                        return const CircularProgressIndicator.adaptive();
                      }
                    case Loaded(:final name):
                      {
                        return Text(name ?? '');
                      }
                    case Error():
                      {
                        return const Text('Error');
                      }
                  }
                },
              ),
              IconButton(
                onPressed: () async {
                  await swapiCubit.fetchPerson();
                },
                icon: const Icon(Icons.refresh),
              ),
              const Text('Counter: '),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) => Text('${state.count}'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterCubit.increase();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
