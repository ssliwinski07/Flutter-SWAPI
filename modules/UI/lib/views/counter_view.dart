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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter:',
            ),
            Observer(
              builder: (_) => Text(
                '${_counterStore.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: _peopleStore.getPeople(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    '${_peopleStore.people?.results?[0].name}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterStore.increament,
        child: const Icon(Icons.add),
      ),
    );
  }
}
