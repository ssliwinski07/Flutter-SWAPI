import 'package:base_module/models/people/all_people.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:base_module/interfaces/service_interfaces.dart';

part 'swapi_state.dart';
part 'swapi_cubit.freezed.dart';

class SwapiCubit extends Cubit<SwapiState> {
  SwapiCubit({required SwapiServiceInterface swapiService})
      : _swapiService = swapiService,
        super(const SwapiState.initial());

  final SwapiServiceInterface _swapiService;

  Future<void> fetchPerson() async {
    emit(const SwapiState.loading());
    try {
      // intentionally added small delay
      await Future.delayed(const Duration(seconds: 1));
      final result = await _swapiService.getPeople();
      // fetching random person each time
      emit(SwapiState.loaded(result));
    } catch (e) {
      emit(SwapiState.error(e.toString()));
    }
  }
}
