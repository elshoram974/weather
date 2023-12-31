import 'dart:convert';

import 'include/astro.dart';
import 'include/day.dart';
import 'include/hour_element.dart';

class ForecastDay {
  final DateTime date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<HourElement> hours;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hours,
  });

  ForecastDay copyWith({
    DateTime? date,
    int? dateEpoch,
    Day? day,
    Astro? astro,
    List<HourElement>? hours,
  }) =>
      ForecastDay(
        date: date ?? this.date,
        dateEpoch: dateEpoch ?? this.dateEpoch,
        day: day ?? this.day,
        astro: astro ?? this.astro,
        hours: hours ?? this.hours,
      );

  factory ForecastDay.fromRawJson(String str) =>
      ForecastDay.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hours: List<HourElement>.from(
            json["hour"].map((x) => HourElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hours.map((x) => x.toJson())),
      };
}
