import 'package:flutter/material.dart';
import 'package:flutter_beze_demo/bloc/page_controller/page_controller_bloc.dart';
import 'package:flutter_beze_demo/bloc/page_controller/page_controller_event.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_bloc.dart';
import 'package:flutter_beze_demo/bloc/search_language/search_event.dart';

import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_bloc.dart';
import 'package:flutter_beze_demo/bloc/speech_to_text.dart/speech_to_text_event.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:flutter_beze_demo/bloc/text_to_speech/text_to_speech_event.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_bloc.dart';
import 'package:flutter_beze_demo/bloc/theme/theme_event.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_bloc.dart';
import 'package:flutter_beze_demo/bloc/translate_language/google_translate_event.dart';
import 'package:flutter_beze_demo/request_api/api2.dart';
import 'package:flutter_beze_demo/ui/account/screen/account_screen.dart';
import 'package:flutter_beze_demo/ui/home/screen/home_screen.dart';
import 'package:flutter_beze_demo/ui/setting/setting_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/widget/navigator_bottom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void initState() {
    context.read<ThemeBloc>().add(ThemeInitEvent());
    context.read<SpeechToTextBloc>().add(SpeechToTextInitEvent());
    context.read<TranslateBloc>().add((TranslateInitEvent()));
    context.read<TextToSpeechBLoc>().add(TextToSpeechInitEvent());
    context.read<PageControllerBloc>().add(PageControllerInitialEvent());
    context.read<SearchBloc>().add(SearchInitEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: NavigatorBottom(
            currentIndex:
                context.watch<PageControllerBloc>().state.currentIndex,
            onTap: (index) {
              context.read<PageControllerBloc>().add(PageControllerOntapEvent(
                  newPageIndex: index, pageController: _pageController));
            },
          ),
          body: PageView(
            onPageChanged: (index) {
              context
                  .read<PageControllerBloc>()
                  .add(PageControllerChangePageEvent(
                    newPageIndex: index,
                  ));
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
