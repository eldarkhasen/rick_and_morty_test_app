class LocationEntity {
  LocationEntity({
    required this.name,
  });

  String name;

  factory LocationEntity.fromJson(Map<String, dynamic> json) => LocationEntity(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}