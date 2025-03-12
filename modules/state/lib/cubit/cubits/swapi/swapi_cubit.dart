import 'package:bloc/bloc.dart';
import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'swapi_states.dart';
part 'swapi_cubit.freezed.dart';

class SwapiCubit extends Cubit<SwapiStates> {
  SwapiCubit({
    required SwapiServiceInterface swapiService,
  })  : _swapiService = swapiService,
        super(const SwapiStates.initial());

  final SwapiServiceInterface _swapiService;

  Future<void> fetchPeople() async {
    emit(const SwapiStates.loading());
    try {
      // intentionally added small delay
      await Future.delayed(const Duration(seconds: 1));
      final result = await _swapiService.getPeople();
      emit(SwapiStates.loaded(result));
    } catch (e) {
      emit(SwapiStates.error(e.toString()));
    }
  }
}
