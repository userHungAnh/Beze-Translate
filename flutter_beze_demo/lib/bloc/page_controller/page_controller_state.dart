import 'package:equatable/equatable.dart';

class PageControllerState extends Equatable {
  final int currentIndex;

  PageControllerState({
    this.currentIndex = 0,
  });
  List<Object> get props => [currentIndex];

  PageControllerState copyWith({
    int? currentIndex,
  }) {
    return PageControllerState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
