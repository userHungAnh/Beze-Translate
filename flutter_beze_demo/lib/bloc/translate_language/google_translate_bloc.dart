import 'package:flutter_beze_demo/bloc/translate_language/google_translate_event.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_state.dart';
import 'package:flutter_beze_demo/constants/language.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:translator/translator.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

const debounceDuration = Duration(milliseconds: 300);

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  final GoogleTranslator translator = GoogleTranslator();

  TranslateBloc() : super(const TranslateState()) {
    on<TranslateInitEvent>(_onGoogleTransInitEvent);
    on<TranslateTypingEvent>(_onGoogleTranslateTypingEvent,
        transformer: debounce(debounceDuration));
    on<TranslateChangedFromLanguageEvent>(
        _onGoogleTranslateChangedFromLanguageEvent);
    on<TranslateChangedToLanguageEvent>(
        _onGoogleTranslateChangedToLanguageEvent);
    on<TranslateSwapLanguage>(_onGoogleTranslateSwapLanguage);
    on<TranslateClearTypingEvent>(_onGoogleTranslateClearTypingEvent);
    on<TranslateResultEvent>(_onGoogleTranslateResultEvent);
  }

  void _onGoogleTransInitEvent(
      TranslateInitEvent event, Emitter<TranslateState> emit) {
    emit(state.copyWith(
      fromLanguage: 'Automatic',
      toLanguage: 'English',
      inputText: '',
      resultText: '',
    ));
  }

  void _onGoogleTranslateTypingEvent(
      TranslateTypingEvent event, Emitter<TranslateState> emit) {
    emit(state.copyWith(inputText: event.inputText));
    if (event.inputText != '' && event.inputText.isNotEmpty) {
      translator
          .translate(event.inputText,
              to: GoogleTranslateConstants.mapLanguageCodeToLanguageName(
                  state.toLanguage),
              from: GoogleTranslateConstants.mapLanguageCodeToLanguageName(
                  state.fromLanguage))
          .then((value) => {add(TranslateResultEvent(newResult: value.text))});
    } else {
      add(const TranslateResultEvent(newResult: ''));
    }
  }

  void _onGoogleTranslateClearTypingEvent(
      TranslateClearTypingEvent event, Emitter<TranslateState> emit) {
    emit(state.copyWith(
      inputText: '',
      resultText: '',
    ));
  }

  void _onGoogleTranslateChangedFromLanguageEvent(
      TranslateChangedFromLanguageEvent event, Emitter<TranslateState> emit) {
    emit(state.copyWith(fromLanguage: event.fromLanguage));
  }

  void _onGoogleTranslateChangedToLanguageEvent(
      TranslateChangedToLanguageEvent event, Emitter<TranslateState> emit) {
    emit(state.copyWith(toLanguage: event.toLanguage));
  }

  void _onGoogleTranslateSwapLanguage(
      TranslateSwapLanguage event, Emitter<TranslateState> emit) {
    emit(state.copyWith(
      fromLanguage: event.currentToLanguage,
      toLanguage: event.currentFromLanguage,
    ));
  }

  void _onGoogleTranslateResultEvent(
      TranslateResultEvent event, Emitter<TranslateState> emit) {
    emit(state.copyWith(resultText: event.newResult));
  }
}
