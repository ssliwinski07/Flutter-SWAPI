import 'package:base_module/models/people/all_people.dart';

abstract interface class PeopleStoreInterface {
  AllPeopleModel? get people;

  Future<void> getPeople();
}
