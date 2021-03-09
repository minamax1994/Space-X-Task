import 'dart:convert';

class Rocket {
  Rocket({
    this.height,
    this.diameter,
    this.mass,
    this.firstStage,
    this.secondStage,
    this.engines,
    this.landingLegs,
    this.payloadWeights,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.stages,
    this.boosters,
    this.costPerLaunch,
    this.successRatePct,
    this.firstFlight,
    this.country,
    this.company,
    this.wikipedia,
    this.description,
    this.id,
  });

  Diameter height;
  Diameter diameter;
  Mass mass;
  FirstStage firstStage;
  SecondStage secondStage;
  Engines engines;
  LandingLegs landingLegs;
  List<PayloadWeight> payloadWeights;
  List<String> flickrImages;
  String name;
  String type;
  bool active;
  int stages;
  int boosters;
  int costPerLaunch;
  int successRatePct;
  DateTime firstFlight;
  String country;
  String company;
  String wikipedia;
  String description;
  String id;

  factory Rocket.fromJson(String str) => Rocket.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rocket.fromMap(Map<String, dynamic> json) => Rocket(
        height: Diameter.fromMap(json["height"]),
        diameter: Diameter.fromMap(json["diameter"]),
        mass: Mass.fromMap(json["mass"]),
        firstStage: FirstStage.fromMap(json["first_stage"]),
        secondStage: SecondStage.fromMap(json["second_stage"]),
        engines: Engines.fromMap(json["engines"]),
        landingLegs: LandingLegs.fromMap(json["landing_legs"]),
        payloadWeights: List<PayloadWeight>.from(json["payload_weights"].map((x) => PayloadWeight.fromMap(x))),
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        active: json["active"],
        stages: json["stages"],
        boosters: json["boosters"],
        costPerLaunch: json["cost_per_launch"],
        successRatePct: json["success_rate_pct"],
        firstFlight: DateTime.parse(json["first_flight"]),
        country: json["country"],
        company: json["company"],
        wikipedia: json["wikipedia"],
        description: json["description"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "height": height.toMap(),
        "diameter": diameter.toMap(),
        "mass": mass.toMap(),
        "first_stage": firstStage.toMap(),
        "second_stage": secondStage.toMap(),
        "engines": engines.toMap(),
        "landing_legs": landingLegs.toMap(),
        "payload_weights": List<dynamic>.from(payloadWeights.map((x) => x.toMap())),
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "name": name,
        "type": type,
        "active": active,
        "stages": stages,
        "boosters": boosters,
        "cost_per_launch": costPerLaunch,
        "success_rate_pct": successRatePct,
        "first_flight":
            "${firstFlight.year.toString().padLeft(4, '0')}-${firstFlight.month.toString().padLeft(2, '0')}-${firstFlight.day.toString().padLeft(2, '0')}",
        "country": country,
        "company": company,
        "wikipedia": wikipedia,
        "description": description,
        "id": id,
      };
}

class Diameter {
  Diameter({
    this.meters,
    this.feet,
  });

  double meters;
  double feet;

  factory Diameter.fromJson(String str) => Diameter.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Diameter.fromMap(Map<String, dynamic> json) => Diameter(
        meters: json["meters"].toDouble(),
        feet: json["feet"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "meters": meters,
        "feet": feet,
      };
}

class Engines {
  Engines({
    this.isp,
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.number,
    this.type,
    this.version,
    this.layout,
    this.engineLossMax,
    this.propellant1,
    this.propellant2,
    this.thrustToWeight,
  });

  Isp isp;
  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  int number;
  String type;
  String version;
  String layout;
  int engineLossMax;
  String propellant1;
  String propellant2;
  double thrustToWeight;

