import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegularIconButton extends StatelessWidget {
  const RegularIconButton({Key? key, required this.onPress, required this.icon})
      : super(key: key);
  final IconData icon;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(icon),
        iconSize: 20,
      ),
    );
  }
}

class RegularButton extends StatelessWidget {
  const RegularButton({Key? key, required this.onPress, required this.text})
      : super(key: key);
  final String text;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
    );
  }
}

class RegularCircleButton extends StatelessWidget {
  const RegularCircleButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.color = Colors.red})
      : super(key: key);
  final Color color;
  final String text;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}

class RegularCircleOutlineButton extends StatelessWidget {
  const RegularCircleOutlineButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.color = Colors.red})
      : super(key: key);
  final Color color;
  final String text;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0.0,
        onPrimary: color,
        side: BorderSide(width: 2.0, color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
