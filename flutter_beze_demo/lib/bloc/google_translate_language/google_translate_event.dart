import 'package:equatable/equatable.dart';

import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_state.dart';

abstract class GoogleTranslateEvent extends Equatable {
  const GoogleTranslateEvent();
  List<Object> get props => [];
}

class GoogleTranslateInitEvent extends GoogleTranslateEvent {}

class GoogleTranslateTypingEvent extends GoogleTranslateEvent {
  final String inputText;
  const GoogleTranslateTypingEvent({required this.inputText});
}

class GoogleTranslateClearTypingEvent extends GoogleTranslateEvent {}

class GoogleTranslateChangedFromLanguageEvent extends GoogleTranslateEvent {
  final String fromLanguage;
  const GoogleTranslateChangedFromLanguageEvent({
    required this.fromLanguage,
  });
}

class GoogleTranslateChangedToLanguageEvent extends GoogleTranslateEvent {
  final String toLanguage;
  const GoogleTranslateChangedToLanguageEvent({
    required this.toLanguage,
  });
}

class GoogleTranslateSwapLanguage extends GoogleTranslateEvent {
  final String currentFromLanguage;
  final String currentToLanguage;

  const GoogleTranslateSwapLanguage({
    required this.currentFromLanguage,
    required this.currentToLanguage,
  });
}

class GoogleTranslateResultEvent extends GoogleTranslateEvent {
  final String newResult;
  const GoogleTranslateResultEvent({
    required this.newResult,
  });
}

class GoogleTransRePlaceData extends GoogleTranslateEvent {
  final GoogleTranslateState googleTranslateState;
  const GoogleTransRePlaceData({
    required this.googleTranslateState,
  });
}
