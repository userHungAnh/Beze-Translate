import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/custom/type_text/regular_text.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';

import 'package:flutter_beze_demo/select_language/select_from_language.dart';
import 'package:flutter_beze_demo/select_language/select_to_language.dart';

import 'package:flutter_beze_demo/widget/input_text.dart';
import 'package:flutter_beze_demo/widget/result_text.dart';
import 'package:flutter_beze_demo/button/speech_to_text_button.dart';
import 'package:flutter_beze_demo/button/swap_language_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/translate_language/google_translate_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.widthScaffold,
  }) : super(key: key);

  final double widthScaffold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: widthScaffold,
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SelectFromLanguageUi(),
                ),
                SwapLanguage(),
                Expanded(
                  child: SelectToLanguageUi(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: widthScaffold - 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FromLanguage(),
                    InputText(),
                    ToLanguage(),
                    ResultText(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeechToTextButton(),
    );
  }
}

class FromLanguage extends StatelessWidget {
  const FromLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegularText(text: context.watch<TranslateBloc>().state.fromLanguage);
  }
}

class ToLanguage extends StatelessWidget {
  const ToLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegularText(text: context.watch<TranslateBloc>().state.toLanguage);
  }
}
