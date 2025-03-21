import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/services.dart';
import 'package:state_module/cubit/cubits/auth/auth_cubit.dart';
import 'package:connector_module/exports/enums.dart';

import '../widgets/forms/login_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late MessageServiceInterface _messageService;
  late AnimationController _animationController;
  late Animation<double> _formAnimation;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();
    _messageService = context.read<MessageServiceInterface>();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _logoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInSine),
      ),
    );

    _formAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1, curve: Curves.easeInSine),
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
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
      child: Scaffold(
        body: SingleChildScrollView(
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: _logoAnimation.value,
                      child: Image.asset('assets/sw.png', fit: BoxFit.contain),
                    ),
                    Opacity(
                      opacity: _formAnimation.value,
                      child: const LoginForm(),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
