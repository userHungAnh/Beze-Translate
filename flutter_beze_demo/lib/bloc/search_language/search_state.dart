import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final List<String> listItems;
  final List<String> listResults;
  final bool hasSearch;
  final bool hasSelected;
  final String selectItem;
  SearchState({
    this.listItems = ListDataDemo.dataDemo,
    this.listResults = ListDataDemo.dataDemo,
    this.hasSearch = false,
    this.hasSelected = false,
    this.selectItem = '',
  });
  @override
  List<Object> get props => [listItems, listResults, hasSearch, selectItem];

  SearchState copyWith({
    List<String>? listItems,
    List<String>? listResults,
    bool? hasSearch,
    bool? hasSelected,
    String? selectItem,
  }) {
    return SearchState(
      listItems: listItems ?? this.listItems,
      listResults: listResults ?? this.listResults,
      hasSearch: hasSearch ?? this.hasSearch,
      hasSelected: hasSelected ?? this.hasSelected,
      selectItem: selectItem ?? this.selectItem,
    );
  }
}

class ListDataDemo {
  static const List<String> dataDemo = [];
}
