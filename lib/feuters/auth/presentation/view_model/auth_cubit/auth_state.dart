part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSingupLoading extends AuthState {}

final class AuthSingupSucsess extends AuthState {}

final class AuthSingupFailure extends AuthState {
  final String errMessage;
  AuthSingupFailure(this.errMessage);
}

final class AuthSinginLoading extends AuthState {}

final class AuthSinginSucsess extends AuthState {}

final class AuthSinginFailure extends AuthState {
  final String errMessage;
  AuthSinginFailure(this.errMessage);
}

final class AuthsignOutSucsess extends AuthState {}

final class AuthsignOutFailure extends AuthState {
  final String errMessage;
  AuthsignOutFailure(this.errMessage);
}
