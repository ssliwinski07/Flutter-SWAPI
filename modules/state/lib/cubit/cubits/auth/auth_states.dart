part of 'auth_cubit.dart';

@freezed
sealed class AuthStates with _$AuthStates {
  const factory AuthStates.initial() = Initial;
  const factory AuthStates.authenticated() = Authenticated;
  const factory AuthStates.unauthenticated() = Unauthenticated;
  const factory AuthStates.error(String error) = Error;
}
