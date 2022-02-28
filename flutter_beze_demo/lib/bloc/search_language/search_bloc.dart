import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState()) {
    on<SearchInitEvent>(_onSearchInitEvent);
    on<SearchTypingAndSearchEvent>(_onSearchTypingAndSearchEvent);

    on<SearchClearEvent>(_onSearchClearEvent);
    // on<SearchingEvent>(_onSearchingEvent);
  }

  void _onSearchInitEvent(SearchInitEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(
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
