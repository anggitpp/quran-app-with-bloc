import 'package:flutter/material.dart';
import 'package:quran_app/models/detail_surah.dart';
import 'package:quran_app/screens/detail_surah/detail_surah_page.dart';
import 'package:quran_app/screens/home/search_page.dart';
import 'package:quran_app/screens/last_read/last_read_page.dart';

import '../models/surah.dart';
import '../screens/home/home_page.dart';
import '../screens/introduction/introduction_page.dart';
import 'route_name.dart';

final routes = {
  RouteName.introduction: (context) => const IntroductionPage(),
  RouteName.home: (context) => const HomePage(),
  RouteName.homeSearch: (context) => const HomeSearchPage(),
  RouteName.detailSurah: (context) => DetailSurahPage(
        surah: ModalRoute.of(context)!.settings.arguments as Surah,
      ),
  RouteName.lastRead: (context) => const LastReadPage(),
};
