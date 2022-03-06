import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

const double fontSizeRegular = 20;

class RegularText extends StatelessWidget {
  const RegularText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.watch<ThemeBloc>().state.textColor,
        fontSize: fontSizeRegular,
      ),
    );
  }
}

class RegularItalicText extends StatelessWidget {
  const RegularItalicText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: context.watch<ThemeBloc>().state.textColor,
          fontSize: fontSizeRegular,
          fontStyle: FontStyle.italic),
    );
  }
}

class RegularBoldText extends StatelessWidget {
  const RegularBoldText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: context.watch<ThemeBloc>().state.textColor,
          fontSize: fontSizeRegular,
          fontWeight: FontWeight.bold),
    );
  }
}
