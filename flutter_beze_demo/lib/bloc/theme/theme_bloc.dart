import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_event.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ThemeInitEvent>(_onThemeInitEvent);
    on<ChangeThemeModeEvent>(_onChangeThemeModeEvent);
    on<ThemeDark>(_onThemeDark);
    on<ThemeLight>(_onThemeLight);
  }

  void _onThemeInitEvent(ThemeInitEvent event, Emitter<ThemeState> emit) {
    if (SchedulerBinding.instance!.window.platformBrightness ==
        Brightness.light) {
      add(ThemeLight());
    } else {
      add(ThemeDark());
    }
  }

  void _onChangeThemeModeEvent(
      ChangeThemeModeEvent event, Emitter<ThemeState> emit) {
    if (state.status == ThemeStatus.themeLight) {
      add(ThemeLight());
    } else {
      add(ThemeDark());
    }
  }

  void _onThemeDark(ThemeDark event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
        backgroundColor: Color.fromARGB(255, 219, 218, 221),
        textColor: Colors.black,
        widgetColor: Colors.white,
        textTheme: 'Light Theme',
        status: ThemeStatus.themeLight,
        themeSytem: ThemeMode.light,
        isTheme: false));
  }

  void _onThemeLight(ThemeLight event, Emitter<ThemeState> emit) {
    emit(state.copyWith(
        backgroundColor: Color(0xff404661),
        textColor: Colors.white,
        widgetColor: Color.fromARGB(255, 54, 54, 54),
        textTheme: 'Dark Theme',
        status: ThemeStatus.themeDark,
        themeSytem: ThemeMode.dark,
        isTheme: true));
  }
}
