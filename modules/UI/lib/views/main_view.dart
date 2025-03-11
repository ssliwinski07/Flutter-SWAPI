import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:state_module/cubit/cubits/swapi/swapi_cubit.dart';
import 'package:state_module/cubit/cubits/general_states/base_states_general.dart';
import 'package:state_module/cubit/cubits/generics/selection_cubit.dart';

import '/toast/custom_toast.dart';
import '/utils/helpers/enums.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late SelectionCubit<PeopleModel> _selectionCubit;
  late SwapiCubit _swapiCubit;

  @override
  void initState() {
    super.initState();
    _selectionCubit = context.read<SelectionCubit<PeopleModel>>();
    _swapiCubit = context.read<SwapiCubit>();

    _swapiCubit.fetchPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<SwapiCubit, BaseStates<AllPeopleModel>>(
            builder: (context, state) {
          return IconButton(
              icon: const Icon(Icons.refresh, size: 30),
              onPressed: state is Loaded
                  ? () async {
                      _swapiCubit.fetchPerson();
                    }
                  : null);
        }),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: BlocBuilder<SwapiCubit, BaseStates<AllPeopleModel>>(
          builder: (context, state) {
            switch (state) {
              case Initial():
                return const SizedBox.shrink();
              case Loading():
                return const CircularProgressIndicator.adaptive();
              case Loaded(:final data):
                if (data == null) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No data'),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(Icons.face_retouching_off_sharp)
                    ],
                  );
                }

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showCustomToast(
                      context: context,
                      message: 'Data fetched',
                      infoType: InfoType.success);
                });

                return BlocBuilder<SelectionCubit<PeopleModel>, PeopleModel?>(
                  builder: (context, selectedItem) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: data.results?.length,
                        itemBuilder: (context, index) {
                          final person = data.results?[index];
                          final isSelected = person == selectedItem;
                          return ListTile(
                              title: Text(person?.name ?? ''),
                              selectedColor: Colors.red,
                              splashColor: Colors.transparent,
                              selected: isSelected,
                              onTap: () =>
                                  _selectionCubit.selectItem(value: person!));
                        });
                  },
                );
              case Error(:final error):
                {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showCustomToast(
                        context: context,
                        message: error ?? 'Unknown error',
                        infoType: InfoType.error);
                  });

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error),
                          SizedBox(width: 10),
                          Text('Error while fetching data'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => _swapiCubit.fetchPerson(),
                      )
                    ],
                  );
                }
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
