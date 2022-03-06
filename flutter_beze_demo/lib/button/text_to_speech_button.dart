import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_event.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TextToSpeechButton extends StatelessWidget {
  TextToSpeechButton({Key? key, required this.text, required this.language})
      : super(key: key);
  final text;
  final language;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
        onTap: () {
          context.read<TextToSpeechBLoc>().add(TextToSpeechPlayEvent(
              textToSpeech: text, languageSpeech: language));
        },
        child: const Center(
            child: Icon(
          Icons.volume_up,
          color: Colors.lightBlue,
        )),
      ),
    ]);
  }
}
