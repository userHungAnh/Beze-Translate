import 'package:flutter/material.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_event.dart';

import 'package:flutter_beze_demo/button/text_to_speech_button.dart';
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
    context.read<TranslateBloc>().add(TranslateTypingEvent(
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
                .read<TranslateBloc>()
                .add(TranslateTypingEvent(inputText: value));
          },
        ),
        TextToSpeechInput()
      ],
    );
  }
}

class TextToSpeechInput extends StatelessWidget {
  const TextToSpeechInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextToSpeechButton(
      text: context.read<TranslateBloc>().state.inputText,
      language: context.watch<TranslateBloc>().state.fromLanguage,
    );
  }
}

class SuffixIconShow extends StatelessWidget {
  const SuffixIconShow({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return (context.watch<TranslateBloc>().state.inputText != '')
        ? IconButton(
            onPressed: () {
              controller.text = '';
              context.read<TranslateBloc>().add(TranslateClearTypingEvent());
              context.read<SpeechToTextBloc>().add(SpeechToTextCleanEvent());
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.grey,
            ))
        : SizedBox();
  }
}
