import 'package:equatable/equatable.dart';

import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_state.dart';

class TextToSpeechEvent extends Equatable {
  TextToSpeechEvent();
  List<Object> get props => [];
}

class TextToSpeechInitEvent extends TextToSpeechEvent {}

class TextToSpeechReplaceDataEvent extends TextToSpeechEvent {
  final TextToSpeechState textToSpeechState;
  TextToSpeechReplaceDataEvent({required this.textToSpeechState});
}

class TextToSpeechChangedPitchEvent extends TextToSpeechEvent {
  final double newPitch;
  TextToSpeechChangedPitchEvent({required this.newPitch});
}

class TextToSpeechChangedVolume extends TextToSpeechEvent {
  final double newVolume;
  TextToSpeechChangedVolume({required this.newVolume});
}

class TextToSpeechChangedRate extends TextToSpeechEvent {
  final double newRate;
  TextToSpeechChangedRate({
    required this.newRate,
  });
}

class TextToSpeechChangedVoice extends TextToSpeechEvent {
  final String newVoice;
  TextToSpeechChangedVoice({
    required this.newVoice,
  });
}

class TextToSpeechTyingEvent extends TextToSpeechEvent {
  final String textToSpeech;
  TextToSpeechTyingEvent({
    required this.textToSpeech,
  });
}

class TextToSpeechPlayEvent extends TextToSpeechEvent {
  final String textToSpeech;
  final String languageSpeech;
  TextToSpeechPlayEvent({
    required this.textToSpeech,
    required this.languageSpeech,
  });
}

class TextToSpeechChangedLanguageEvent extends TextToSpeechEvent {
  final String newLanguageCode;
  TextToSpeechChangedLanguageEvent({
    required this.newLanguageCode,
  });
}

class TextToSpeechStopEvent extends TextToSpeechEvent {}

class TextToSpeechPauseEvent extends TextToSpeechEvent {}

class TextToSpeechContinedEvent extends TextToSpeechEvent {}
