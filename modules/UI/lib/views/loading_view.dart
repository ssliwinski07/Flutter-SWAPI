import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_module/cubit/cubits/initialization/app_initialization_cubit.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  late AppInitializationCubit _appInitializationCubit;

  @override
  void initState() {
    super.initState();
    _appInitializationCubit = context.read<AppInitializationCubit>();

    _appInitializationCubit.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppInitializationCubit, AppInitalizationState>(
      listener: (context, state) {
        if (state is Initialized) {
          context.go('/login');
        } else if (state is Error) {}
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
