part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthUserEvent extends AuthEvent {
  final String password;
  final String email;

  AuthUserEvent({required this.password, required this.email});
}

final class RegistrationNewClientdEvent extends AuthEvent {
  final String email;
  final String password1;
  final String password2;

  RegistrationNewClientdEvent(
      {required this.email, required this.password1, required this.password2});
}

final class RegistrationCleanFieldEvent extends AuthEvent {}

final class LogOutEvent extends AuthEvent {}