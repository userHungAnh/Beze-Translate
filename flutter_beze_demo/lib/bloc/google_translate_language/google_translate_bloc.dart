import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_event.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_state.dart';

import 'package:flutter_beze_demo/constants/language_data_constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:translator/translator.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

const debounceDuration = Duration(milliseconds: 300);

class GoogleTranslateBloc
    extends Bloc<GoogleTranslateEvent, GoogleTranslateState> {
  final GoogleTranslator translator = GoogleTranslator();

  GoogleTranslateBloc() : super(const GoogleTranslateState()) {
    on<GoogleTranslateInitEvent>(_onGoogleTransInitEvent);
    on<GoogleTranslateTypingEvent>(_onGoogleTranslateTypingEvent,
        transformer: debounce(debounceDuration));
    on<GoogleTranslateChangedFromLanguageEvent>(
        _onGoogleTranslateChangedFromLanguageEvent);
    on<GoogleTranslateChangedToLanguageEvent>(
        _onGoogleTranslateChangedToLanguageEvent);
    on<GoogleTranslateSwapLanguage>(_onGoogleTranslateSwapLanguage);
    on<GoogleTranslateClearTypingEvent>(_onGoogleTranslateClearTypingEvent);
    on<GoogleTranslateResultEvent>(_onGoogleTranslateResultEvent);
  }

  void _onGoogleTransInitEvent(
      GoogleTranslateInitEvent event, Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(
      fromLanguage: 'Automatic',
      toLanguage: 'English',
      inputText: '',
      resultText: '',
    ));
  }

  void _onGoogleTranslateTypingEvent(
      GoogleTranslateTypingEvent event, Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(inputText: event.inputText));
    if (event.inputText != '' && event.inputText.isNotEmpty) {
      translator
          .translate(event.inputText,
              to: GoogleTranslateConstants.mapLanguageCodeToLanguageName(
                  state.toLanguage),
              from: GoogleTranslateConstants.mapLanguageCodeToLanguageName(
                  state.fromLanguage))
          .then((value) =>
              {add(GoogleTranslateResultEvent(newResult: value.text))});
    } else {
      add(const GoogleTranslateResultEvent(newResult: ''));
    }
  }

  void _onGoogleTranslateClearTypingEvent(GoogleTranslateClearTypingEvent event,
      Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(
      inputText: '',
      resultText: '',
    ));
  }

  void _onGoogleTranslateChangedFromLanguageEvent(
      GoogleTranslateChangedFromLanguageEvent event,
      Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(fromLanguage: event.fromLanguage));
  }

  void _onGoogleTranslateChangedToLanguageEvent(
      GoogleTranslateChangedToLanguageEvent event,
      Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(toLanguage: event.toLanguage));
  }

  void _onGoogleTranslateSwapLanguage(
      GoogleTranslateSwapLanguage event, Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(
      fromLanguage: event.currentToLanguage,
      toLanguage: event.currentFromLanguage,
    ));
  }

  void _onGoogleTranslateResultEvent(
      GoogleTranslateResultEvent event, Emitter<GoogleTranslateState> emit) {
    emit(state.copyWith(resultText: event.newResult));
  }
}
