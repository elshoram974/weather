
import 'dart:convert';

class Astro {
    final String sunrise;
    final String sunset;
    final String moonrise;
    final String moonset;
    final String moonPhase;
    final String moonIllumination;
    final int isMoonUp;
    final int isSunUp;

    Astro({
        required this.sunrise,
        required this.sunset,
        required this.moonrise,
        required this.moonset,
        required this.moonPhase,
        required this.moonIllumination,
        required this.isMoonUp,
        required this.isSunUp,
    });

    Astro copyWith({
        String? sunrise,
        String? sunset,
        String? moonrise,
        String? moonset,
        String? moonPhase,
        String? moonIllumination,
        int? isMoonUp,
        int? isSunUp,
    }) => 
        Astro(
            sunrise: sunrise ?? this.sunrise,
            sunset: sunset ?? this.sunset,
            moonrise: moonrise ?? this.moonrise,
            moonset: moonset ?? this.moonset,
            moonPhase: moonPhase ?? this.moonPhase,
            moonIllumination: moonIllumination ?? this.moonIllumination,
            isMoonUp: isMoonUp ?? this.isMoonUp,
            isSunUp: isSunUp ?? this.isSunUp,
        );

    factory Astro.fromRawJson(String str) => Astro.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
    );

    Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
    };
}
