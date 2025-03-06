import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

import '/utils/helpers/consts.dart';
import 'package:base_module/models/people/all_people.dart';
import 'package:base_module/interfaces/service_interfaces/swapi_service_interface.dart';

part 'swapi_service.g.dart';

@RestApi()
@Singleton(as: SwapiServiceInterface, env: [prodEnv])
abstract class SwapiService implements SwapiServiceInterface {
  @factoryMethod
  factory SwapiService(@Named('swapi') Dio dio) = _SwapiService;

  @override
  @GET('/people')
  Future<AllPeopleModel> getPeople();
}
