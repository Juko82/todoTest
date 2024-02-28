import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/core/constants/params.dart';
import 'package:testing_app/core/constants/theme.dart';
import 'package:testing_app/domain/usecases/locale_usecases.dart';
import 'package:testing_app/domain/usecases/theme_usecases.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState().copyWith()) {
    on<SettingsChangeThemEvent>((event, emit) => _changeThem(event, emit));
    on<SettingsChangeLocaleEvent>((event, emit) => _changeLocale(event, emit));
    on<SettingsInit>((event, emit) => init(emit));
  }

  init(Emitter emit) async {
    final bool dark = await _checkDarkThem();
    final bool enLocal = await _checkEnLocal();
    emit(SettingsState().copyWith(darkTheme: dark, enLocal: enLocal));
  }

  _changeThem(SettingsChangeThemEvent event, Emitter emit) async{
    SetTheme().call(
        params: ThemeParams(theme: event.value == true ? 'light' : 'dark'));
    final bool enLocal = await _checkEnLocal();

    emit(SettingsState().copyWith(darkTheme: !event.value, enLocal: enLocal));
  }

  _changeLocale(SettingsChangeLocaleEvent event, Emitter emit) async {
    SetLocale().call(params: LocalParams(locale: event.enLocal ? 'ua' : 'en'));
    final bool dark = await _checkDarkThem();
    final bool enLocale = await _checkEnLocal();
 emit(SettingsState().copyWith(enLocal: enLocale, darkTheme: dark));
  
  }

  Future<bool> _checkDarkThem() async {
    final ThemeParams theme = await GetTheme().call();
    return theme.theme == 'dark';
  }

  Future<bool> _checkEnLocal() async {
    final LocalParams locale = await GetLocale().call();
    return locale.locale == 'en';
  }
}
