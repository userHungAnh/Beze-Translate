import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';

import 'package:flutter_beze_demo/bloc/theme/theme_state.dart';
import 'package:flutter_beze_demo/bloc/bloc_obsever.dart';

import 'package:flutter_beze_demo/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/page_controller/page_controller_bloc.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(MultiBlocProvider(providers: [
      BlocProvider<SpeechToTextBloc>(create: (context) => SpeechToTextBloc()),
      BlocProvider<TranslateBloc>(create: (context) => TranslateBloc()),
      BlocProvider<TextToSpeechBLoc>(create: (context) => TextToSpeechBLoc()),
      BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
      BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      BlocProvider<PageControllerBloc>(
        create: (context) => PageControllerBloc(),
        
      )
    ], child: MyApp()));
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeBloc>().state.themeSytem,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: Home(),
    );
  }
}
