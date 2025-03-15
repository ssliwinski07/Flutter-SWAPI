import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_module/cubit/factory/cubit_factory.dart';
import 'package:connector_module/exports/base_models.dart';
import 'package:connector_module/exports/ui_services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'services/ui/spinner_service.dart';
import 'services/ui/message_service.dart';
import 'routes/app_routes.dart';
import '/utils/helpers/global_keys.dart';

class Root extends StatelessWidget {
  const Root({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubitFactory = CubitFactory();
    final appInitializationCubit =
        cubitFactory.generalModule.appInitializationCubit;
    final authCubit = cubitFactory.generalModule.authCubit;
    final appRoutes = AppRoutes(authCubit: authCubit);

    return MultiProvider(
      providers: [
        Provider<CubitFactory>(
          create: (context) => cubitFactory,
        ),
        Provider<SpinnerServiceInterface>(
          create: (_) => SpinnerService(),
        ),
        Provider<MessageServiceInterface>(
          create: (_) => MessageService(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => appInitializationCubit,
          ),
          BlocProvider(
            create: (_) => authCubit,
          ),
          BlocProvider(
            create: (_) => cubitFactory.generalModule.swapiCubit,
          ),
          BlocProvider(
            create: (_) =>
                cubitFactory.generalModule.selectionCubit<PeopleModel>(),
          )
        ],
        child: GlobalLoaderOverlay(
          key:
              globalLoaderOverlayKey, // thanks to the key, no need to pass context when showin/hidin spinner
          overlayWidgetBuilder: (_) => const Center(
            child: SpinKitCircle(
              size: 70,
              color: Colors.green,
            ),
          ),
          child: MaterialApp.router(
            scaffoldMessengerKey:
                messagesKey, // thanks to the key, no need to pass context when showing snackBar
            routerConfig: appRoutes.goRouter,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
              useMaterial3: true,
            ),
          ),
        ),
      ),
    );
  }
}
