part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class SettingsChangeThemEvent extends SettingsEvent {
  final bool value;

  SettingsChangeThemEvent({this.value = false});
}


final class SettingsChangeLocaleEvent extends SettingsEvent {
  final bool enLocal;

  SettingsChangeLocaleEvent({required this.enLocal});
}

final class SettingsInit extends SettingsEvent {}