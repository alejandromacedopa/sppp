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

  // Método para imprimir los roles
  static List<Roles> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Roles.fromJson(item)).toList();
  }

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: json["id"] ??
            '', // Proporciona un valor por defecto si es necesario
        name: json["name"] ?? 'Sin nombre', // Valor por defecto
        image: json["image"] ?? '', // Valor por defecto
        route: json["route"] ?? '', // Valor por defecto
        createdAt: DateTime.tryParse(json["created_at"]) ??
            DateTime
                .now(), // Proporciona la fecha actual si el formato es incorrecto
        updatedAt: DateTime.tryParse(json["updated_at"]) ??
            DateTime
                .now(), // Proporciona la fecha actual si el formato es incorrecto
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
