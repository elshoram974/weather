import 'dart:convert';

import '../../../current/include/condition.dart';

class Day {
  final double maxtempC;
  final double maxtempF;
  final double? mdoubleempC;
  final double? mdoubleempF;
  final double avgtempC;
  final double avgtempF;
  final double maxWindMph;
  final double maxWindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final double avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mdoubleempC,
    required this.mdoubleempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  Day copyWith({
    double? maxtempC,
    double? maxtempF,
    double? mdoubleempC,
    double? mdoubleempF,
    double? avgtempC,
    double? avgtempF,
    double? maxWindMph,
    double? maxWindKph,
    double? totalprecipMm,
    double? totalprecipIn,
    double? totalsnowCm,
    double? avgvisKm,
    double? avgvisMiles,
    double? avghumidity,
    int? dailyWillItRain,
    int? dailyChanceOfRain,
    int? dailyWillItSnow,
    int? dailyChanceOfSnow,
    Condition? condition,
    double? uv,
  }) =>
      Day(
        maxtempC: maxtempC ?? this.maxtempC,
        maxtempF: maxtempF ?? this.maxtempF,
        mdoubleempC: mdoubleempC ?? this.mdoubleempC,
        mdoubleempF: mdoubleempF ?? this.mdoubleempF,
        avgtempC: avgtempC ?? this.avgtempC,
        avgtempF: avgtempF ?? this.avgtempF,
        maxWindMph: maxWindMph ?? this.maxWindMph,
        maxWindKph: maxWindKph ?? this.maxWindKph,
        totalprecipMm: totalprecipMm ?? this.totalprecipMm,
        totalprecipIn: totalprecipIn ?? this.totalprecipIn,
        totalsnowCm: totalsnowCm ?? this.totalsnowCm,
        avgvisKm: avgvisKm ?? this.avgvisKm,
        avgvisMiles: avgvisMiles ?? this.avgvisMiles,
        avghumidity: avghumidity ?? this.avghumidity,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
        dailyWillItSnow: dailyWillItSnow ?? this.dailyWillItSnow,
        dailyChanceOfSnow: dailyChanceOfSnow ?? this.dailyChanceOfSnow,
        condition: condition ?? this.condition,
        uv: uv ?? this.uv,
      );

  factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        maxtempF: json["maxtemp_f"]?.toDouble(),
        mdoubleempC: json["mdoubleemp_c"]?.toDouble(),
        mdoubleempF: json["mdoubleemp_f"]?.toDouble(),
        avgtempC: json["avgtemp_c"],
        avgtempF: json["avgtemp_f"],
        maxWindMph: json["maxwind_mph"]?.toDouble(),
        maxWindKph: json["maxwind_kph"]?.toDouble(),
        totalprecipMm: json["totalprecip_mm"],
        totalprecipIn: json["totalprecip_in"],
        totalsnowCm: json["totalsnow_cm"],
        avgvisKm: json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"],
        avghumidity: json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: Condition.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mdoubleemp_c": mdoubleempC,
        "mdoubleemp_f": mdoubleempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxWindMph,
        "maxwind_kph": maxWindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition.toJson(),
        "uv": uv,
      };
}
