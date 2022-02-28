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
    // return BlocBuilder<TextToSpeechBLoc, TextToSpeechState>(
    //   builder: (context, state) {
    return Row(children: [
      InkWell(
        onTap: () {
          // context.read<TextToSpeechBLoc>().state.status !=
          //         TextToSpeechStatus.playing
          context.read<TextToSpeechBLoc>().add(TextToSpeechPlayEvent(
              textToSpeech: text, languageSpeech: language));
          // : context.read<TextToSpeechBLoc>().add(TextToSpeechStopEvent());
        },
        child:
            // context.read<TextToSpeechBLoc>().state.status ==
            //         TextToSpeechStatus.playing

            const Center(child: Icon(Icons.volume_up)),
      ),
    ]);
  }
  //   );
  // }
}
