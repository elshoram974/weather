import 'package:flutter/material.dart';

import 'view/screens/home_screen.dart';
import 'view/screens/search_screen.dart';

abstract class AppRoutManger {
  static String get homePage => '/';
  static String get searchPage => '/searchPage';

  static Map<String, Widget Function(BuildContext)> get routes => {
        homePage: (context) => const HomeScreen(),
        searchPage: (context) => const SearchScreen(),
      };
}
