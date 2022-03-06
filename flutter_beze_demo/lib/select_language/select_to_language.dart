import 'package:flutter/material.dart';

import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_state.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_event.dart';

import 'package:flutter_beze_demo/widget/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectToLanguageUi extends StatelessWidget {
  const SelectToLanguageUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => SelectToLanguage());
      },
      title: Text(context.watch<TranslateBloc>().state.toLanguage),
      trailing: Icon(Icons.arrow_drop_down),
    );
  }
}

class SelectToLanguage extends StatefulWidget {
  SelectToLanguage({Key? key}) : super(key: key);

  @override
  State<SelectToLanguage> createState() => _SelectToLanguageState();
}

class _SelectToLanguageState extends State<SelectToLanguage> {
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
            hide: state.hasSearch,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Current Language'),
              ListTile(
                title: Text(context.watch<TranslateBloc>().state.toLanguage),
                selected: true,
                trailing: Icon(Icons.check),
              ),
              Container(
                height: 400,
                width: 400,
                child: ListView(
                  padding: EdgeInsets.all(12.0),
                  children: state.listResults.map((data) {
                    return ListTile(
                      title: Text(data),
                      onTap: () {
                        context.read<TranslateBloc>().add(
                            TranslateChangedToLanguageEvent(toLanguage: data));
                        context.read<TranslateBloc>().add(TranslateTypingEvent(
                            inputText:
                                context.read<TranslateBloc>().state.inputText));
                        context.read<SearchBloc>().add(SearchClearEvent());
                        Navigator.of(context).pop();
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
