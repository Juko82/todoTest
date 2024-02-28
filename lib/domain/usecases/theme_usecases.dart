import 'package:get_it/get_it.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/theme_shared_preference_repositories.dart';

class SetThem {
  void call({required ThemeParams params}) {
    final ThemeDataSharedPreference repo =
        GetIt.I<ThemeDataSharedPreference>();
    repo.recordThem(params: params);
  }
}

class GetThem {
  Future<ThemeParams> call() async {
    final ThemeDataSharedPreference repo =
        GetIt.I<ThemeDataSharedPreference>();
    return repo.getThem();
  }
}
