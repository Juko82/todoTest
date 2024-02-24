
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/auth_repositories.dart';

class LogInUseCase {
  final AuthRepositories repositories;

  LogInUseCase(this.repositories);

  Future<String> call({required AuthParams params}) async {
    return await repositories.logIn(params: params);
  }
}

class LogOutUseCase {
  final AuthRepositories repositories;

  LogOutUseCase( this.repositories);

  Future<String> call({required AuthParams params}) async {
    repositories.logOut();
    return 'Logout success';
  }
}

class RegistrationNewClientUseCase {
  final AuthRepositories repositories;

  RegistrationNewClientUseCase(this.repositories);

  Future<String> call({required AuthParams params}) async {
    return await repositories.registrationNewUser(params: params);
  }
}
