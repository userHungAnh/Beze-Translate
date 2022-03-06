import 'package:equatable/equatable.dart';

enum SpeechToTextStatus { palying, end }

class SpeechToTextState extends Equatable {
  final String speechToText;
  final bool hasSpeech;
  // final bool logEvents;
  final int listenFor;
  final int pauseFor;
  final double level;
  final double minSoundLevel;
  final double maxSoundLevel;

  // final String lastStatus;
  final String currentLocaleId;
  final SpeechToTextStatus status;

//  final List<LocaleName> _localeNames ;
  SpeechToTextState({
    // this.lastStatus,
    this.speechToText = '',
    this.hasSpeech = false,
    // this.logEvents = false,
    this.listenFor = 0,
    this.pauseFor = 0,
    this.level = 0.0,
    this.minSoundLevel = 500,
    this.maxSoundLevel = -500,
    this.currentLocaleId = '',
    this.status = SpeechToTextStatus.end,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        speechToText,
        hasSpeech,
        listenFor,
        pauseFor,
        level,
        minSoundLevel,
        maxSoundLevel,
        currentLocaleId
      ];

  SpeechToTextState copyWith({
    String? speechToText,
    bool? hasSpeech,
    bool? logEvents,
    int? listenFor,
    int? pauseFor,
    double? level,
    double? minSoundLevel,
    double? maxSoundLevel,
    String? currentLocaleId,
    SpeechToTextStatus? status,
  }) {
    return SpeechToTextState(
      speechToText: speechToText ?? this.speechToText,
      hasSpeech: hasSpeech ?? this.hasSpeech,
      // logEvents: logEvents ?? this.logEvents,
      listenFor: listenFor ?? this.listenFor,
      pauseFor: pauseFor ?? this.pauseFor,
      level: level ?? this.level,
      minSoundLevel: minSoundLevel ?? this.minSoundLevel,
      maxSoundLevel: maxSoundLevel ?? this.maxSoundLevel,
      currentLocaleId: currentLocaleId ?? this.currentLocaleId,
      status: status ?? this.status,
    );
  }
}
