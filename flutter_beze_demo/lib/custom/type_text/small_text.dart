import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

const double fontSizeSmall = 15;

class SmallText extends StatelessWidget {
  const SmallText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.watch<ThemeBloc>().state.textColor,
        fontSize: fontSizeSmall,
      ),
    );
  }
}

class SmallItalicText extends StatelessWidget {
  const SmallItalicText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.watch<ThemeBloc>().state.textColor,
        fontStyle: FontStyle.italic,
        fontSize: fontSizeSmall,
      ),
    );
  }
}

class SmallTextError extends StatelessWidget {
  const SmallTextError({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSizeSmall,
        color: Colors.red,
      ),
    );
  }
}

class SmallItalicTextError extends StatelessWidget {
  const SmallItalicTextError({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.red,
        fontStyle: FontStyle.italic,
        fontSize: fontSizeSmall,
      ),
    );
  }
}

class SmallBoldText extends StatelessWidget {
  const SmallBoldText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.watch<ThemeBloc>().state.textColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSizeSmall,
      ),
    );
  }
}
