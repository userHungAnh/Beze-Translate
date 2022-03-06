import 'package:equatable/equatable.dart';

class SearchEvent extends Equatable {
  SearchEvent();
  @override
  List<Object> get props => [];
}

class SearchInitEvent extends SearchEvent {}

class SearchTypingAndSearchEvent extends SearchEvent {
  final String searchText;

  SearchTypingAndSearchEvent({
    required this.searchText,
  });
}

class CreateListItemsEvent extends SearchEvent {
  final List<String> items;

  CreateListItemsEvent({
    required this.items,
  });
}

class SearchingEvent extends SearchEvent {}

class SearchClearEvent extends SearchEvent {}
