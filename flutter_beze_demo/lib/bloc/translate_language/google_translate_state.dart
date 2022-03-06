import 'package:equatable/equatable.dart';

class TranslateState extends Equatable {
  final String inputText;
  final String resultText;

  final String toLanguage;
  final String fromLanguage;
  const TranslateState({
    this.inputText = '',
    this.resultText = '',
    this.toLanguage = '',
    this.fromLanguage = '',
  });
  @override
  List<Object> get props => [inputText, resultText, toLanguage, fromLanguage];

  TranslateState copyWith({
    String? inputText,
    String? resultText,
    String? toLanguage,
    String? fromLanguage,
  }) {
    return TranslateState(
      inputText: inputText ?? this.inputText,
      resultText: resultText ?? this.resultText,
      toLanguage: toLanguage ?? this.toLanguage,
      fromLanguage: fromLanguage ?? this.fromLanguage,
    );
  }
}
