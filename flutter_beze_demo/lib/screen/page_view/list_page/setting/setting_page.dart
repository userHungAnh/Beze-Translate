import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/screen/page_view/list_page/setting/setting_speech_to_text.dart';
import 'package:flutter_beze_demo/screen/page_view/list_page/setting/setting_text_to_speech.dart';
import 'package:flutter_beze_demo/widget/changed_theme_button.dart';
import 'package:flutter_beze_demo/screen/page_view/list_page/setting/setting_language.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key, required this.widthScaffold}) : super(key: key);
  final double widthScaffold;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widthScaffold,
        color: Color.fromARGB(255, 219, 218, 221),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 100,
                  width: widthScaffold,
                  child: Text('Setting account'),
                ),
              ),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: ListTile(
                    title: Text('Changed Theme'),
                    trailing: ChangedThemeButton(),
                  )),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        'Text To Speech',
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SettingTextToSpeech()));
                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    Divider(
                      height: 1,
                    ),
                    ListTile(
                      title: Text(
                        'Speech To Text',
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SettingSpeechToText()));
                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                    title: Text(
                      'Language',
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingLanguage()));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${context.watch<GoogleTranslateBloc>().state.fromLanguage}'
                              .toUpperCase(),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
