import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'auth_states.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(const AuthStates.unauthenticated());

  Future<void> login() async {
    try {
      emit(const AuthStates.inProgress());
      await Future.delayed(const Duration(seconds: 3));
      emit(const AuthStates.authenticated());
    } catch (e) {
      emit(AuthStates.error(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(const AuthStates.unauthenticated());
    } catch (e) {
      emit(AuthStates.error(e.toString()));
    }
  }
}
