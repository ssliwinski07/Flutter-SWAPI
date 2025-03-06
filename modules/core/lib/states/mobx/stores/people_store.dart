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

  @override
  @observable
  AllPeopleModel? people;

  @override
  @action
  Future<void> getPeople() async {
    people = await _swapiService.getPeople();
  }
}
