import 'dart:convert';

class Launchpad {
  Launchpad({
    this.name,
    this.fullName,
    this.locality,
    this.region,
    this.timezone,
    this.latitude,
    this.longitude,
    this.launchAttempts,
    this.launchSuccesses,
    this.rockets,
    this.launches,
    this.status,
    this.id,
  });

  String name;
  String fullName;
  String locality;
  String region;
  String timezone;
  double latitude;
  double longitude;
  int launchAttempts;
  int launchSuccesses;
  List<String> rockets;
  List<String> launches;
  String status;
  String id;

  factory Launchpad.fromJson(String str) => Launchpad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Launchpad.fromMap(Map<String, dynamic> json) => Launchpad(
        name: json["name"],
        fullName: json["full_name"],
        locality: json["locality"],
        region: json["region"],
        timezone: json["timezone"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        launchAttempts: json["launch_attempts"],
        launchSuccesses: json["launch_successes"],
        rockets: List<String>.from(json["rockets"].map((x) => x)),
        launches: List<String>.from(json["launches"].map((x) => x)),
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "full_name": fullName,
        "locality": locality,
        "region": region,
        "timezone": timezone,
        "latitude": latitude,
        "longitude": longitude,
        "launch_attempts": launchAttempts,
        "launch_successes": launchSuccesses,
        "rockets": List<dynamic>.from(rockets.map((x) => x)),
        "launches": List<dynamic>.from(launches.map((x) => x)),
        "status": status,
        "id": id,
      };
}
