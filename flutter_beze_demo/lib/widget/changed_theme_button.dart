import 'package:flutter/material.dart';

class ChangedThemeButton extends StatelessWidget {
  const ChangedThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: true,
      onChanged: (value) {},
    );
  }
}
