import 'dart:convert';

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localTimeEpoch;
  final String localTime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localTimeEpoch,
    required this.localTime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localTimeEpoch,
    String? localTime,
  }) =>
      Location(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        tzId: tzId ?? this.tzId,
        localTimeEpoch: localTimeEpoch ?? this.localTimeEpoch,
        localTime: localTime ?? this.localTime,
      );

  factory Location.newEmpty() => Location(
        name: '',
        region: '',
        country: '',
        lat: 0.0,
        lon: 0.0,
        tzId: '',
        localTimeEpoch: 0,
        localTime: '',
      );
  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localTimeEpoch: json["localtime_epoch"],
        localTime: json["localtime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localTimeEpoch,
        "localtime": localTime,
      };
}
