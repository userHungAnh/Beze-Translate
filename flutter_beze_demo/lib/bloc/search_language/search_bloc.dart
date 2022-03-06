import 'dart:convert';

import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_state.dart';
import 'package:flutter_beze_demo/request_api/api2.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchInitEvent>(_onSearchInitEvent);
    on<SearchTypingAndSearchEvent>(_onSearchTypingAndSearchEvent);
    on<SearchClearEvent>(_onSearchClearEvent);
    // on<CreateListItemsEvent>(_onCreateListItemsEvent);
  }

  void _onSearchInitEvent(
      SearchInitEvent event, Emitter<SearchState> emit) async {
    final reponse = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/userHungAnh/requestApiDemo/main/api2'));
    emit(state.copyWith(
      listItems: Api2.fromJson(jsonDecode(reponse.body)).language,
      listResults: Api2.fromJson(jsonDecode(reponse.body)).language,
      hasSearch: false,
      hasSelected: false,
      selectItem: '',
    ));
  }

  void _onSearchTypingAndSearchEvent(
      SearchTypingAndSearchEvent event, Emitter<SearchState> emit) {
    List<String> resultList = List.from(state.listItems);
    resultList = state.listItems
        .where((string) =>
            string.toLowerCase().contains(event.searchText.toLowerCase()))
        .toList();
    emit(state.copyWith(listResults: resultList, hasSearch: true));
  }

  void _onSearchClearEvent(SearchClearEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(hasSearch: false, listResults: state.listItems));
  }
}
