import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/locale_shared_preference.dart';

class LocalSharedPreferenceImpl implements LocalSharedPreference {
      late SharedPreferences _prefs;

  @override
  Future<LocalParams> getLocal() async {
    _prefs = await SharedPreferences.getInstance();
    final String locale =  _prefs.getString('locale') ?? 'ua';
    log('get local - ${_prefs.getString('locale')}');
    return LocalParams(locale: locale);
  }

  @override
  void recordLocal({required LocalParams params}) async{
    _prefs = await SharedPreferences.getInstance();
    log('record locale - ${params.locale}');
    _prefs.setString('locale', params.locale);
  }
 
}