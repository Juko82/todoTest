part of 'auth_bloc.dart';


sealed class AuthState {}
final class AuthInitial extends AuthState {}
final class AuthErrorState extends AuthState {
  final String errorText;
  AuthErrorState({required this.errorText});
}
final class AuthSuccsessState extends AuthState {}
final class AuthLoadingState extends AuthState {}





