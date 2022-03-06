import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';
import 'package:flutter_beze_demo/custom/type_text/layout_text.dart';
import 'package:flutter_beze_demo/button/back_setting_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingSpeechToText extends StatefulWidget {
  const SettingSpeechToText({Key? key}) : super(key: key);

  @override
  State<SettingSpeechToText> createState() => _SettingSpeechToTextState();
}

class _SettingSpeechToTextState extends State<SettingSpeechToText> {
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listening'),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 20),
        shadowColor: Colors.grey,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 80,
        leading: BackSettingButton(
          text: 'Setting',
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingText(text: 'set time'),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Listen Time',
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => SelectTime(
                                content: Container(
                                  height: 400,
                                  width: 400,
                                  child: ListView.builder(
                                      itemCount: 12,
                                      itemBuilder: (context, index) {
                                        int seconds = (index + 1) * 5;
                                        return ListTile(
                                          onTap: () => context
                                              .read<SpeechToTextBloc>()
                                              .add(
                                                  SpeechToTextChangedListenTimeEvent(
                                                      newTime: seconds)),
                                          title: Text('${seconds}'),
                                        );
                                      }),
                                ),
                              ));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.watch<SpeechToTextBloc>().state.listenFor} seconds',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Pause Time',
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => SelectTime(
                                content: Container(
                                  height: 400,
                                  width: 400,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () => context
                                              .read<SpeechToTextBloc>()
                                              .add(
                                                  SpeechToTextChangedPauseTimeEvent(
                                                      newTime: index + 1)),
                                          title: Text('${index + 1}'),
                                        );
                                      }),
                                ),
                              ));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.watch<SpeechToTextBloc>().state.pauseFor} seconds',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTime extends StatelessWidget {
  const SelectTime({Key? key, required this.content}) : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Timer'),
      content: content,
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ok')),
      ],
    );
  }
}
