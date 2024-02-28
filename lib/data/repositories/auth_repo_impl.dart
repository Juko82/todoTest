

import 'package:firebase_auth/firebase_auth.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/data/repositories/shared_preference_repo_impl.dart';
import 'package:testing_app/domain/repositories/auth_repositories.dart';


class AuthRepositoriesImpl implements AuthRepositories {
  final LocalStorageImpl localStorage;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthRepositoriesImpl({required this.localStorage});
  @override

  
  Future<String> logIn({required AuthParams params}) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final String id = user.user?.uid ?? '';
      localStorage.recordId(id);
      return id;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(e.message.toString());
      } else {
        throw UnimplementedError(e.toString());
      }
    }
  }

  @override
  void logOut() {
    _firebaseAuth.signOut();
    localStorage.clear();
  }

  @override
  Future<String> registrationNewUser({required AuthParams params}) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final id = user.user?.uid ?? '';
      localStorage.recordId(id);
      return id;
    } catch (e) {
      if (e is FirebaseAuthException) {
        throw Exception(e.message.toString());
      } else {
        throw UnimplementedError(e.toString());
      }
    }
  }
}





// class AuthRepositoriesImpl implements AuthRepositories {
//   final LocalStorage localStorage;
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   AuthRepositoriesImpl({required this.localStorage});
//   @override

  
//   Future<String> logIn(String email, String password) async {
//     try {
//       UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       final String id = user.user?.uid ?? '';
//       localStorage.recordId(id);
//       return id;
//     } catch (e) {
//       if (e is FirebaseAuthException) {
//         throw Exception(e.message.toString());
//       } else {
//         throw UnimplementedError(e.toString());
//       }
//     }
//   }

//   @override
//   void logOut() {
//     _firebaseAuth.signOut();
//     localStorage.clear();
//   }

//   @override
//   Future<String> registrationNewUser(String email, String password) async {
//     try {
//       UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       final id = user.user?.uid ?? '';
//       localStorage.recordId(id);
//       return id;
//     } catch (e) {
//       if (e is FirebaseAuthException) {
//         throw Exception(e.message.toString());
//       } else {
//         throw UnimplementedError(e.toString());
//       }
//     }
//   }
// }
