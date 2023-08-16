import 'dart:convert';

import 'include/current/current.dart';
import 'include/forecast/forecast.dart';
import 'include/location.dart';

class Weather {
  final Location location;
  final Current current;
  final Forecast forecast;

  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  Weather copyWith({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) =>
      Weather(
        location: location ?? this.location,
        current: current ?? this.current,
        forecast: forecast ?? this.forecast,
      );

  factory Weather.newEmpty() => Weather(
        location: Location.newEmpty(),
        current: Current.newEmpty(),
        forecast: Forecast.newEmpty(),
      );
  factory Weather.fromRawJson(String str) => Weather.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
      };
}
