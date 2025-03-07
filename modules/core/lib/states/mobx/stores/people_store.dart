import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';
import 'package:base_module/interfaces/state_interfaces/people_store_interface.dart';
import 'package:base_module/models/people/all_people.dart';

part 'people_store.g.dart';

class PeopleStore = PeopleStoreBase with _$PeopleStore;

abstract class PeopleStoreBase with Store implements PeopleStoreInterface {
  PeopleStoreBase(SwapiServiceInterface swapiService)
      : _swapiService = swapiService;

  final SwapiServiceInterface _swapiService;

  @observable
  ObservableFuture<AllPeopleModel?> _peopleFuture =
      ObservableFuture.value(null);

  @override
  @computed
  AllPeopleModel? get people =>
      _peopleFuture.status == FutureStatus.pending ? null : _peopleFuture.value;

  @override
  @action
  Future<void> getPeople() async {
    _peopleFuture = ObservableFuture(_swapiService.getPeople());
    await _peopleFuture;
  }

  @override
  @action
  Future<void> refreshData() async {
    _peopleFuture = ObservableFuture.value(null);
    await getPeople();
  }
}
