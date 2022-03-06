import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/page_controller/page_controller_event.dart';
import 'package:flutter_beze_demo/bloc/page_controller/page_controller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageControllerBloc
    extends Bloc<PageControllerEvent, PageControllerState> {
  PageControllerBloc() : super(PageControllerState()) {
    on<PageControllerInitialEvent>(_onPageControllerInitialEvent);
    on<PageControllerChangePageEvent>(_onPageControllerChangePageEvent);
    on<PageControllerOntapEvent>(_onPageControllerOntapEvent);
  }

  void _onPageControllerInitialEvent(
      PageControllerInitialEvent event, Emitter<PageControllerState> emit) {
    emit(state.copyWith(currentIndex: 0));
  }

  void _onPageControllerChangePageEvent(
      PageControllerChangePageEvent event, Emitter<PageControllerState> emit) {
    emit(state.copyWith(currentIndex: event.newPageIndex));
  }

  void _onPageControllerOntapEvent(
      PageControllerOntapEvent event, Emitter<PageControllerState> emit) {
    event.pageController.animateToPage(event.newPageIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
