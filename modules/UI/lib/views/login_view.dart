import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/ui_services.dart';
import 'package:state_module/cubit/cubits/auth/auth_cubit.dart';
import 'package:connector_module/exports/enums.dart';

import '../widgets/forms/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late MessageServiceInterface _messageService;

  @override
  void initState() {
    super.initState();
    _messageService = context.read<MessageServiceInterface>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is Error) {
          _messageService.show(
            message: state.error,
            infoType: InfoType.error,
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
