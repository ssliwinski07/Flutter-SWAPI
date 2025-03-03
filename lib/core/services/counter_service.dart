import 'package:injectable/injectable.dart';

import 'counter_service_base.dart';
import '../../utils/helpers/consts/consts.dart';

@LazySingleton(as: CounterServiceBase, env: [prodEnv])
class CounterService implements CounterServiceBase {
  @override
  int increament() => 1;
}
