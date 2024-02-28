import 'package:testing_app/core/constants/params.dart';

abstract class LocalSharedPreference {
  Future<LocalParams> getLocal();
  void recordLocal({required LocalParams params});
}