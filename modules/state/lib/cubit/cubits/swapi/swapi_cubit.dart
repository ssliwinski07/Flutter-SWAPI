import 'package:base_module/models/people/all_people.dart';
import 'package:bloc/bloc.dart';
import 'package:state_module/cubit/cubits/general_states/base_states_general.dart';

import 'package:base_module/interfaces/service_interfaces.dart';

class SwapiCubit extends Cubit<BaseStates<AllPeopleModel>> {
  SwapiCubit({required SwapiServiceInterface swapiService})
      : _swapiService = swapiService,
        super(const BaseStates.initial());

  final SwapiServiceInterface _swapiService;

  Future<void> fetchPerson() async {
    emit(const BaseStates.loading());
    try {
      // intentionally added small delay
      await Future.delayed(const Duration(seconds: 1));
      final result = await _swapiService.getPeople();
      // fetching random person each time
      emit(BaseStates.loaded(result));
    } catch (e) {
      emit(BaseStates.error(e.toString()));
    }
  }
}
