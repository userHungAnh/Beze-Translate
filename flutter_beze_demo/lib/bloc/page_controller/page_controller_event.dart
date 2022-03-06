import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PageControllerEvent extends Equatable {
  PageControllerEvent();
  List<Object> get props => [];
}

class PageControllerInitialEvent extends PageControllerEvent {}

class PageControllerChangePageEvent extends PageControllerEvent {
  final int newPageIndex;
  PageControllerChangePageEvent({
    required this.newPageIndex,
  });
}

class PageControllerOntapEvent extends PageControllerEvent {
  final int newPageIndex;
  final PageController pageController;
  PageControllerOntapEvent({
    required this.newPageIndex,
    required this.pageController,
  });
}
