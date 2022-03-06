import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text.state.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';
import 'package:flutter_beze_demo/constants/language.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextBloc extends Bloc<SpeechToTextEvent, SpeechToTextState> {
  stt.SpeechToText _speechToText = stt.SpeechToText();

  SpeechToTextBloc() : super(SpeechToTextState()) {
    on<SpeechToTextInitEvent>(_onSpeechToTextInitEvent);
    on<SpeechToTextChangedLanguageEvent>(_onSpeechToTextChangLanguageEvent);
    on<SpeechToTextStartListenEvent>(_onSpeechToTextStartListenEvent);
    on<SpeechToTextStopListenEvent>(_onSpeechToTextStopListenEvent);
    on<SpeechToTextInsertTextEvent>(_onSpeechToTextInsertTextEvent);
    on<SpeechToTextChangedListenTimeEvent>(
        _onSpeechToTextChangedListenTimeEvent);
    on<SpeechToTextChangedPauseTimeEvent>(_onSpeechToTextChangedPauseTimeEvent);
    on<SpeechToTextCleanEvent>(_onSpeechToTextCleanEvent);
  }

  void _onSpeechToTextInitEvent(
      SpeechToTextInitEvent event, Emitter<SpeechToTextState> emit) {
    emit(state.copyWith(
      listenFor: 40,
      pauseFor: 5,
      speechToText: '',
      hasSpeech: false,
    ));
  }

  void _onSpeechToTextChangLanguageEvent(
      SpeechToTextChangedLanguageEvent event, Emitter<SpeechToTextState> emit) {
    emit(state.copyWith(currentLocaleId: event.newLocaleId));
  }

  void _onSpeechToTextStartListenEvent(SpeechToTextStartListenEvent event,
      Emitter<SpeechToTextState> emit) async {
    emit(state.copyWith(hasSpeech: true));
    bool availabe = await _speechToText.initialize(
      onStatus: (val) {
        print('onStatus: $val');
        if (val == 'done') {
          add(SpeechToTextStopListenEvent());
        }
      },
      onError: (val) => print('onError: $val'),
    );
    if (availabe == true) {
      await _speechToText.listen(
          listenFor: Duration(seconds: state.listenFor),
          pauseFor: Duration(seconds: state.pauseFor),
          partialResults: true,
          localeId: GoogleTranslateConstants.mapLanguageCodeToLanguageName(
              event.language),
          cancelOnError: true,
          onResult: (val) {
            add(SpeechToTextInsertTextEvent(newText: val.recognizedWords));
          });
    } else {
      add(SpeechToTextStopListenEvent());
    }
  }

  void _onSpeechToTextStopListenEvent(
      SpeechToTextStopListenEvent event, Emitter<SpeechToTextState> emit) {
    _speechToText.stop();
    emit(state.copyWith(hasSpeech: false));
  }

  void _onSpeechToTextInsertTextEvent(
      SpeechToTextInsertTextEvent event, Emitter<SpeechToTextState> emit) {
    emit(state.copyWith(speechToText: event.newText));
  }

  void _onSpeechToTextChangedListenTimeEvent(
      SpeechToTextChangedListenTimeEvent event,
      Emitter<SpeechToTextState> emit) {
    emit(state.copyWith(listenFor: event.newTime));
  }

  void _onSpeechToTextChangedPauseTimeEvent(
      SpeechToTextChangedPauseTimeEvent event,
      Emitter<SpeechToTextState> emit) {
    emit(state.copyWith(pauseFor: event.newTime));
  }

  void _onSpeechToTextCleanEvent(
      SpeechToTextCleanEvent event, Emitter<SpeechToTextState> emit) {
    emit(state.copyWith(speechToText: ''));
    add(SpeechToTextStopListenEvent());
  }
}
