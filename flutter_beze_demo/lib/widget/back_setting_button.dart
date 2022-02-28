import 'package:flutter/material.dart';

class BackSettingButton extends StatelessWidget {
  const BackSettingButton({Key? key}) : super(key: key);

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
            'Settings',
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
