import 'secret_keys.dart';

abstract class AppLinks {
  static String get baseLink => 'http://api.weatherapi.com/v1';

  static final String _key = 'key=${SecretKeys.api}';

  // that wanted

  // "&aqi=no"
  static String current(String q) => '$baseLink/current.json?$_key&q=$q';

  static String forecast(String q) =>'$baseLink/forecast.json?$_key&q=$q&days=5&aqi=no&alerts=no';

  static String search(String q) => '$baseLink/search.json?$_key&q=$q';

  // "&dt=2023-09-15"
  static String future(String q) => '$baseLink/future.json?$_key&q=$q';
}
