import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search(
      {Key? key,
      this.clearText,
      this.onChanged,
      this.hide = false,
      required this.controller})
      : super(key: key);
  TextEditingController controller;
  void Function(String)? onChanged;
  void Function()? clearText;
  bool hide;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: "Search",
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 24.0,
            color: Colors.grey,
          ),
          suffix: hide
              ? IconButton(
                  onPressed: clearText,
                  icon: Icon(
                    Icons.clear_rounded,
                    color: Colors.blue,
                    size: 24.0,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
