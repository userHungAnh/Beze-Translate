import 'package:flutter/material.dart';

class BackSettingButton extends StatelessWidget {
  const BackSettingButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.lightBlue,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
