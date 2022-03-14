import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';
import 'package:flutter_beze_demo/request_api/api2.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<String>>(
          future: fetchApi2(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                  child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text('${snapshot.data![index]}');
                },
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
