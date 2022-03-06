import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangedThemeButton extends StatelessWidget {
  const ChangedThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: context.watch<ThemeBloc>().state.isTheme,
      onChanged: (value) {
        context.read<ThemeBloc>().add(ChangeThemeModeEvent());
      },
    );
  }
}
