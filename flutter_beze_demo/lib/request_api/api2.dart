import 'dart:convert';

import 'package:http/http.dart' as http;

class Api2 {
  final List<String> language;
  Api2({required this.language});
  factory Api2.fromJson(Map<String, dynamic> json) {
    return Api2(language: (json['language']).cast<String>());
  }
}

Future<Api2> fetchApi2() async {
  final reponse = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/userHungAnh/requestApiDemo/main/api2'));
  if (reponse.statusCode == 200) {
    return Api2.fromJson(jsonDecode(reponse.body));
  } else {
    return throw Exception('fail api2');
  }
}
