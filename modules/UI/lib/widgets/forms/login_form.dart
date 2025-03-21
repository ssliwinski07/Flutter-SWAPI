import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connector_module/exports/services.dart';
import 'package:state_module/cubit/cubits/auth/auth_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late SpinnerServiceInterface _spinnerService;
  late AuthCubit _authCubit;

  late TextEditingController _userController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;
  late FocusNode _userFocus;
  late FocusNode _passwordFocus;

  @override
  void initState() {
    super.initState();

    _authCubit = context.read<AuthCubit>();
    _spinnerService = context.read<SpinnerServiceInterface>();

    _userController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _userFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _userFocus.dispose();
    _passwordFocus.dispose();
    _userController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _UserField(
              userController: _userController,
              userFocus: _userFocus,
            ),
            const SizedBox(height: 20),
            _PasswordField(
              passwordController: _passwordController,
              passwordFocus: _passwordFocus,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 18,
                  ),
                ),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    _spinnerService.show();
                    await _authCubit.login(
                        user: _userController.text,
                        password: _passwordController.text);
                    _spinnerService.hide();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserField extends StatelessWidget {
  const _UserField({
    required this.userController,
    required this.userFocus,
  });

  final TextEditingController userController;
  final FocusNode userFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: userFocus,
      controller: userController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'User is required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'User',
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.passwordController,
    required this.passwordFocus,
  });

  final TextEditingController passwordController;
  final FocusNode passwordFocus;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isPasswordObscured = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: isPasswordObscured,
      builder: (context, value, child) => TextFormField(
        focusNode: passwordFocus,
        controller: passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }
          return null;
        },
        obscureText: isPasswordObscured.value,
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          suffixIcon: IconButton(
              icon: isPasswordObscured.value
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () {
                isPasswordObscured.value = !isPasswordObscured.value;
              }),
        ),
      ),
    );
  }
}
