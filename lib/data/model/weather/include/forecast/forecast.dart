import 'dart:convert';

import 'include/forecast_day.dart';

class Forecast {
  final List<ForecastDay> forecastDays;

  Forecast({
    required this.forecastDays,
  });

  Forecast copyWith({
    List<ForecastDay>? forecastDays,
  }) =>
      Forecast(
        forecastDays: forecastDays ?? this.forecastDays,
      );

  factory Forecast.newEmpty() => Forecast(forecastDays: []);

  String toRawJson() => json.encode(toJson());

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastDays: List<ForecastDay>.from(
            json["forecastday"].map((x) => ForecastDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastDays.map((x) => x)),
      };
}
