import 'package:meta/meta.dart';
import 'dart:convert';

class CharacterGeneralResponse {
  CharacterGeneralResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  List<CharacterData> data;
  String message;
  String status;

  factory CharacterGeneralResponse.fromJson(Map<String, dynamic> json) =>
      CharacterGeneralResponse(
        data: List<CharacterData>.from(
            json["data"].map((x) => CharacterData.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  @override
  String toString() {
    return 'Character{data: $data}';
  }
}

// class CharacterDetailResponse {
//   CharacterDetailResponse({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   final String status;
//   final String message;
//   final CharacterData data;

//   factory CharacterDetailResponse.fromJson(Map<String, dynamic> json) =>
//       CharacterDetailResponse(
//         status: json["status"],
//         message: json["message"],
//         data:
//             json["data"] == null ? null : CharacterData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

class CharacterData {
  CharacterData({
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
  CharacterLocation origin;
  CharacterLocation location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  factory CharacterData.fromJson(Map<String, dynamic> json) => CharacterData(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: CharacterLocation.fromJson(json["origin"]),
        location: CharacterLocation.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
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
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
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
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
