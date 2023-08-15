class Search {
    final int id;
    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String url;

    Search({
        required this.id,
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.url,
    });

    Search copyWith({
        int? id,
        String? name,
        String? region,
        String? country,
        double? lat,
        double? lon,
        String? url,
    }) => 
        Search(
            id: id ?? this.id,
            name: name ?? this.name,
            region: region ?? this.region,
            country: country ?? this.country,
            lat: lat ?? this.lat,
            lon: lon ?? this.lon,
            url: url ?? this.url,
        );



    factory Search.fromJson(Map<String, dynamic> json) => Search(
        id: json["id"],
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        url: json["url"],
    );
}
