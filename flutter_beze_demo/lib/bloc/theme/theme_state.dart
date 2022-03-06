import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ThemeStatus { themeDark, themeLight }

class ThemeState extends Equatable {
  final backgroundColor;
  final Color textColor;
  final Color widgetColor;
  final String textTheme;
  final ThemeStatus status;
  final ThemeMode themeSytem;
  final bool isTheme;
  ThemeState({
    this.backgroundColor = Colors.black,
    this.widgetColor = Colors.black,
    this.textColor = Colors.black,
    this.textTheme = '',
    this.status = ThemeStatus.themeLight,
    this.isTheme = false,
    this.themeSytem = ThemeMode.dark,
  });

  List<Object> get props =>
      [status, isTheme, themeSytem, textColor, widgetColor, backgroundColor];

  ThemeState copyWith(
      {Color? backgroundColor,
      Color? widgetColor,
      Color? textColor,
      String? textTheme,
      ThemeStatus? status,
      ThemeData? themeMode,
      bool? isTheme,
      ThemeMode? themeSytem}) {
    return ThemeState(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        widgetColor: widgetColor ?? this.widgetColor,
        textColor: textColor ?? this.textColor,
        textTheme: textTheme ?? this.textTheme,
        status: status ?? this.status,
        isTheme: isTheme ?? this.isTheme,
        themeSytem: themeSytem ?? this.themeSytem);
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
  );
}
