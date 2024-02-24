import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/data/models/user_model.dart';
import 'package:testing_app/domain/repositories/firestore_repositories.dart';

class GetDataStorage {
  final FirestoreRepositories repositories;

  GetDataStorage({required this.repositories});

  Future<UserModel> call({required UserParams params}) async {
    return await repositories.getData(params: params);
  }
}

class RecordToStorage {
  final FirestoreRepositories repositories;

  RecordToStorage({required this.repositories});

  void call({required UserParams params}) {
    repositories.recordData(params: params);
  }
}
