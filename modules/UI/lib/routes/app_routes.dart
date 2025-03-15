import 'package:go_router/go_router.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:flutter/material.dart';
import 'package:state_module/cubit/cubits/auth/auth_cubit.dart';

import '../views/details_view.dart';
import '../views/loading_view.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';

class AppRoutes {
  AppRoutes._({
    required AuthCubit authCubit,
  }) : _authCubit = authCubit;

  static AppRoutes? instance;

  factory AppRoutes({required AuthCubit authCubit}) {
    instance ??= AppRoutes._(authCubit: authCubit);
    return instance!;
  }

  final AuthCubit _authCubit;

  GoRouter? _goRouter;

  GoRouter get goRouter => _goRouter ??= GoRouter(
        refreshListenable: _GoRouterRefresh(
          //listen to Cubit state changes, so redirect can work properly
          streams: [_authCubit.stream],
        ),
        redirect: (context, state) {
          final authState = _authCubit.state;

          if (state.uri.path == '/login' && authState is Authenticated) {
            return '/home';
          }

          return null;
        },
        initialLocation: '/loading',
        routes: <RouteBase>[
          GoRoute(
            path: '/loading',
            builder: (context, state) => const LoadingView(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginView(),
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LoginView(),
            ),
          ),
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeView(),
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

class _GoRouterRefresh extends ChangeNotifier {
  // streams is a list in case if more cubit streams will be added in the future
  _GoRouterRefresh({required List<Stream> streams}) {
    for (var stream in streams) {
      stream.listen((_) => notifyListeners());
    }
  }
}
