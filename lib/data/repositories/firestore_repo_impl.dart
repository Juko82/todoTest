
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/firestore_repositories.dart';
import 'package:testing_app/data/models/user_model.dart';

class FirestoreRepositoriesImpl implements FirestoreRepositories {
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  @override
  Future<UserModel> getData({required UserParams params}) async {
    try {
      log('request to get data');
      final doc = await _store.collection('todo').doc(params.id).get();
      final data = doc.data();
      if (data == null) {
        throw Exception('newUser');
      }
      
      final user = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      
      return UserModel(id: user.id, todoList: user.todoList);
    } catch (e) {
      if (e is Exception) {
        throw Exception('newUser');
      } else {
        throw UnimplementedError(e.toString());
      }
    }
  }

  @override
  Future<void> recordData({required UserParams params}) async {
    try {
      final doc = _store.collection('todo').doc(params.id);
      await doc.set(UserModel(id: params.id, todoList: params.todoList).toJson());
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
}
