import 'package:testing_app/core/constants/params.dart';

abstract class ThemeDataSharedPreference {
  Future<ThemeParams> getThem();
  void recordThem({required ThemeParams params});
}