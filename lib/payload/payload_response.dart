import 'dart:convert';

class Payload {
  Payload({
    this.dragon,
    this.name,
    this.type,
    this.reused,
    this.launch,
    this.customers,
    this.noradIds,
    this.nationalities,
    this.manufacturers,
    this.massKg,
    this.orbit,
    this.referenceSystem,
    this.regime,
    this.id,
  });

  Dragon dragon;
  String name;
  String type;
  bool reused;
  String launch;
  List<String> customers;
  List<int> noradIds;
  List<String> nationalities;
  List<String> manufacturers;
  int massKg;
  String orbit;
  String referenceSystem;
  String regime;
  String id;

  factory Payload.fromJson(String str) => Payload.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payload.fromMap(Map<String, dynamic> json) => Payload(
        dragon: Dragon.fromMap(json["dragon"]),
        name: json["name"],
        type: json["type"],
        reused: json["reused"],
        launch: json["launch"],
        customers: List<String>.from(json["customers"].map((x) => x)),
        noradIds: List<int>.from(json["norad_ids"].map((x) => x)),
        nationalities: List<String>.from(json["nationalities"].map((x) => x)),
        manufacturers: List<String>.from(json["manufacturers"].map((x) => x)),
        massKg: json["mass_kg"],
        orbit: json["orbit"],
        referenceSystem: json["reference_system"],
        regime: json["regime"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "dragon": dragon.toMap(),
        "name": name,
        "type": type,
        "reused": reused,
        "launch": launch,
        "customers": List<dynamic>.from(customers.map((x) => x)),
        "norad_ids": List<dynamic>.from(noradIds.map((x) => x)),
        "nationalities": List<dynamic>.from(nationalities.map((x) => x)),
        "manufacturers": List<dynamic>.from(manufacturers.map((x) => x)),
        "mass_kg": massKg,
        "orbit": orbit,
        "reference_system": referenceSystem,
        "regime": regime,
        "id": id,
      };
}

class Dragon {
  Dragon({
    this.capsule,
    this.massReturnedKg,
    this.massReturnedLbs,
    this.flightTimeSec,
    this.manifest,
    this.waterLanding,
    this.landLanding,
  });

  dynamic capsule;
  dynamic massReturnedKg;
  dynamic massReturnedLbs;
  dynamic flightTimeSec;
  dynamic manifest;
  dynamic waterLanding;
  dynamic landLanding;

  factory Dragon.fromJson(String str) => Dragon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dragon.fromMap(Map<String, dynamic> json) => Dragon(
        capsule: json["capsule"],
        massReturnedKg: json["mass_returned_kg"],
        massReturnedLbs: json["mass_returned_lbs"],
        flightTimeSec: json["flight_time_sec"],
        manifest: json["manifest"],
        waterLanding: json["water_landing"],
        landLanding: json["land_landing"],
      );

  Map<String, dynamic> toMap() => {
        "capsule": capsule,
        "mass_returned_kg": massReturnedKg,
        "mass_returned_lbs": massReturnedLbs,
        "flight_time_sec": flightTimeSec,
        "manifest": manifest,
        "water_landing": waterLanding,
        "land_landing": landLanding,
      };
}
