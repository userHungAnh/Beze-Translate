import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_state.dart';

import 'package:flutter_beze_demo/widget/back_setting_button.dart';
import 'package:flutter_beze_demo/widget/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingLanguage extends StatefulWidget {
  const SettingLanguage({Key? key}) : super(key: key);

  @override
  State<SettingLanguage> createState() => _SettingLanguageState();
}

class _SettingLanguageState extends State<SettingLanguage> {
  TextEditingController _controller = TextEditingController();
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 219, 218, 221),
            appBar: AppBar(
              centerTitle: true,
              title: Text(' Languages'),
              titleTextStyle: TextStyle(color: Colors.blue, fontSize: 20),
              shadowColor: Colors.grey,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leadingWidth: 80,
              leading: BackSettingButton(),
            ),
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Search(
                    controller: _controller,
                    onChanged: (value) {
                      context
                          .read<SearchBloc>()
                          .add(SearchTypingAndSearchEvent(searchText: value));
                    },
                    clearText: () {
                      context.read<SearchBloc>().add(SearchClearEvent());
                      _controller.text = '';
                      context
                          .read<SearchBloc>()
                          .add(SearchTypingAndSearchEvent(searchText: ''));
                    },
                    hide: state.hasSearch,
                  ),
                  Text(
                    'Current Language'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(context
                          .watch<GoogleTranslateBloc>()
                          .state
                          .fromLanguage),
                      selected: true,
                      trailing: Icon(Icons.check),
                    ),
                  ),
                  Text(
                    'List Language'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        padding: EdgeInsets.all(12.0),
                        children: state.listResults.map((data) {
                          return Column(
                            children: [
                              ListTile(
                                  title: Text(data),
                                  onTap: () {
                                    context.read<GoogleTranslateBloc>().add(
                                        GoogleTranslateChangedFromLanguageEvent(
                                            fromLanguage: data));
                                    _controller.text = '';
                                    context
                                        .read<GoogleTranslateBloc>()
                                        .add(GoogleTranslateClearTypingEvent());
                                  }),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
