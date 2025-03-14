import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_module/cubit/cubits/auth/auth_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = context.read<AuthCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _authCubit.login();
          },
          child: BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              if (state is InProgress || state is Authenticated) {
                return const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircularProgressIndicator(),
                );
              }
              return const Text('Login');
            },
          ),
        ),
      ),
    );
  }
}
