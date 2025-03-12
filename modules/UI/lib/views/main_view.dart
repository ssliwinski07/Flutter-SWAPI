import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:state_module/cubit/cubits/swapi/swapi_cubit.dart';
import 'package:state_module/cubit/cubits/generics/selection_cubit.dart';
import 'package:state_module/cubit/cubits/generics/multi_selection_cubit.dart';

import '/toast/custom_toast.dart';
import '/utils/helpers/enums.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late SwapiCubit _swapiCubit;
  late SelectionCubit _selectionCubit;
  late MultiSelectionCubit _multiSelectionCubit;

  @override
  void initState() {
    super.initState();
    _swapiCubit = context.read<SwapiCubit>();
    _selectionCubit = context.read<SelectionCubit<PeopleModel>>();
    _multiSelectionCubit = context.read<MultiSelectionCubit<PeopleModel>>();

    _swapiCubit.fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<SwapiCubit, SwapiStates>(builder: (context, state) {
          return IconButton(
              icon: const Icon(Icons.refresh, size: 30),
              onPressed: state is Loaded
                  ? () async {
                      _swapiCubit.fetchPeople();
                    }
                  : null);
        }),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: BlocBuilder<SwapiCubit, SwapiStates>(
          builder: (context, state) {
            switch (state) {
              case Loading():
                return const CircularProgressIndicator.adaptive();
              case Loaded(:final data as AllPeopleModel?):
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

                return BlocBuilder<MultiSelectionCubit<PeopleModel>,
                    Set<PeopleModel>>(
                  builder: (context, selectedItems) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: data.results?.length,
                      itemBuilder: (context, index) {
                        final person = data.results?[index];
                        final isSelected = selectedItems.contains(person);

                        return ListTile(
                          title: Text(person?.name ?? ''),
                          splashColor: Colors.transparent,
                          selectedColor: Colors.red,
                          selected: isSelected,
                          onTap: () {
                            _multiSelectionCubit.selectItems(item: person!);
                          },
                        );
                      },
                    );
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
                        onPressed: () => _swapiCubit.fetchPeople(),
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
