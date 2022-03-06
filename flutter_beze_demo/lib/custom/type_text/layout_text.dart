import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, this.text = ''}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.watch<ThemeBloc>().state.textColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: context.watch<ThemeBloc>().state.textColor,
        fontSize: 20,
      ),
    );
  }
}

class SettingText extends StatelessWidget {
  const SettingText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }
}
