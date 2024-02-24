
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_app/domain/repositories/shared_preferences_repositories.dart';

class LocalStorage implements LocalStorageRepositories {
  late SharedPreferences _prefs;
  

  
  @override
  Future<String> getId() async {
    _prefs = await SharedPreferences.getInstance();
    final String id = _prefs.getString('userId') ?? '';
    return id;
  }

  @override
  void recordId(String id) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      _prefs.setString('userId', id);
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }
  
  @override
  void clear() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.remove('userId');
  }
}
