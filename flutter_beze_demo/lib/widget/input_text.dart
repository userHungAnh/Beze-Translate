import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_event.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';

import 'package:flutter_beze_demo/widget/text_to_speech_build.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key? key,
  }) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    context.read<GoogleTranslateBloc>().add(GoogleTranslateTypingEvent(
        inputText: controller.text =
            context.watch<SpeechToTextBloc>().state.speechToText));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
              suffixIcon: SuffixIconShow(controller: controller),
              border: InputBorder.none),
          onChanged: (value) {
            context
                .read<GoogleTranslateBloc>()
                .add(GoogleTranslateTypingEvent(inputText: value));
          },
        ),
        TextToSpeechButton(
          text: context.read<GoogleTranslateBloc>().state.inputText,
          language: context.read<GoogleTranslateBloc>().state.fromLanguage,
        )
      ],
    );
  }
}

class SuffixIconShow extends StatelessWidget {
  const SuffixIconShow({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return (context.watch<GoogleTranslateBloc>().state.inputText != '')
        ? IconButton(
            onPressed: () {
              controller.clear();
              context
                  .read<GoogleTranslateBloc>()
                  .add(GoogleTranslateClearTypingEvent());
              context.read<SpeechToTextBloc>().add(SpeechToTextCleanEvent());
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ))
        : SizedBox();
  }
}
