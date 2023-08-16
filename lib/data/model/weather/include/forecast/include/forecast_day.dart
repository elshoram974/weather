
import 'dart:convert';

import 'include/astro.dart';
import 'include/day.dart';
import 'include/hour_element.dart';

class ForecastDay {
    final DateTime date;
    final int dateEpoch;
    final Day day;
    final Astro astro;
    final List<HourElement> hour;

    ForecastDay({
        required this.date,
        required this.dateEpoch,
        required this.day,
        required this.astro,
        required this.hour,
    });

    ForecastDay copyWith({
        DateTime? date,
        int? dateEpoch,
        Day? day,
        Astro? astro,
        List<HourElement>? hour,
    }) => 
        ForecastDay(
            date: date ?? this.date,
            dateEpoch: dateEpoch ?? this.dateEpoch,
            day: day ?? this.day,
            astro: astro ?? this.astro,
            hour: hour ?? this.hour,
        );

    factory ForecastDay.fromRawJson(String str) => ForecastDay.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
        date: DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: List<HourElement>.from(json["hour"].map((x) => HourElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
    };
}
