import 'package:equatable/equatable.dart';

enum TextToSpeechStatus { playing, stopped, paused, contined }

class TextToSpeechState extends Equatable {
  // final String textToSpeech;
  final String voice;
  // final List<String> listVoice;
  final String language;
  final double volume;
  final double pitch;
  final double rate;
  final TextToSpeechStatus status;
  TextToSpeechState({
    // this.textToSpeech = '',
    this.voice = '',
    // this.listVoice=[],
    this.language = '',
    this.volume = 0.0,
    this.pitch = 0.0,
    this.rate = 0.0,
    this.status = TextToSpeechStatus.stopped,
  });

  TextToSpeechState copyWith({
    String? inputText,
    String? voice,
    List<String>? listVoice,
    String? language,
    double? volume,
    double? pitch,
    double? rate,
    TextToSpeechStatus? status,
  }) {
    return TextToSpeechState(
      // textToSpeech: inputText ?? this.textToSpeech,
      voice: voice ?? this.voice,
      // listVoice: listVoice ?? this.listVoice,
      language: language ?? this.language,
      volume: volume ?? this.volume,
      pitch: pitch ?? this.pitch,
      rate: rate ?? this.rate,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [
      // textToSpeech,
      voice,
      // listVoice,
      language,
      volume,
      pitch,
      rate,
      status,
    ];
  }
}
