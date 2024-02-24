part of 'auth_bloc.dart';

sealed class AuthEvent {}



final class AuthUserEvent extends AuthEvent {
  final String password;
  final String email;

  AuthUserEvent({required this.password, required this.email});
}

final class AuthRegistrationEvent extends AuthEvent {
  final String name;
  final String email;
  final String password1;
  final String password2;

  AuthRegistrationEvent({required this.name, required this.email, required this.password1, required this.password2});
}