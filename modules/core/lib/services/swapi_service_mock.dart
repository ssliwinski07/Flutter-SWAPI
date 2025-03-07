import 'package:injectable/injectable.dart';

import '/utils/helpers/consts.dart';
import 'package:base_module/models/people/all_people.dart';
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';
import 'package:base_module/models/people/people_model.dart';

@Singleton(as: SwapiServiceInterface, env: [mockEnv])
class SwapiServiceMock implements SwapiServiceInterface {
  @override
  Future<AllPeopleModel> getPeople() async {
    AllPeopleModel allPeopleModel = const AllPeopleModel(
      count: 1,
      next: null,
      previous: null,
      results: [
        PeopleModel(
            name: 'Mock Person',
            height: '165',
            mass: '74',
            hairColor: 'brown',
            skinColor: 'fair',
            eyeColor: 'green',
            birthYear: '1994',
            gender: 'male',
            homeWorld: '1',
            films: ['1', '2', '3', '4', '5', '6', '7'],
            species: ['1'],
            vehicles: ['4', '5', '6'],
            starships: [
              '10',
              '11',
              '12',
              '13',
              '14',
              '15',
              '16',
              '17',
              '18',
              '19',
              '20',
              '21',
              '22',
              '23',
              '24',
              '25',
              '26',
              '27'
            ],
            created: '2014-12-09T13:50:50.645000Z',
            edited: '2014-12-20T21:17:56.595000Z',
            url: 'https://swapi.dev/api/people/1/'),
      ],
    );
    await Future.delayed(const Duration(seconds: 3));
    return allPeopleModel;
  }
}
