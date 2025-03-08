import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:base_module/models/people/all_people.dart';
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';

part 'swapi_state.dart';
part 'swapi_cubit.freezed.dart';

class SwapiCubit extends Cubit<SwapiState> {
  SwapiCubit({required SwapiServiceInterface swapiService})
      : _swapiService = swapiService,
        super(const SwapiState.initial());

  final SwapiServiceInterface _swapiService;

  Future<void> fetchPeople() async {
    emit(const SwapiState.loading());
    try {
      final result = await _swapiService.getPeople();
      emit(SwapiState.loaded(result));
    } catch (e) {
      emit(const SwapiState.error());
    }
  }
}
