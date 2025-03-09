import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';

part 'swapi_state.dart';
part 'swapi_cubit.freezed.dart';

class SwapiCubit extends Cubit<SwapiState> {
  SwapiCubit({required SwapiServiceInterface swapiService})
      : _swapiService = swapiService,
        _random = Random(),
        super(const SwapiState.initial());

  final SwapiServiceInterface _swapiService;
  final Random _random;

  Future<void> fetchPerson() async {
    emit(const SwapiState.loading());
    try {
      // intentionally added small delay
      await Future.delayed(const Duration(seconds: 1));
      final result = await _swapiService.getPeople();
      // fetching random person each time
      int max = result.results?.length ?? 0;
      int number = _random.nextInt(max);
      String? name = result.results?[number].name;

      emit(SwapiState.loaded(name));
    } catch (e) {
      emit(const SwapiState.error());
    }
  }
}
