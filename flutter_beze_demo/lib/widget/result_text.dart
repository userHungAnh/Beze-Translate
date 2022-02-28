import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';

import 'package:flutter_beze_demo/widget/text_to_speech_build.dart';

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
          child: Text(context.watch<GoogleTranslateBloc>().state.resultText),
        ),
        TextToSpeechButton(
          text: context.read<GoogleTranslateBloc>().state.resultText,
          language: context.read<GoogleTranslateBloc>().state.toLanguage,
        )
      ],
    );
  }
}
