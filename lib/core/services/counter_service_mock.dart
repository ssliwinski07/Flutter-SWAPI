import 'package:injectable/injectable.dart';

import 'counter_service_base.dart';
import '../../utils/helpers/consts/consts.dart';

@LazySingleton(as: CounterServiceBase, env: [mockEnv])
class CounterServiceMock implements CounterServiceBase {
  @override
  int increament() => 4;
}
