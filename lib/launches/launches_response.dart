import 'dart:convert';

class Launch {
  Launch({
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.tbd,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.autoUpdate,
    this.launchLibraryId,
    this.failures,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.id,
  });

  Links links;
  dynamic staticFireDateUtc;
  dynamic staticFireDateUnix;
  bool tbd;
  bool net;
  dynamic window;
  String rocket;
  dynamic success;
  String details;
  List<dynamic> crew;
  List<dynamic> ships;
  List<dynamic> capsules;
  List<String> payloads;
  String launchpad;
  bool autoUpdate;
  String launchLibraryId;
  List<dynamic> failures;
  int flightNumber;
  String name;
  DateTime dateUtc;
  int dateUnix;
  DateTime dateLocal;
  String datePrecision;
  bool upcoming;
  List<Core> cores;
  String id;

  static List<Launch> listFromJson(String str) {
    return (json.decode(str) as List)
        ?.map((e) => e == null ? null : Launch.fromMap(e as Map<String, dynamic>))
        ?.toList();
  }

  factory Launch.fromJson(String str) => Launch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Launch.fromMap(Map<String, dynamic> json) => Launch(
        links: Links.fromMap(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"],
        staticFireDateUnix: json["static_fire_date_unix"],
        tbd: json["tbd"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        details: json["details"],
        crew: List<dynamic>.from(json["crew"].map((x) => x)),
        ships: List<dynamic>.from(json["ships"].map((x) => x)),
        capsules: List<dynamic>.from(json["capsules"].map((x) => x)),
        payloads: List<String>.from(json["payloads"].map((x) => x)),
        launchpad: json["launchpad"],
        autoUpdate: json["auto_update"],
        launchLibraryId: json["launch_library_id"],
        failures: List<dynamic>.from(json["failures"].map((x) => x)),
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: List<Core>.from(json["cores"].map((x) => Core.fromMap(x))),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "links": links.toMap(),
        "static_fire_date_utc": staticFireDateUtc,
        "static_fire_date_unix": staticFireDateUnix,
        "tbd": tbd,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "details": details,
        "crew": List<dynamic>.from(crew.map((x) => x)),
        "ships": List<dynamic>.from(ships.map((x) => x)),
        "capsules": List<dynamic>.from(capsules.map((x) => x)),
        "payloads": List<dynamic>.from(payloads.map((x) => x)),
        "launchpad": launchpad,
        "auto_update": autoUpdate,
        "launch_library_id": launchLibraryId,
        "failures": List<dynamic>.from(failures.map((x) => x)),
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": List<dynamic>.from(cores.map((x) => x.toMap())),
        "id": id,
      };
}

class Core {
  Core({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landingAttempt,
    this.landingSuccess,
    this.landingType,
    this.landpad,
  });

  String core;
  int flight;
  bool gridfins;
  bool legs;
  bool reused;
  bool landingAttempt;
  dynamic landingSuccess;
  String landingType;
  dynamic landpad;

  factory Core.fromJson(String str) => Core.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Core.fromMap(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"],
        landpad: json["landpad"],
      );

  Map<String, dynamic> toMap() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type": landingType,
        "landpad": landpad,
      };
}

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ships,
  });

  bool reused;
  bool recoveryAttempt;
  bool recovered;
  List<dynamic> ships;

  factory Fairings.fromJson(String str) => Fairings.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fairings.fromMap(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: List<dynamic>.from(json["ships"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "reused": reused,
        "recovery_attempt": recoveryAttempt,
        "recovered": recovered,
        "ships": List<dynamic>.from(ships.map((x) => x)),
      };
}

class Links {
  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Patch patch;
  Reddit reddit;
  Flickr flickr;
  dynamic presskit;
  dynamic webcast;
  dynamic youtubeId;
  dynamic article;
  String wikipedia;

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        patch: Patch.fromMap(json["patch"]),
        reddit: Reddit.fromMap(json["reddit"]),
        flickr: Flickr.fromMap(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );

  Map<String, dynamic> toMap() => {
        "patch": patch.toMap(),
        "reddit": reddit.toMap(),
        "flickr": flickr.toMap(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
      };
}

class Flickr {
  Flickr({
    this.small,
    this.original,
  });

  List<dynamic> small;
  List<dynamic> original;

  factory Flickr.fromJson(String str) => Flickr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flickr.fromMap(Map<String, dynamic> json) => Flickr(
        small: List<dynamic>.from(json["small"].map((x) => x)),
        original: List<dynamic>.from(json["original"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "small": List<dynamic>.from(small.map((x) => x)),
        "original": List<dynamic>.from(original.map((x) => x)),
      };
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  String small;
  String large;

  factory Patch.fromJson(String str) => Patch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Patch.fromMap(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toMap() => {
        "small": small,
        "large": large,
      };
}

class Reddit {
  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  String campaign;
  dynamic launch;
  dynamic media;
  String recovery;

  factory Reddit.fromJson(String str) => Reddit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reddit.fromMap(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
      );

  Map<String, dynamic> toMap() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
      };
}
