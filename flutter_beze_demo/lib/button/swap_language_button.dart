import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_event.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SwapLanguage extends StatelessWidget {
  const SwapLanguage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<TranslateBloc>().add(
                TranslateSwapLanguage(
                  currentFromLanguage:
                      context.read<TranslateBloc>().state.fromLanguage,
                  currentToLanguage:
                      context.read<TranslateBloc>().state.toLanguage,
                ),
              );
        },
        child: Icon(
          Icons.compare_arrows,
          color: Colors.lightBlue,
        ));
  }
}
