import 'package:flutter/material.dart';

class MasterCircleOutlineButton extends StatelessWidget {
  const MasterCircleOutlineButton(
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
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

class MasterCircleButton extends StatelessWidget {
  const MasterCircleButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.bachgroundColor = Colors.red,
      this.colorTheme = Colors.white})
      : super(key: key);
  final Color bachgroundColor;
  final Color colorTheme;
  final String text;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        elevation: 20,
        primary: bachgroundColor,
        onPrimary: colorTheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }
}
