// ignore: unused_import
import '/models/people/people_model.dart';

abstract interface class SwapiServiceInterface {
  Future<List<PeopleModel>> getPeople();
}
