import 'package:equatable/equatable.dart';

class SpeechToTextEvent extends Equatable {
  SpeechToTextEvent();
  List<Object> get props => [];
}

class SpeechToTextInitEvent extends SpeechToTextEvent {}

class SpeechToTextStartListenEvent extends SpeechToTextEvent {
  final String language;
  SpeechToTextStartListenEvent({
    required this.language,
  });
}

class SpeechToTextListenDoneEvent extends SpeechToTextEvent {}

class SpeechToTextStopListenEvent extends SpeechToTextEvent {}

class SpeechToTextInsertTextEvent extends SpeechToTextEvent {
  String newText;
  SpeechToTextInsertTextEvent({
    required this.newText,
  });
}

class SpeechToTextChangedListenTimeEvent extends SpeechToTextEvent {
  int newTime;
  SpeechToTextChangedListenTimeEvent({
    required this.newTime,
  });
}

class SpeechToTextChangedPauseTimeEvent extends SpeechToTextEvent {
  int newTime;
  SpeechToTextChangedPauseTimeEvent({
    required this.newTime,
  });
}

class SpeechToTextChangedLanguageEvent extends SpeechToTextEvent {
  String newLocaleId;
  SpeechToTextChangedLanguageEvent({
    required this.newLocaleId,
  });
}

class SpeechToTextCleanEvent extends SpeechToTextEvent {}
