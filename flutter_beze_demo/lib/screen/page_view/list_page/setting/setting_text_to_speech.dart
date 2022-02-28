import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_event.dart';
import 'package:flutter_beze_demo/widget/back_setting_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SettingTextToSpeech extends StatelessWidget {
  const SettingTextToSpeech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Speaking'),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 20),
        shadowColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 80,
        leading: BackSettingButton(),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Volume'.toUpperCase(),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        ListTile(
          shape: Border(
              top: BorderSide(color: Color.fromARGB(255, 219, 218, 218)),
              bottom: BorderSide(color: Color.fromARGB(255, 219, 218, 218))),
          title: Slider(
              inactiveColor: Colors.grey,
              value: context.watch<TextToSpeechBLoc>().state.volume,
              onChanged: (newVolume) {
                context
                    .read<TextToSpeechBLoc>()
                    .add(TextToSpeechChangedVolume(newVolume: newVolume));
              },
              min: 0.0,
              max: 1.0,
              divisions: 10,
              label:
                  "Volume: ${context.read<TextToSpeechBLoc>().state.volume}"),
        ),
        Text(
          'pitch'.toUpperCase(),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        ListTile(
          shape: Border(
              top: BorderSide(color: Color.fromARGB(255, 219, 218, 218)),
              bottom: BorderSide(color: Color.fromARGB(255, 219, 218, 218))),
          title: Slider(
            inactiveColor: Colors.grey,
            value: context.watch<TextToSpeechBLoc>().state.pitch,
            onChanged: (newPitch) {
              context
                  .read<TextToSpeechBLoc>()
                  .add(TextToSpeechChangedPitchEvent(newPitch: newPitch));
            },
            min: 0.5,
            max: 2.0,
            divisions: 15,
            label: "Pitch: ${context.read<TextToSpeechBLoc>().state.pitch}",
          ),
        ),
        Text(
          'rate'.toUpperCase(),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        ListTile(
          shape: Border(
              top: BorderSide(color: Color.fromARGB(255, 219, 218, 218)),
              bottom: BorderSide(color: Color.fromARGB(255, 219, 218, 218))),
          title: Slider(
            inactiveColor: Colors.grey,
            value: context.watch<TextToSpeechBLoc>().state.rate,
            onChanged: (newRate) {
              context
                  .read<TextToSpeechBLoc>()
                  .add(TextToSpeechChangedRate(newRate: newRate));
            },
            min: 0.0,
            max: 1.0,
            divisions: 10,
            label: "Rate: ${context.read<TextToSpeechBLoc>().state.rate}",
          ),
        )
      ]),
    );
  }
}