  factory Engines.fromJson(String str) => Engines.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Engines.fromMap(Map<String, dynamic> json) => Engines(
        isp: Isp.fromMap(json["isp"]),
        thrustSeaLevel: Thrust.fromMap(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromMap(json["thrust_vacuum"]),
        number: json["number"],
        type: json["type"],
        version: json["version"],
        layout: json["layout"],
        engineLossMax: json["engine_loss_max"],
        propellant1: json["propellant_1"],
        propellant2: json["propellant_2"],
        thrustToWeight: json["thrust_to_weight"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "isp": isp.toMap(),
        "thrust_sea_level": thrustSeaLevel.toMap(),
        "thrust_vacuum": thrustVacuum.toMap(),
        "number": number,
        "type": type,
        "version": version,
        "layout": layout,
        "engine_loss_max": engineLossMax,
        "propellant_1": propellant1,
        "propellant_2": propellant2,
        "thrust_to_weight": thrustToWeight,
      };
}

class Isp {
  Isp({
    this.seaLevel,
    this.vacuum,
  });

  int seaLevel;
  int vacuum;

  factory Isp.fromJson(String str) => Isp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Isp.fromMap(Map<String, dynamic> json) => Isp(
        seaLevel: json["sea_level"],
        vacuum: json["vacuum"],
      );

  Map<String, dynamic> toMap() => {
        "sea_level": seaLevel,
        "vacuum": vacuum,
      };
}

class Thrust {
  Thrust({
    this.kN,
    this.lbf,
  });

  int kN;
  int lbf;

  factory Thrust.fromJson(String str) => Thrust.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thrust.fromMap(Map<String, dynamic> json) => Thrust(
        kN: json["kN"],
        lbf: json["lbf"],
      );

  Map<String, dynamic> toMap() => {
        "kN": kN,
        "lbf": lbf,
      };
}

class FirstStage {
  FirstStage({
    this.thrustSeaLevel,
    this.thrustVacuum,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  Thrust thrustSeaLevel;
  Thrust thrustVacuum;
  bool reusable;
  int engines;
  int fuelAmountTons;
  int burnTimeSec;

  factory FirstStage.fromJson(String str) => FirstStage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FirstStage.fromMap(Map<String, dynamic> json) => FirstStage(
        thrustSeaLevel: Thrust.fromMap(json["thrust_sea_level"]),
        thrustVacuum: Thrust.fromMap(json["thrust_vacuum"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"],
        burnTimeSec: json["burn_time_sec"],
      );

  Map<String, dynamic> toMap() => {
        "thrust_sea_level": thrustSeaLevel.toMap(),
        "thrust_vacuum": thrustVacuum.toMap(),
        "reusable": reusable,
        "engines": engines,
        "fuel_amount_tons": fuelAmountTons,
        "burn_time_sec": burnTimeSec,
      };
}

class LandingLegs {
  LandingLegs({
    this.number,
    this.material,
  });

  int number;
  String material;

  factory LandingLegs.fromJson(String str) => LandingLegs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LandingLegs.fromMap(Map<String, dynamic> json) => LandingLegs(
        number: json["number"],
        material: json["material"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "material": material,
      };
}

class Mass {
  Mass({
    this.kg,
    this.lb,
  });

  int kg;
  int lb;

  factory Mass.fromJson(String str) => Mass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mass.fromMap(Map<String, dynamic> json) => Mass(
        kg: json["kg"],
        lb: json["lb"],
      );

  Map<String, dynamic> toMap() => {
        "kg": kg,
        "lb": lb,
      };
}

class PayloadWeight {
  PayloadWeight({
    this.id,
    this.name,
    this.kg,
    this.lb,
  });

  String id;
  String name;
  int kg;
  int lb;

  factory PayloadWeight.fromJson(String str) => PayloadWeight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayloadWeight.fromMap(Map<String, dynamic> json) => PayloadWeight(
        id: json["id"],
        name: json["name"],
        kg: json["kg"],
        lb: json["lb"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "kg": kg,
        "lb": lb,
      };
}

class SecondStage {
  SecondStage({
    this.thrust,
    this.payloads,
    this.reusable,
    this.engines,
    this.fuelAmountTons,
    this.burnTimeSec,
  });

  Thrust thrust;
  Payloads payloads;
  bool reusable;
  int engines;
  int fuelAmountTons;
  int burnTimeSec;

  factory SecondStage.fromJson(String str) => SecondStage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SecondStage.fromMap(Map<String, dynamic> json) => SecondStage(
        thrust: Thrust.fromMap(json["thrust"]),
        payloads: Payloads.fromMap(json["payloads"]),
        reusable: json["reusable"],
        engines: json["engines"],
        fuelAmountTons: json["fuel_amount_tons"],
        burnTimeSec: json["burn_time_sec"],
      );

  Map<String, dynamic> toMap() => {
        "thrust": thrust.toMap(),
        "payloads": payloads.toMap(),
        "reusable": reusable,
        "engines": engines,
        "fuel_amount_tons": fuelAmountTons,
        "burn_time_sec": burnTimeSec,
      };
}

class Payloads {
  Payloads({
    this.compositeFairing,
    this.option1,
  });

  CompositeFairing compositeFairing;
  String option1;

  factory Payloads.fromJson(String str) => Payloads.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payloads.fromMap(Map<String, dynamic> json) => Payloads(
        compositeFairing: CompositeFairing.fromMap(json["composite_fairing"]),
        option1: json["option_1"],
      );

  Map<String, dynamic> toMap() => {
        "composite_fairing": compositeFairing.toMap(),
        "option_1": option1,
      };
}

class CompositeFairing {
  CompositeFairing({
    this.height,
    this.diameter,
  });

  Diameter height;
  Diameter diameter;

  factory CompositeFairing.fromJson(String str) => CompositeFairing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompositeFairing.fromMap(Map<String, dynamic> json) => CompositeFairing(
        height: Diameter.fromMap(json["height"]),
        diameter: Diameter.fromMap(json["diameter"]),
      );

  Map<String, dynamic> toMap() => {
        "height": height.toMap(),
        "diameter": diameter.toMap(),
      };
}
