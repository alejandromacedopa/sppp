class Roles {
  String id;
  String name;
  String image;
  String route;
  DateTime createdAt;
  DateTime updatedAt;

  Roles({
    required this.id,
    required this.name,
    required this.image,
    required this.route,
    required this.createdAt,
    required this.updatedAt,
  });

  static List<Roles> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Roles.fromJson(item)).toList();
  }

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
