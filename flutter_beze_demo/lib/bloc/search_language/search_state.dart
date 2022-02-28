import 'package:equatable/equatable.dart';

import 'package:flutter_beze_demo/constants/language_data_constants.dart';

class SearchState extends Equatable {
  // final String searchText;
  final List<String> listItems;
  final List<String> listResults;
  final bool hasSearch;
  final bool hasSelected;
  final String selectItem;
  SearchState({
    // this.searchText = '',
    this.listItems = GoogleTranslateConstants.listNameLanguages,
    this.listResults = GoogleTranslateConstants.listNameLanguages,
    this.hasSearch = false,
    this.hasSelected = false,
    this.selectItem = '',
  });
  @override
  List<Object> get props => [listItems, listResults, hasSearch, selectItem];

  SearchState copyWith({
    // String? searchText,
    List<String>? listItems,
    List<String>? listResults,
    bool? hasSearch,
    bool? hasSelected,
    String? selectItem,
  }) {
    return SearchState(
      // searchText: searchText ?? this.searchText,
      listItems: listItems ?? this.listItems,
      listResults: listResults ?? this.listResults,
      hasSearch: hasSearch ?? this.hasSearch,
      hasSelected: hasSelected ?? this.hasSelected,
      selectItem: selectItem ?? this.selectItem,
    );
  }
}

class ListData {
  static const List<String> listData = [];
}
