import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/theme_shared_preference_repositories.dart';

class ThemeDataSharedPreferenceImpl implements ThemeDataSharedPreference {
    late SharedPreferences _prefs;
  @override
  Future<ThemeParams> getThem() async {
    _prefs = await SharedPreferences.getInstance();
    final String theme =  _prefs.getString('theme') ?? 'dark';
    log('get them - ${_prefs.getString('theme')}');
    return ThemeParams(theme: theme);
  }

  @override
  void recordThem({required ThemeParams params}) async {
    _prefs = await SharedPreferences.getInstance();
    log('record them - ${params.theme}');
    _prefs.setString('theme', params.theme);
  }

}