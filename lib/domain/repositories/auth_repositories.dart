

import 'package:testing_app/core/constants/params.dart';

abstract class AuthRepositories {
  Future<String> logIn({required AuthParams params});
  void logOut();
  Future<String> registrationNewUser({required AuthParams params});
}


// abstract class AuthRepositories {
//   Future<String> logIn(String email, String password);
//   void logOut();
//   Future<String> registrationNewUser(String email, String password);
// }
