part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthErrorState extends AuthState {
  final String errorText;
  AuthErrorState({required this.errorText});
}

final class AuthSuccsessState extends AuthState {
  final String id;

  AuthSuccsessState({required this.id});
}

final class AuthLoadingState extends AuthState {}

final class AuthRegisterSuccessState extends AuthState {
    final String id;

  AuthRegisterSuccessState({required this.id});
}

final class AuthRegisterFailState extends AuthState {
  final bool? errorEmail;
  final bool? errorPass1;
  final bool? errrorPass2;
  final bool? differentPass;

  AuthRegisterFailState(this.differentPass, this.errorEmail, this.errorPass1, this.errrorPass2);
}


