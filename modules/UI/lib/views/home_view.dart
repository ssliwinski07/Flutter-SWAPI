import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:connector_module/exports/base_models.dart';
import 'package:connector_module/exports/enums.dart';
import 'package:connector_module/exports/services.dart';
import 'package:state_module/cubit/cubits/swapi/swapi_cubit.dart';
import 'package:state_module/cubit/cubits/generics/selection_cubit.dart';

import '/widgets/customs/custom_error.dart';
import '/widgets/customs/custom_no_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late SwapiCubit _swapiCubit;
  late SelectionCubit _selectionCubit;
  late MessageServiceInterface _messageService;
  late LocalSettingsServiceInterface _localSettingsService;

  @override
  void initState() {
    super.initState();
    _swapiCubit = context.read<SwapiCubit>();
    _selectionCubit = context.read<SelectionCubit<PeopleModel>>();
    _messageService = context.read<MessageServiceInterface>();
    _localSettingsService = context.read<LocalSettingsServiceInterface>();

    _swapiCubit.fetchPeople();
  }

  @override
  Widget build(BuildContext context) {
    List<PeopleModel?> items = [];
    ValueNotifier<bool> isMulti = ValueNotifier(
        _localSettingsService.getSwitchSetting(name: 'selectionKey') ?? false);

    return BlocListener<SwapiCubit, SwapiStates>(
      listener: (context, state) {
        if (state is Loaded) {
          final data = state.data as AllPeopleModel?;

          _messageService.show(
            message: data == null
                ? 'Data fetched successfully, but there are no items to show'
                : 'Data fetched successfully',
            infoType: data == null ? InfoType.warning : InfoType.success,
          );
        } else if (state is Error) {
          _messageService.show(
            message: state.error ?? 'Unknown error',
            infoType: InfoType.error,
          );
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
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: isMulti,
                      builder: (context, value, child) => Row(
                        children: [
                          Switch(
                            value: isMulti.value,
                            activeTrackColor: Colors.green,
                            onChanged: (value) async {
                              if (isMulti.value) {
                                _selectionCubit.deselectItems();
                              } else {
                                _selectionCubit.deselectItem();
                              }
                              isMulti.value = value;

                              await _localSettingsService.saveSwitchSetting(
                                  name: 'selectionKey', value: value);
                            },
                          ),
                          const SizedBox(width: 10),
                          Text(
                            isMulti.value
                                ? 'Multi selection'
                                : 'Single selection',
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 30),
                    onPressed:
                        state is Loaded ? () => _refreshData(state) : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: state is Loaded && data != null
                        ? () {
                            context.push('/details', extra: items);
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
                      } else if (state is SingleSelection<PeopleModel>) {
                        items = state.item == null ? [] : [state.item];
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: data.results?.length,
                        itemBuilder: (context, index) {
                          final person = data.results?[index];
                          bool isSelected = false;

                          if (state is MultiSelection<PeopleModel>) {
                            isSelected = state.items.contains(person);
                          } else if (state is SingleSelection<PeopleModel>) {
                            isSelected = person == state.item;
                          }

                          return ListTile(
                            title: Text(person?.name ?? ''),
                            splashColor: Colors.transparent,
                            selectedColor: Colors.red,
                            selected: isSelected,
                            onTap: () {
                              isMulti.value
                                  ? _selectionCubit.toggleMultiSelection(
                                      item: person!)
                                  : _selectionCubit.toggleSingleSelection(
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
                      _selectionCubit.deselectItems();
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

  Future<void> _refreshData(SwapiStates state) async {
    _swapiCubit.fetchPeople();
    if (state is SingleSelection<PeopleModel>) {
      _selectionCubit.deselectItem();
    } else {
      _selectionCubit.deselectItems();
    }
  }
}
