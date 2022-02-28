import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/google_translate_language/google_translate_event.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_event.dart';
import 'package:flutter_beze_demo/screen/page_view/list_page/account_page.dart';
import 'package:flutter_beze_demo/screen/page_view/list_page/home_page.dart';
import 'package:flutter_beze_demo/screen/page_view/list_page/setting/setting_page.dart';

import 'package:flutter_beze_demo/screen/views/navigator_bottom.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _onPageViewChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<SpeechToTextBloc>().add(SpeechToTextInitEvent());
    context.read<GoogleTranslateBloc>().add((GoogleTranslateInitEvent()));
    context.read<TextToSpeechBLoc>().add(TextToSpeechInitEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: NavigatorBottom(
            currentIndex: currentIndex,
            onTap: (index) {
              _onItemTapped(index);
            },
          ),
          body: PageView(
            onPageChanged: (index) {
              _onPageViewChanged(index);
            },
            controller: _pageController,
            children: [
              HomePage(
                widthScaffold: size.width,
              ),
              SettingPage(
                widthScaffold: size.width,
              ),
              const AccountPage(),
            ],
          )),
    );
  }
}
