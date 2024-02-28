import 'package:get_it/get_it.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/domain/repositories/locale_shared_preference.dart';

class SetLocale {
  void call({required LocalParams params}) {
    final LocalSharedPreference repo =
        GetIt.I<LocalSharedPreference>();
    repo.recordLocal(params: params);
  }
}

class GetLocale {
  Future<LocalParams> call() async {
    final LocalSharedPreference repo =
        GetIt.I<LocalSharedPreference>();
    return repo.getLocal();
  }
}
