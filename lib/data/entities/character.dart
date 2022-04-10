import 'package:rick_and_morty_app/data/entities/location.dart';

class CharacterEntity {
  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  String id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  LocationEntity origin;
  LocationEntity location;
  String image;

  factory CharacterEntity.fromJson(Map<String, dynamic> json) => CharacterEntity(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    species: json["species"],
    type: json["type"],
    gender: json["gender"],
    origin: LocationEntity.fromJson(json["origin"]),
    location: LocationEntity.fromJson(json["location"]),
    image: json["image"],
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
  };
}