import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';

import 'package:flutter_beze_demo/ui/home/widget/text_to_speech_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ResultText extends StatelessWidget {
  const ResultText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(context.watch<TranslateBloc>().state.resultText),
        ),
        TextToSpeechButton(
          text: context.read<TranslateBloc>().state.resultText,
          language: context.read<TranslateBloc>().state.toLanguage,
        )
      ],
    );
  }
}
