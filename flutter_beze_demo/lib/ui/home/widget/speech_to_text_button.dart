import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeechToTextButton extends StatelessWidget {
  const SpeechToTextButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
        animate: context.watch<SpeechToTextBloc>().state.hasSpeech,
        glowColor: Colors.blue,
        duration: const Duration(milliseconds: 1000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: Center(
          child: FloatingActionButton(
              onPressed: () => context.read<SpeechToTextBloc>().state.hasSpeech
                  ? context
                      .read<SpeechToTextBloc>()
                      .add(SpeechToTextStopListenEvent())
                  : context.read<SpeechToTextBloc>().add(
                      SpeechToTextStartListenEvent(
                          language: context
                              .read<TranslateBloc>()
                              .state
                              .fromLanguage)),
              child: Icon(
                context.watch<SpeechToTextBloc>().state.hasSpeech
                    ? Icons.mic_off
                    : Icons.mic,
                color: Colors.white,
              )),
        ),
        endRadius: 55.0);
  }
}
