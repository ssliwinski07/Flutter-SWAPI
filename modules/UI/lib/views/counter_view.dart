import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:connector_module/states_interfaces.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late PeopleStoreInterface _peopleStore;
  late CounterStoreInterface _counterStore;

  @override
  void initState() {
    super.initState();

    _counterStore = Provider.of<AppStateInterface>(context, listen: false)
        .counterModule
        .counterStore;
    _peopleStore = Provider.of<AppStateInterface>(context, listen: false)
        .swapiModule
        .peopleStore;

    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Observer(
        builder: (_) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter:',
              ),
              Text(
                '${_counterStore.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              if (_peopleStore.people == null)
                const CircularProgressIndicator()
              else
                Text(
                  '${_peopleStore.people?.results?[0].name}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              _peopleStore.people == null
                  ? const SizedBox()
                  : IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () async {
                        await _peopleStore.refreshData();
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterStore.increament,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    await _peopleStore.getPeople();
  }
}
