import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:flutter_beze_demo/bloc_obsever.dart';
import 'package:flutter_beze_demo/screen/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(MultiBlocProvider(providers: [
      BlocProvider<SpeechToTextBloc>(create: (context) => SpeechToTextBloc()),
      BlocProvider<GoogleTranslateBloc>(
          create: (context) => GoogleTranslateBloc()),
      BlocProvider<TextToSpeechBLoc>(create: (context) => TextToSpeechBLoc()),
      BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
    ], child: MyApp()));
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeData.light(),
      // theme: ThemeData.light(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
