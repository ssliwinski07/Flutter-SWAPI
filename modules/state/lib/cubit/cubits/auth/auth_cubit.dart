import 'package:base_module/interfaces/service_interfaces.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';

part 'auth_states.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({
    required TokenProviderServiceInterface tokenProviderService,
  })  : _tokenProviderService = tokenProviderService,
        super(const AuthStates.unauthenticated());

  final TokenProviderServiceInterface _tokenProviderService;

  Future<void> login({
    String? user,
    String? password,
  }) async {
    try {
      emit(const AuthStates.initial());
      // Simulate a delay when logging in
      await Future.delayed(const Duration(seconds: 3));
      // simulate passing wrong credentials
      if (user != 'admin' || password != 'admin123') {
        emit(const AuthStates.error('Invalid credentials'));
      } else {
        // saving auth token in shared preferences
        await _tokenProviderService.saveToken(
            name: 'authToken', token: 'testtoken_WOW');
        emit(const AuthStates.authenticated());
      }
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
