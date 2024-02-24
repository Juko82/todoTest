import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/data/models/user_model.dart';

abstract class FirestoreRepositories {
  Future<UserModel> getData({required UserParams params});
  Future<void> recordData({required UserParams params});
  
}