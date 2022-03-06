import 'package:equatable/equatable.dart';

import 'package:flutter_beze_demo/bloc/translate_language/google_translate_state.dart';

abstract class TranslateEvent extends Equatable {
  const TranslateEvent();
  List<Object> get props => [];
}

class TranslateInitEvent extends TranslateEvent {}

class TranslateTypingEvent extends TranslateEvent {
  final String inputText;
  const TranslateTypingEvent({required this.inputText});
}

class TranslateClearTypingEvent extends TranslateEvent {}

class TranslateChangedFromLanguageEvent extends TranslateEvent {
  final String fromLanguage;
  const TranslateChangedFromLanguageEvent({
    required this.fromLanguage,
  });
}

class TranslateChangedToLanguageEvent extends TranslateEvent {
  final String toLanguage;
  const TranslateChangedToLanguageEvent({
    required this.toLanguage,
  });
}

class TranslateSwapLanguage extends TranslateEvent {
  final String currentFromLanguage;
  final String currentToLanguage;

  const TranslateSwapLanguage({
    required this.currentFromLanguage,
    required this.currentToLanguage,
  });
}

class TranslateResultEvent extends TranslateEvent {
  final String newResult;
  const TranslateResultEvent({
    required this.newResult,
  });
}

class TransRePlaceData extends TranslateEvent {
  final TranslateState googleTranslateState;
  const TransRePlaceData({
    required this.googleTranslateState,
  });
}
