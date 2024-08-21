import 'dart:convert';

class CharacterGeneralResponse {
  Info info;
  List<CharactersData> results;

  CharacterGeneralResponse({required this.info, required this.results});

  factory CharacterGeneralResponse.fromJson(Map<String, dynamic> json) {
    return CharacterGeneralResponse(
      info: Info.fromJson(json['info']),
      results: json['results'] != null
          ? (json['results'] as List)
              .map((item) => CharactersData.fromJson(item))
              .toList()
          : [],
    );
  }
}

class CharacterDetailResponse {
  CharacterDetailResponse({
    this.message,
    required this.data,
  });

  final String? message;
  final CharactersData data;

  factory CharacterDetailResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailResponse(
        message: jsonDecode(json["message"]) ?? '',
        data: CharactersData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class CharactersData {
  CharactersData({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  CharacterLocation location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  factory CharactersData.fromJson(Map<String, dynamic> json) => CharactersData(
        id: json['id'],
        name: json['name'] ?? '-',
        status: json['status'] ?? '-',
        species: json['species'] ?? '-',
        type: json['type'] ?? '-',
        gender: json['gender'] ?? '',
        origin: Origin.fromJson(json["origin"] ?? {}),
        location: CharacterLocation.fromJson(json["location"] ?? {}),
        image: json["image"] ?? '',
        episode: json["episode"] != null
            ? List<String>.from(json["episode"].map((x) => x))
            : [''],
        url: json["url"] ?? '',
        created: json["created"] != null
            ? DateTime.parse(json["created"])
            : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<String>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}

class Origin {
  Origin({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Origin.fromJson(Map<String, dynamic> json) => Origin(
        name: json['name'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class CharacterLocation {
  CharacterLocation({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      CharacterLocation(
        name: json['name'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Info {
  int count;
  int pages;
  String next;
  String? prev;

  Info(
      {required this.count,
      required this.pages,
      required this.next,
      required this.prev});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
