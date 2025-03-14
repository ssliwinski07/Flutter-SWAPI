import 'package:go_router/go_router.dart';
import 'package:connector_module/exports/base_models.dart';

import '../views/details_view.dart';
import '../views/initialization_view.dart';

class AppRoutes {
  AppRoutes._();

  static final instance = AppRoutes._();

  factory AppRoutes() => instance;

  GoRouter? _goRouter;

  GoRouter get goRouter => _goRouter ??= GoRouter(
        redirect: (context, state) => null,
        initialLocation: '/',
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (context, state) => const InitializationView(),
          ),
          GoRoute(
              path: '/details',
              builder: (context, state) {
                final items = state.extra as List<PeopleModel>;
                return DetailsView(items: items);
              })
        ],
      );
}
