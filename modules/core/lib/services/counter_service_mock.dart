import 'package:injectable/injectable.dart';
import 'package:base_module/interfaces/counter_service_interface.dart';

import '/utils/helpers/consts.dart';

@LazySingleton(as: CounterServiceInterface, env: [mockEnv])
class CounterServiceMock implements CounterServiceInterface {
  @override
  int increament() => 4;
}
