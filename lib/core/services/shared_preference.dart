import 'package:shared_preferences/shared_preferences.dart';

abstract class Prefs {
  static late SharedPreferences shared;

  static Future<void> init() async {
    shared = await SharedPreferences.getInstance();
  }
}
