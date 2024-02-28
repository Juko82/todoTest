part of 'settings_bloc.dart';

class SettingsState {
  final ThemeData? themeData;
  final bool darkTheme;
  final Locale? locale;
  final bool enLocal;
  SettingsState({
    this.themeData,
    this.darkTheme = true,
    this.locale,
    this.enLocal = false,
  });

  SettingsState copyWith({bool darkTheme = true, bool enLocal = false}) {
    return SettingsState(
        darkTheme: darkTheme,
        themeData: darkTheme ? ThemeApp.darkTheme : ThemeApp.ligthThem,
        locale: enLocal ? const Locale('en') : const Locale('uk'),
        enLocal: enLocal);
  }
}

// final class SettingsInitial extends SettingsState {
//   // final bool darkThem;
//   // final bool enLocale;

//   // SettingsInitial({required this.darkThem, required this.enLocale});
// }

// final class SettingsChangeThemState extends SettingsState {
//   final ThemeData themeData;
//   final bool darkThem;

//   SettingsChangeThemState({required this.themeData, required this.darkThem});
// }


// final class SettingsChangeLocaleState extends SettingsState {
//   final Locale locale;
//   final bool enLocal;

//   SettingsChangeLocaleState({ required this.enLocal, required this.locale});
// }