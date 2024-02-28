import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/auth_repositories.dart';
import 'package:testing_app/domain/usecases/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositories repositories;
  AuthBloc({required this.repositories}) : super(AuthInitial()) {
    on<AuthUserEvent>((event, emit) => _auth(event, emit));
    on<RegistrationNewClientdEvent>(
        (event, emit) => _registration(event, emit));
    on<RegistrationCleanFieldEvent>((event, emit) => {});
    on<LogOutEvent>((event, emit) => LogOutUseCase(repositories)
        .call(params: AuthParams(email: '', password: '')));
  }

  _auth(AuthUserEvent event, Emitter emit) async {
    emit(AuthLoadingState());
    try {
      final String id = await LogInUseCase(repositories).call(
          params: AuthParams(email: event.email, password: event.password));
      emit(AuthSuccsessState(id: id));
    } catch (e) {
      emit(
        AuthErrorState(
          errorText: e.toString(),
        ),
      );
    }
  }

  _registration(RegistrationNewClientdEvent event, Emitter emit) async {
    emit(AuthLoadingState());
    bool errEmail = false;
    if (event.email == '') {
      errEmail = true;
    }

    bool errPass1 = false;
    if (event.password1 == '') {
      errPass1 = true;
    }
    bool errPass2 = false;
    if (event.password2 == '') {
      errPass2 = true;
    }
    bool diffPass = false;
    if (event.password1 != event.password2) {
      diffPass = true;
    }

    if (errPass2 || errPass1 || diffPass || errEmail) {
      emit(AuthRegisterFailState(diffPass, errEmail, errPass1, errPass2));
      return;
    }
    try {
      final String id = await RegistrationNewClientUseCase(repositories).call(
          params: AuthParams(email: event.email, password: event.password1));
      emit(AuthRegisterSuccessState(id: id));
    } catch (e) {
      emit(
        AuthErrorState(
          errorText: e.toString(),
        ),
      );
    }
  }
}
