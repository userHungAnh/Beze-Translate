import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_state.dart';
import 'package:flutter_beze_demo/constants/language_data_constants.dart';
import 'package:flutter_beze_demo/widget/search.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SelectFromLanguageUi extends StatelessWidget {
  const SelectFromLanguageUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) => SelectFromLanguage(),
      ),
      title: Text(context.watch<GoogleTranslateBloc>().state.fromLanguage),
      trailing: Icon(Icons.arrow_drop_down),
    );
  }
}

class SelectFromLanguage extends StatefulWidget {
  SelectFromLanguage({Key? key}) : super(key: key);

  @override
  State<SelectFromLanguage> createState() => _SelectFromLanguageState();
}

class _SelectFromLanguageState extends State<SelectFromLanguage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return SingleChildScrollView(
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Search(
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
            hide: context.watch<SearchBloc>().state.hasSearch,
          ),
          content:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Current Language'),
            ListTile(
              title:
                  Text(context.watch<GoogleTranslateBloc>().state.fromLanguage),
              selected: true,
              trailing: Icon(Icons.check),
            ),
            Container(
              height: 400,
              width: 500,
              child: ListView(
                padding: EdgeInsets.all(12.0),
                children: state.listResults.map((data) {
                  return ListTile(
                      title: Text(data),
                      onTap: () {
                        context.read<GoogleTranslateBloc>().add(
                              GoogleTranslateChangedFromLanguageEvent(
                                  fromLanguage: data),
                            );
                        context.read<GoogleTranslateBloc>().add(
                            GoogleTranslateTypingEvent(
                                inputText: context
                                    .read<GoogleTranslateBloc>()
                                    .state
                                    .inputText));
                        context.read<SearchBloc>().add(SearchClearEvent());
                        Navigator.of(context).pop();
                      });
                }).toList(),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
