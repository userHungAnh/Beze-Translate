import 'package:equatable/equatable.dart';

class ThemeEvent extends Equatable {
  ThemeEvent();
  List<Object> get props => [];
}

class ThemeInitEvent extends ThemeEvent {}

class ChangeThemeModeEvent extends ThemeEvent {}

class ThemeDark extends ThemeEvent {}

class ThemeLight extends ThemeEvent {}
