import 'package:base_module/interfaces/domain_interfaces/get_people_service_interface.dart';
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';

import 'package:injectable/injectable.dart';

@Singleton(as: GetPeopleServiceInterface, env: ['prodEnv'])
class GetPeopleService implements GetPeopleServiceInterface {
  GetPeopleService({required SwapiServiceInterface swapiService})
      : _swapiService = swapiService;

  final SwapiServiceInterface _swapiService;

  @override
  Future<void> getPeople() async {
    final result = await _swapiService.getPeople();
    return Future.value();
  }
}
