import 'package:equatable/equatable.dart';

class GoogleTranslateState extends Equatable {
  final String inputText;
  final String resultText;

  final String toLanguage;
  final String fromLanguage;
  const GoogleTranslateState({
    this.inputText = '',
    this.resultText = '',
    this.toLanguage = '',
    this.fromLanguage = '',
  });
  @override
  List<Object> get props => [inputText, resultText, toLanguage, fromLanguage];

  GoogleTranslateState copyWith({
    String? inputText,
    String? resultText,
    String? toLanguage,
    String? fromLanguage,
  }) {
    return GoogleTranslateState(
      inputText: inputText ?? this.inputText,
      resultText: resultText ?? this.resultText,
      toLanguage: toLanguage ?? this.toLanguage,
      fromLanguage: fromLanguage ?? this.fromLanguage,
    );
  }
}
