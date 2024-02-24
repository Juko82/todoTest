import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/core/constants/theme.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
   bool enLocale = false;
   bool darkTheme = true;
  SettingsBloc() : super(SettingsState().copyWith()) {
    
    on<SettingsChangeThemEvent>((event, emit) => _changeThem(event, emit));
    on<SettingsChangeLocaleEvent>((event, emit) => _changeLocale(event, emit));
  }
  int count = 0;
  _changeThem(SettingsChangeThemEvent event, Emitter emit) {
    count++;
    log(count.toString());
    final ThemeData currentThem = event.value  == true ? ThemeApp.ligthThem : ThemeApp.darkTheme;
    darkTheme = !event.value;
    emit(SettingsState().copyWith(themeData: currentThem, darkThem: !event.value, enLocal: enLocale));
    // emit(SettingsChangeThemState(themeData: currentThem, darkThem: !event.value));
  }

  _changeLocale(SettingsChangeLocaleEvent event, Emitter emit) {
    
    if (event.enLocal == false) {
      emit(SettingsState().copyWith(locale: const Locale('en'), enLocal: true, darkThem: darkTheme));
      // emit(SettingsChangeLocaleState(locale: const Locale('en'), enLocal: true));
    } else {
       emit(SettingsState().copyWith(locale: const Locale('uk'), enLocal: false, darkThem: darkTheme));
      // emit(SettingsChangeLocaleState(locale: const Locale('uk'), enLocal: false));
    }
    enLocale = !event.enLocal;
    
  }
}



