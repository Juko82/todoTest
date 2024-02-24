part of 'settings_bloc.dart';

class SettingsState {
  final ThemeData? themeData;
  final bool darkThem;
  final Locale? locale;
  final bool enLocal;
  ThemeData them = ThemeApp.darkTheme;
  SettingsState({
    this.themeData,
    this.darkThem = true,
    this.locale,
    this.enLocal = false,
  });

  SettingsState copyWith(
      {ThemeData? themeData,
      bool darkThem = true,
      Locale? locale,
      bool enLocal = false}) {
    return SettingsState(
        darkThem: darkThem,
        themeData: themeData ?? ThemeApp.darkTheme,
        locale: locale ?? const Locale('uk'),
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