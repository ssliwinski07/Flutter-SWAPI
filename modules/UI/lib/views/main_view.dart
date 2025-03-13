import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:state_module/cubit/cubits/swapi/swapi_cubit.dart';
import 'package:state_module/cubit/cubits/generics/selection_cubit.dart';

import '../views/details_view.dart';
import '/toast/custom_toast.dart';
import '/utils/helpers/enums.dart';
import '/widgets/customs/custom_error.dart';
import '/widgets/customs/custom_no_data.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late SwapiCubit _swapiCubit;
  late SelectionCubit _selectionCubit;

  @override
  void initState() {
    super.initState();
    _swapiCubit = context.read<SwapiCubit>();
    _selectionCubit = context.read<SelectionCubit<PeopleModel>>();

    _swapiCubit.fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    List<PeopleModel> items = [];

    return BlocListener<SwapiCubit, SwapiStates>(
      listener: (context, state) {
        if (state is Loaded) {
          final data = state.data as AllPeopleModel?;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            showCustomToast(
              context: context,
              message: data == null
                  ? 'Data fetched succesfully, but no items to show'
                  : 'Data fetched',
              infoType: InfoType.success,
            );
          });
        } else if (state is Error) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showCustomToast(
              context: context,
              message: state.error ?? 'Unknown error',
              infoType: InfoType.error,
            );
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: BlocBuilder<SwapiCubit, SwapiStates>(
            builder: (context, state) {
              final data =
                  state is Loaded ? (state.data as AllPeopleModel?) : null;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 30),
                    onPressed: state is Loaded
                        ? () async {
                            _swapiCubit.fetchPeople();
                          }
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: state is Loaded && data != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsView(items: items),
                              ),
                            );
                          }
                        : null,
                  ),
                ],
              );
            },
          ),
        ),
        body: Center(
          child: BlocBuilder<SwapiCubit, SwapiStates>(
            builder: (context, state) {
              switch (state) {
                case Loading():
                  return const CircularProgressIndicator.adaptive();
                case Loaded(:final data as AllPeopleModel?):
                  if (data == null) {
                    return const CustomNoData();
                  }

                  return BlocBuilder<SelectionCubit<PeopleModel>,
                      SelectionStates<PeopleModel>>(
                    builder: (context, state) {
                      if (state is MultiSelection<PeopleModel>) {
                        items = state.items.toList();
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: data.results?.length,
                        itemBuilder: (context, index) {
                          final person = data.results?[index];
                          bool isSelected = false;

                          if (state is MultiSelection<PeopleModel>) {
                            isSelected = state.items.contains(person);
                          }

                          return ListTile(
                            title: Text(person?.name ?? ''),
                            splashColor: Colors.transparent,
                            selectedColor: Colors.red,
                            selected: isSelected,
                            onTap: () {
                              _selectionCubit.toggleMultiSelection(
                                  item: person!);
                            },
                          );
                        },
                      );
                    },
                  );
                case Error():
                  {
                    return CustomError(
                      errorMessage: 'Error while fetching data',
                      onRefresh: () async {
                        await _swapiCubit.fetchPeople();
                      },
                    );
                  }
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
        floatingActionButton: BlocBuilder<SwapiCubit, SwapiStates>(
          builder: (context, state) {
            final data =
                state is Loaded ? (state.data as AllPeopleModel?) : null;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                shadowColor: Colors.black,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: state is Loading || state is Error || data == null
                  ? null
                  : () {
                      _selectionCubit.deselectItem();
                    },
              child: const Text(
                'Deselect all',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
