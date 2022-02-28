import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_event.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechBLoc extends Bloc<TextToSpeechEvent, TextToSpeechState> {
  final FlutterTts flutterTts = FlutterTts();

  TextToSpeechBLoc() : super(TextToSpeechState()) {
    on<TextToSpeechInitEvent>(_onTextToSpeechInitEvent);
    on<TextToSpeechChangedPitchEvent>(_onTextToSpeechChangedPitchEvent);
    on<TextToSpeechChangedVolume>(_onTextToSpeechChangedVolume);
    on<TextToSpeechChangedRate>(_onTextToSpeechChangedRate);
    on<TextToSpeechChangedVoice>(_onTextToSpeechChangedVoice);
    on<TextToSpeechPlayEvent>(_onTextToSpeechPlayEvent);
    on<TextToSpeechStopEvent>(_onTextToSpeechStopEvent);
    on<TextToSpeechPauseEvent>(_onTextToSpeechPauseEvent);
    //on<TextToSpeechContinedEvent>(_onTextToSpeechContinedEvent);
  }

  void _onTextToSpeechInitEvent(
      TextToSpeechInitEvent event, Emitter<TextToSpeechState> emit) {
    emit(state.copyWith(
      // voice: '"name": "Karen", "locale": "en-AU"',
      //language: GoogleTranslateConstants.mapLanguageCodeToLanguageName(),
      pitch: 1.0,
      volume: 0.8,
      rate: 0.5,
      status: TextToSpeechStatus.stopped,
    ));
  }

  void _onTextToSpeechChangedPitchEvent(
      TextToSpeechChangedPitchEvent event, Emitter<TextToSpeechState> emit) {
    emit(state.copyWith(pitch: event.newPitch));
  }

  void _onTextToSpeechChangedVolume(
      TextToSpeechChangedVolume event, Emitter<TextToSpeechState> emit) {
    emit(state.copyWith(volume: event.newVolume));
  }

  void _onTextToSpeechChangedRate(
      TextToSpeechChangedRate event, Emitter<TextToSpeechState> emit) {
    emit(state.copyWith(rate: event.newRate));
  }

  void _onTextToSpeechChangedVoice(
      TextToSpeechChangedVoice event, Emitter<TextToSpeechState> emit) {
    emit(state.copyWith(voice: event.newVoice));
  }

  void _onTextToSpeechPlayEvent(
      TextToSpeechPlayEvent event, Emitter<TextToSpeechState> emit) async {
    await flutterTts.setLanguage(event.languageSpeech);
    await flutterTts.setVolume(state.volume);
    await flutterTts.setPitch(state.pitch);
    await flutterTts.setSpeechRate(state.rate);
    print(await flutterTts.getLanguages);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
    if (event.textToSpeech != '') {
      emit(state.copyWith(status: TextToSpeechStatus.playing));
      await flutterTts.speak(event.textToSpeech);
    }
    flutterTts.setCompletionHandler(() {
      add(TextToSpeechStopEvent());
    });
  }

  void _onTextToSpeechStopEvent(
      TextToSpeechStopEvent event, Emitter<TextToSpeechState> emit) async {
    await flutterTts.stop();
    emit(state.copyWith(status: TextToSpeechStatus.stopped));
  }

  void _onTextToSpeechPauseEvent(
      TextToSpeechPauseEvent event, Emitter<TextToSpeechState> emit) async {
    await flutterTts.pause();
    emit(state.copyWith(status: TextToSpeechStatus.paused));
  }

  // void _onTextToSpeechContinedEvent(TextToSpeechContinedEvent event, Emitter<TextToSpeechState> emit) async{
  //   await flutterTts.
  // }
}
